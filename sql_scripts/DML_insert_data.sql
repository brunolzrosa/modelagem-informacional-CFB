-- ===================================================================
-- SCRIPT DML INICIAL 
-- ===================================================================

-- Bloco 1: Tabelas independentes
INSERT INTO public.UF (IDUF, NomeUF) VALUES
('AC', 'Acre'), ('AL', 'Alagoas'), ('AP', 'Amapá'), ('AM', 'Amazonas'), ('BA', 'Bahia'), ('CE', 'Ceará'), ('DF', 'Distrito Federal'), ('ES', 'Espírito Santo'), ('GO', 'Goiás'), ('MA', 'Maranhão'), ('MT', 'Mato Grosso'), ('MS', 'Mato Grosso do Sul'), ('MG', 'Minas Gerais'), ('PA', 'Pará'), ('PB', 'Paraíba'), ('PR', 'Paraná'), ('PE', 'Pernambuco'), ('PI', 'Piauí'), ('RJ', 'Rio de Janeiro'), ('RN', 'Rio Grande do Norte'), ('RS', 'Rio Grande do Sul'), ('RO', 'Rondônia'), ('RR', 'Roraima'), ('SC', 'Santa Catarina'), ('SP', 'São Paulo'), ('SE', 'Sergipe'), ('TO', 'Tocantins');

INSERT INTO public.municipio (NomeMunicipio, IDUF) VALUES
-- SÃO PAULO (SP)
('São Paulo', 'SP'), ('Guarulhos', 'SP'), ('Campinas', 'SP'), ('São Bernardo do Campo', 'SP'),
('Santo André', 'SP'), ('Osasco', 'SP'), ('São José dos Campos', 'SP'), ('Sorocaba', 'SP'),
('Ribeirão Preto', 'SP'), ('Santos', 'SP'), ('São Carlos', 'SP'),

-- RIO DE JANEIRO (RJ)
('Rio de Janeiro', 'RJ'), ('São Gonçalo', 'RJ'), ('Duque de Caxias', 'RJ'), ('Nova Iguaçu', 'RJ'),
('Niterói', 'RJ'), ('Belford Roxo', 'RJ'), ('Campos dos Goytacazes', 'RJ'), ('Petrópolis', 'RJ'),
('Volta Redonda', 'RJ'),

-- MINAS GERAIS (MG)
('Belo Horizonte', 'MG'), ('Uberlândia', 'MG'), ('Contagem', 'MG'), ('Juiz de Fora', 'MG'),
('Betim', 'MG'), ('Montes Claros', 'MG'), ('Uberaba', 'MG'), ('Governador Valadares', 'MG'),
('Varginha', 'MG'),

-- ESPÍRITO SANTO (ES)
('Vitória', 'ES'), ('Vila Velha', 'ES'), ('Serra', 'ES'), ('Cariacica', 'ES'),
('Guarapari', 'ES'),

-- PARANÁ (PR)
('Curitiba', 'PR'), ('Londrina', 'PR'), ('Maringá', 'PR'), ('Ponta Grossa', 'PR'),
('Cascavel', 'PR'), ('Foz do Iguaçu', 'PR'),

-- SANTA CATARINA (SC)
('Florianópolis', 'SC'), ('Joinville', 'SC'), ('Blumenau', 'SC'), ('São José', 'SC'),
('Chapecó', 'SC'), ('Criciúma', 'SC'),

-- RIO GRANDE DO SUL (RS)
('Porto Alegre', 'RS'), ('Caxias do Sul', 'RS'), ('Canoas', 'RS'), ('Pelotas', 'RS'),
('Santa Maria', 'RS'), ('Gravataí', 'RS');

INSERT INTO public.Categoria (NomeCategoria) VALUES ('Analgesicos'), ('Antibióticos'), ('Vacinas');
INSERT INTO public.Enfermidades (NomeEnferm, DescrEnferm) VALUES ('Hipertensão', 'Pressão arterial elevada'), ('Diabetes', 'Controle de glicose elevado');


