-- ===================================================================
-- ETL - Carga Completa de Todas as Dimensões
-- Este script limpa e recarrega as dimensões do schema 'dw'
-- ===================================================================

-- Limpa todas as dimensões para a recarga
TRUNCATE TABLE dw.Dim_Cliente, dw.Dim_Endereco, dw.Dim_Produto, dw.Dim_Categoria RESTART IDENTITY CASCADE;

-- Carga da Dim_Cliente
INSERT INTO dw.Dim_Cliente (IDCliente_Original, Nome_Cliente, Email_Cliente)
SELECT IDCliente, NomeCliente, EmailCliente
FROM public.Cliente
ORDER BY IDCliente;

-- Carga da Dim_Endereco
INSERT INTO dw.Dim_Endereco (Logradouro, Bairro, Municipio, Nome_UF, Sigla_UF)
SELECT DISTINCT c.Rua, c.Bairro, m.NomeMunicipio, u.NomeUF, u.IDUF
FROM public.Cliente c
JOIN public.Municipio m ON c.IDMunicipio = m.IDMunicipio
JOIN public.UF u ON m.IDUF = u.IDUF;

-- Carga da Dim_Produto
INSERT INTO dw.Dim_Produto (IDProduto_Original, Nome_Produto, Descricao_Produto, Indicacao, Contraindicacao)
SELECT p.IDProduto, p.NomeProduto, p.DescrProd, m.Indicacao, m.Contraindicacao
FROM public.Produto p
LEFT JOIN public.Medicamento m ON p.IDProduto = m.IDProduto
ORDER BY p.IDProduto;

-- Carga da Dim_Categoria
INSERT INTO dw.Dim_Categoria (IDCategoria_Original, Nome_Categoria)
SELECT IDCategoria, NomeCategoria
FROM public.Categoria
ORDER BY IDCategoria;


-- ===================================================================
-- ETL - PASSO FINAL: Carga da Tabela Fato_Receita
-- Este script limpa e recarrega a tabela de fatos.
-- ===================================================================

-- Limpa a tabela fato para a recarga
TRUNCATE TABLE dw.Fato_Receita;

-- Insere os dados na tabela de fatos
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
    -- Chave da transação original
    compra.IDCompra AS IDCompra_Original,
    
    -- encontrando as chaves do DW
    dt.PK_Tempo AS FK_Tempo,
    dc.PK_Cliente AS FK_Cliente,
    dp.PK_Produto AS FK_Produto,
    de.PK_Endereco AS FK_Endereco,
    dcat.PK_Categoria AS FK_Categoria,
    
    -- Métricas 
    compra.Quantidade AS Quantidade_Vendida,
    (compra.Quantidade * prod.PrecVenda) AS Valor_Vendido

FROM
    -- tabela de transações
    public.CliCompraProd AS compra
    
-- JOIN para buscar o preço do produto e calcular o valor da venda
JOIN public.Produto AS prod
    ON compra.IDProduto = prod.IDProduto

-- JOIN para buscar as informações do cliente que fez a compra
JOIN public.Cliente AS cli
    ON compra.IDCliente = cli.IDCliente
    
-- JOIN para buscar as informações de endereço do cliente
JOIN public.Municipio AS mun
    ON cli.IDMunicipio = mun.IDMunicipio
JOIN public.UF AS uf
    ON mun.IDUF = uf.IDUF

-- JOIN para buscar a categoria do produto 
JOIN public.ProdCateg AS pc
    ON prod.IDProduto = pc.IDProduto

-- obtenddo as chaves
JOIN dw.Dim_Tempo AS dt
    ON compra.DataCompra = dt.Data_Completa
    
JOIN dw.Dim_Cliente AS dc
    ON compra.IDCliente = dc.IDCliente_Original
    
JOIN dw.Dim_Produto AS dp
    ON compra.IDProduto = dp.IDProduto_Original

JOIN dw.Dim_Endereco AS de
    ON cli.Rua = de.Logradouro
    AND cli.Bairro = de.Bairro
    AND mun.NomeMunicipio = de.Municipio
    AND uf.NomeUF = de.Nome_UF

JOIN dw.Dim_Categoria AS dcat
    ON pc.IDCategoria = dcat.IDCategoria_Original;


