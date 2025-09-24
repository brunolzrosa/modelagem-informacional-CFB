-- ==========================================================
-- ==  EXPORTAÇÃO CSV - RELATÓRIO DE RECEITA DETALHADA     ==
-- ==========================================================

\copy (
    SELECT
        f_detalhe.IDPedido,
        f_detalhe.HoraDoDia AS Data_Hora_Compra,
        cal.DataCompleta AS Dia_Da_Compra,
        cli.NomeCliente,
        endr.Municipio,
        endr.UF,
        prod.NomeProduto,
        cat.NomeCategoria,
        f_detalhe.QtdProdutosVendidos,
        f_detalhe.ValorReceita
    FROM
        dw.FatoReceitaDetalhada AS f_detalhe
    JOIN dw.DimCalendario AS cal ON f_detalhe.KeyCalendario = cal.KeyCalendario
    JOIN dw.DimCliente AS cli ON f_detalhe.KeyCliente = cli.KeyCliente
    JOIN dw.DimEnderecoCliente AS endr ON f_detalhe.KeyEnderecoCliente = endr.KeyEnderecoCliente
    JOIN dw.DimProduto AS prod ON f_detalhe.KeyProduto = prod.KeyProduto
    JOIN dw.DimCategoria AS cat ON f_detalhe.KeyCategoria = cat.KeyCategoria
    ORDER BY
        f_detalhe.HoraDoDia
) TO 'relatorio_receita_detalhado.csv' WITH CSV HEADER;