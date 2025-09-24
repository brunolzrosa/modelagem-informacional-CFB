-- ==========================================================
-- ==  EXPORTAÇÃO CSV - RELATÓRIO DE RECEITA AGREGADA      ==
-- ==========================================================

\copy (
    SELECT
        cal.DataCompleta,
        cal.Ano,
        cal.NomeMes,
        cli.NomeCliente,
        endr.Municipio,
        endr.UF,
        prod.NomeProduto,
        cat.NomeCategoria,
        f_agreg.ValorReceita AS Valor_Total_Receita_Dia
    FROM
        dw.FatoReceitaAgregada AS f_agreg
    JOIN dw.DimCalendario AS cal ON f_agreg.KeyCalendario = cal.KeyCalendario
    JOIN dw.DimCliente AS cli ON f_agreg.KeyCliente = cli.KeyCliente
    JOIN dw.DimEnderecoCliente AS endr ON f_agreg.KeyEnderecoCliente = endr.KeyEnderecoCliente
    JOIN dw.DimProduto AS prod ON f_agreg.KeyProduto = prod.KeyProduto
    JOIN dw.DimCategoria AS cat ON f_agreg.KeyCategoria = cat.KeyCategoria
    ORDER BY
        cal.DataCompleta,
        cli.NomeCliente
) TO 'relatorio_receita_agregado.csv' WITH CSV HEADER;