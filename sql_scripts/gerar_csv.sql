-- ===================================================================
-- SCRIPT DE EXPORTAÇÃO PARA CSV 
-- ===================================================================

\copy (
    SELECT
        dt.Data_Completa,
        dt.Ano,
        dt.Mes,
        dc.Nome_Cliente,
        de.Municipio,
        de.Nome_UF AS Estado,
        dp.Nome_Produto,
        dcat.Nome_Categoria,
        fr.Quantidade_Vendida,
        fr.Valor_Vendido
    FROM
        dw.Fato_Receita fr
    JOIN dw.Dim_Tempo dt ON fr.FK_Tempo = dt.PK_Tempo
    JOIN dw.Dim_Cliente dc ON fr.FK_Cliente = dc.PK_Cliente
    JOIN dw.Dim_Endereco de ON fr.FK_Endereco = de.PK_Endereco
    JOIN dw.Dim_Produto dp ON fr.FK_Produto = dp.PK_Produto
    JOIN dw.Dim_Categoria dcat ON fr.FK_Categoria = dcat.PK_Categoria
    ORDER BY
        dt.Data_Completa
) TO 'relatorio_receita.csv' WITH CSV HEADER