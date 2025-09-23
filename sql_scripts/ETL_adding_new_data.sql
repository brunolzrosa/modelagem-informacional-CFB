-- ===================================================================
-- ETL - Carga INCREMENTAL do Data Warehouse (Versão Otimizada)
-- Este script insere novos registros e atualiza existentes
-- ===================================================================

-- ========================
-- Carga Incremental das Dimensões
-- ========================

-- Carga da Dim_Cliente
INSERT INTO dw.Dim_Cliente (IDCliente_Original, Nome_Cliente, Email_Cliente)
SELECT IDCliente, NomeCliente, EmailCliente FROM public.Cliente
ON CONFLICT (IDCliente_Original) DO UPDATE SET
    Nome_Cliente = EXCLUDED.Nome_Cliente,
    Email_Cliente = EXCLUDED.Email_Cliente
WHERE
    dw.Dim_Cliente.Nome_Cliente IS DISTINCT FROM EXCLUDED.Nome_Cliente
    OR dw.Dim_Cliente.Email_Cliente IS DISTINCT FROM EXCLUDED.Email_Cliente;

-- Carga da Dim_Endereco
INSERT INTO dw.Dim_Endereco (Logradouro, Bairro, Municipio, Nome_UF, Sigla_UF)
SELECT DISTINCT c.Rua, c.Bairro, m.NomeMunicipio, u.NomeUF, u.IDUF
FROM public.Cliente c
JOIN public.Municipio m ON c.IDMunicipio = m.IDMunicipio
JOIN public.UF u ON m.IDUF = u.IDUF
ON CONFLICT (Logradouro, Bairro, Municipio, Sigla_UF) DO NOTHING; -- Se o endereço já existe, não faz nada.

-- Carga da Dim_Produto
INSERT INTO dw.Dim_Produto (IDProduto_Original, Nome_Produto, Descricao_Produto, Indicacao, Contraindicacao)
SELECT p.IDProduto, p.NomeProduto, p.DescrProd, m.Indicacao, m.Contraindicacao
FROM public.Produto p
LEFT JOIN public.Medicamento m ON p.IDProduto = m.IDProduto
ON CONFLICT (IDProduto_Original) DO UPDATE SET
    Nome_Produto = EXCLUDED.Nome_Produto,
    Descricao_Produto = EXCLUDED.Descricao_Produto,
    Indicacao = EXCLUDED.Indicacao,
    Contraindicacao = EXCLUDED.Contraindicacao
WHERE
    dw.Dim_Produto.Nome_Produto IS DISTINCT FROM EXCLUDED.Nome_Produto
    OR dw.Dim_Produto.Descricao_Produto IS DISTINCT FROM EXCLUDED.Descricao_Produto
    OR dw.Dim_Produto.Indicacao IS DISTINCT FROM EXCLUDED.Indicacao
    OR dw.Dim_Produto.Contraindicacao IS DISTINCT FROM EXCLUDED.Contraindicacao;

-- Carga da Dim_Categoria
INSERT INTO dw.Dim_Categoria (IDCategoria_Original, Nome_Categoria)
SELECT IDCategoria, NomeCategoria FROM public.Categoria
ON CONFLICT (IDCategoria_Original) DO UPDATE SET
    Nome_Categoria = EXCLUDED.Nome_Categoria
WHERE
    dw.Dim_Categoria.Nome_Categoria IS DISTINCT FROM EXCLUDED.Nome_Categoria;


-- ===================================================================
-- Carga Incremental da Tabela Fato_Receita
-- ===================================================================

INSERT INTO dw.Fato_Receita (
    IDCompra_Original,
    FK_Tempo,
    FK_Cliente,
    FK_Produto,
    FK_Endereco,
    FK_Categoria,
    Quantidade_Vendida,
    Valor_Vendido
)
SELECT
    compra.IDCompra AS IDCompra_Original,
    dt.PK_Tempo AS FK_Tempo,
    dc.PK_Cliente AS FK_Cliente,
    dp.PK_Produto AS FK_Produto,
    de.PK_Endereco AS FK_Endereco,
    dcat.PK_Categoria AS FK_Categoria,
    compra.Quantidade AS Quantidade_Vendida,
    (compra.Quantidade * prod.PrecVenda) AS Valor_Vendido
FROM
    public.CliCompraProd AS compra
JOIN public.Produto AS prod ON compra.IDProduto = prod.IDProduto
JOIN public.Cliente AS cli ON compra.IDCliente = cli.IDCliente
JOIN public.Municipio AS mun ON cli.IDMunicipio = mun.IDMunicipio
JOIN public.UF AS uf ON mun.IDUF = uf.IDUF
JOIN public.ProdCateg AS pc ON prod.IDProduto = pc.IDProduto

-- Joins com as Dimensões para buscar as chaves corretas do DW
JOIN dw.Dim_Tempo AS dt ON compra.DataCompra = dt.Data_Completa
JOIN dw.Dim_Cliente AS dc ON compra.IDCliente = dc.IDCliente_Original
JOIN dw.Dim_Produto AS dp ON compra.IDProduto = dp.IDProduto_Original
JOIN dw.Dim_Endereco AS de ON cli.Rua = de.Logradouro AND cli.Bairro = de.Bairro AND mun.NomeMunicipio = de.Municipio AND uf.NomeUF = de.Nome_UF
JOIN dw.Dim_Categoria AS dcat ON pc.IDCategoria = dcat.IDCategoria_Original

-- Lógica de UPSERT para a tabela de Fatos
ON CONFLICT (IDCompra_Original) DO UPDATE SET
    -- Se uma compra for alterada na origem (ex: quantidade), atualiza-se as métricas
    Quantidade_Vendida = EXCLUDED.Quantidade_Vendida,
    Valor_Vendido = EXCLUDED.Valor_Vendido
WHERE
    dw.Fato_Receita.Quantidade_Vendida IS DISTINCT FROM EXCLUDED.Quantidade_Vendida
    OR dw.Fato_Receita.Valor_Vendido IS DISTINCT FROM EXCLUDED.Valor_Vendido;

    