WITH novos_clientes AS (
    INSERT INTO Cliente (NomeCliente, EmailCliente, Senha, Rua, Bairro, IDMunicipio) VALUES
    ('Anderson Silva', 'anderson.silva@email.com', 'senha123', 'Rua das Flores, 100', 'Centro', 1),
    ('Ana Souza', 'ana.souza@email.com', 'senha123', 'Avenida Brasil, 250', 'Jardim', 3),
    ('Carlos Pereira', 'carlos.pereira@email.com', 'senha123', 'Rua do Sol, 75', 'Boa Vista', 5)
    RETURNING IDCliente, NomeCliente
),
telefones_clientes AS (
    INSERT INTO Cliente_TelefoneCliente (IDCliente, TelefoneCliente)
    SELECT nc.IDCliente, CASE nc.NomeCliente WHEN 'Anderson Silva' THEN '11999990001' WHEN 'Ana Souza' THEN '11999990002' WHEN 'Carlos Pereira' THEN '11999990003' END
    FROM novos_clientes nc
),
enfermidades_clientes AS (
    INSERT INTO CliEnferm (IDCliente, IDEnfermidade, DtCadEnferm)
    SELECT nc.IDCliente, e.IDEnfermidade, '2025-01-15'::date
    FROM novos_clientes nc, Enfermidades e
    WHERE (nc.NomeCliente = 'Anderson Silva' AND e.NomeEnferm = 'Hipertensão') OR (nc.NomeCliente = 'Ana Souza' AND e.NomeEnferm = 'Diabetes')
),
novos_fornecedores AS (
    INSERT INTO Fornecedor (NomeFornecedor, CNPJ) VALUES ('Farmácia Central', '12.345.678/0001-90'), ('Distribuidora Saúde', '98.765.432/0001-12')
    RETURNING IDFornecedor, NomeFornecedor
),
telefones_fornecedores AS (
    INSERT INTO Fornecedor_Telefone (IDFornecedor, Telefone)
    SELECT nf.IDFornecedor, CASE nf.NomeFornecedor WHEN 'Farmácia Central' THEN '1133334444' WHEN 'Distribuidora Saúde' THEN '1144445555' END
    FROM novos_fornecedores nf
),
novos_estoques AS (
    INSERT INTO Estoque (IDMunicipio) VALUES (1), (3), (5) RETURNING IDEstoque
)
INSERT INTO FornEstoque (IDFornecedor, IDEstoque, PrecoCompra) VALUES
(1, 1, 3.50), (2, 2, 8.00), (1, 3, 30.00);


WITH novos_produtos AS (
    INSERT INTO Produto (NomeProduto, DescrProd, PrecVenda, DtValidade, IDEstoque) VALUES
    ('Paracetamol 500mg', 'Comprimidos para dor e febre', 5.50, '2026-12-31', 1),
    ('Amoxicilina 500mg', 'Antibiótico para infecções bacterianas', 12.75, '2025-10-30', 2),
    ('Vacina Influenza 2025', 'Vacina contra gripe sazonal', 50.00, '2026-03-31', 3)
    RETURNING IDProduto, NomeProduto, IDEstoque
),
novos_medicamentos AS (
    INSERT INTO Medicamento (IDProduto, Indicacao, Contraindicacao)
    SELECT np.IDProduto,
        CASE np.NomeProduto WHEN 'Paracetamol 500mg' THEN 'Dor de cabeça, febre' WHEN 'Amoxicilina 500mg' THEN 'Infecções bacterianas' END,
        CASE np.NomeProduto WHEN 'Paracetamol 500mg' THEN 'Alergia ao paracetamol' WHEN 'Amoxicilina 500mg' THEN 'Alergia a penicilinas' END
    FROM novos_produtos np WHERE np.NomeProduto IN ('Paracetamol 500mg', 'Amoxicilina 500mg')
),
produtos_categorizados AS (
    INSERT INTO ProdCateg (IDProduto, IDCategoria)
    SELECT np.IDProduto, cat.IDCategoria
    FROM novos_produtos np, Categoria cat
    WHERE (np.NomeProduto = 'Paracetamol 500mg' AND cat.NomeCategoria = 'Analgesicos')
       OR (np.NomeProduto = 'Amoxicilina 500mg' AND cat.NomeCategoria = 'Antibióticos')
       OR (np.NomeProduto = 'Vacina Influenza 2025' AND cat.NomeCategoria = 'Vacinas')
),

novas_prateleiras AS (
    INSERT INTO Prateleira (IDEstoque) VALUES
    (1), (1),
    (2), (2),
    (3)      
    RETURNING IDPrateleira, IDEstoque
),
produtos_na_prateleira AS (
    INSERT INTO ProdutoPrateleira (IDProduto, IDPrateleira, QuantidadeProduto)
    SELECT
        p.IDProduto,
        pr.IDPrateleira,
        CASE p.NomeProduto
            WHEN 'Paracetamol 500mg' THEN 200 
            WHEN 'Amoxicilina 500mg' THEN 150 
            WHEN 'Vacina Influenza 2025' THEN 50   
        END
    FROM novos_produtos p
    JOIN (SELECT IDEstoque, MIN(IDPrateleira) as PrimeiraPrateleira FROM novas_prateleiras GROUP BY IDEstoque) pr_map
      ON p.IDEstoque = pr_map.IDEstoque
    JOIN novas_prateleiras pr ON pr.IDPrateleira = pr_map.PrimeiraPrateleira
)


INSERT INTO CliCompraProd (DataCompra, Quantidade, IDCliente, IDProduto)
SELECT
    CASE c.NomeCliente
        WHEN 'Anderson Silva' THEN '2025-09-01'::date
        WHEN 'Ana Souza' THEN '2025-09-02'::date
        WHEN 'Carlos Pereira' THEN '2025-09-03'::date
    END,
    CASE c.NomeCliente WHEN 'Anderson Silva' THEN 2 ELSE 1 END,
    c.IDCliente,
    p.IDProduto
FROM Cliente c, Produto p
WHERE (c.NomeCliente = 'Anderson Silva' AND p.NomeProduto = 'Paracetamol 500mg')
   OR (c.NomeCliente = 'Ana Souza' AND p.NomeProduto = 'Amoxicilina 500mg')
   OR (c.NomeCliente = 'Carlos Pereira' AND p.NomeProduto = 'Vacina Influenza 2025');
