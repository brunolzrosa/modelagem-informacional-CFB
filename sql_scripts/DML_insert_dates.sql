-- ===================================================================
-- ETL: Carga da Dimensão de Tempo
-- ===================================================================
-- Script que insere todos os dias de 1 de janeiro de 2020 a 31 de dezembro de 2030
-- na tabela Dim_Tempo, já calculando todos os atributos necessários
-- como dia da semana, mês, trimestre e ano.

INSERT INTO dw.Dim_Tempo (
    PK_Tempo,
    Data_Completa,
    Ano,
    Trimestre,
    Mes,
    Nome_Mes,
    Dia_do_Mes,
    Dia_Semana
)
SELECT
    -- Cria uma chave primária numérica no formato YYYYMMDD 
    TO_CHAR(dt, 'YYYYMMDD')::INT AS PK_Tempo,
    
    -- A data completa
    dt AS Data_Completa,
    
    -- Extrai o ANO da data
    EXTRACT(YEAR FROM dt)::INT AS Ano,
    
    -- Extrai o TRIMESTRE da data
    EXTRACT(QUARTER FROM dt)::INT AS Trimestre,
    
    -- Extrai o MÊS da data
    EXTRACT(MONTH FROM dt)::INT AS Mes,
    
    -- Extrai o nome do mês 
    TO_CHAR(dt, 'TMMonth') AS Nome_Mes,
    
    -- Extrai o DIA do mês
    EXTRACT(DAY FROM dt)::INT AS Dia_do_Mes,

    -- Extrai o nome do dia da semana 
    TO_CHAR(dt, 'TMDay') AS Dia_Semana

FROM
    -- Gera uma série de datas, do início ao fim, com intervalo de 1 dia
    generate_series(
        '2020-01-01'::DATE,
        '2030-12-31'::DATE,
        '1 day'::INTERVAL
    ) AS s(dt); --alias