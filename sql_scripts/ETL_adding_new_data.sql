-- ===================================================================
-- ETL - Carga Completa de Todas as Dimensões
-- Este script limpa e recarrega as dimensões do schema 'dw'
-- ===================================================================

-- Limpa todas as dimensões para a recarga
TRUNCATE TABLE dw.Dim_Cliente, dw.Dim_Endereco, dw.Dim_Produto, dw.Dim_Categoria RESTART IDENTITY;

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