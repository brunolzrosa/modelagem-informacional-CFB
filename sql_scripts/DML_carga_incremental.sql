-- ====================================================================================
-- SCRIPT MESTRE DE POPULAÇÃO DA BASE DE DADOS TRANSACIONAL 
-- ====================================================================================

-- Bloco 1: Categorias 
-- Insere todas as categorias de uma vez. Se uma já existir, ela é ignorada.
INSERT INTO public.Categoria (NomeCategoria) VALUES
('Analgesicos'), ('Antibióticos'), ('Vacinas'), ('Anti-inflamatórios'),
('Vitaminas'), ('Equipamentos Médicos'), ('Higiene Pessoal'), ('Dermocosméticos'),
('Primeiros Socorros'), ('Nutrição Esportiva'), ('Saúde Infantil'),
('Medicamentos Controlados'), ('Saúde da Mulher'), ('Saúde do Homem'),
('Produtos Ortopédicos'), ('Diet & Light'), ('Cabelos e Unhas'),
('Aparelhos de Pressão'), ('Termômetros'), ('Glicosímetros e Tiras'),
('Fórmulas Infantis'), ('Fraldas e Lenços Umedecidos'), ('Cuidados com o Bebê'),
('Suplementos Alimentares'), ('Fitoterápicos'), ('Produtos Naturais e Orgânicos'),
('Antialérgicos'), ('Relaxantes Musculares'), ('Saúde Ocular e Colírios'),
('Saúde Digestiva'), ('Cardiovasculares'), ('Proteção Solar'),
('Cuidados com os Pés'), ('Higiene Bucal Avançada'), ('Repelentes e Inseticidas'),
('Maquiagem e Acessórios'), ('Cuidados Faciais'), ('Cuidados Corporais'),
('Conveniência e Alimentos'), ('Acessórios de Saúde'), ('Óleos Essenciais e Aromaterapia'),
('Produtos Geriátricos'), ('Lentes de Contato e Soluções'), ('Homeopatia'),
('Controle de Peso'), ('Cremes e Loções'), ('Antissépticos e Curativos')
ON CONFLICT (NomeCategoria) DO NOTHING;


-- Bloco 2: Fornecedores 
-- Insere os fornecedores. Se um CNPJ já existir, ele é ignorado.
INSERT INTO public.Fornecedor (NomeFornecedor, CNPJ) VALUES
('Med-Log Distribuidora', '25.159.753/0001-01'),
('GlobalPharma Suprimentos', '88.456.123/0001-02'),
('BioGen Laboratórios', '14.789.654/0001-03'),
('Precisão Equipamentos Médicos', '36.987.412/0001-04'),
('VitaPlus Vitaminas e Suplementos', '47.123.654/0001-05'),
('União Química Farmacêutica', '60.665.981/0001-18'),
('Eurofarma Laboratórios S.A.', '61.190.096/0001-92'),
('Cimed Indústria de Medicamentos', '02.814.497/0001-99')
ON CONFLICT (CNPJ) DO NOTHING;


-- Bloco 3: Estoques 
-- Insere os múltiplos locais de estoque.
INSERT INTO public.Estoque (IDMunicipio) VALUES
(48), (23), (9), (35), (1), (3), (5), (7), (11), (13), (15), (17), (19),
(21), (25), (27), (29), (31), (33), (39), (47);


-- Bloco 4: Clientes
-- Insere os 50 clientes. Se um email já existir, ele é ignorado.
INSERT INTO public.Cliente (NomeCliente, EmailCliente, Senha, Rua, Bairro, IDMunicipio) VALUES
('Helena Martins', 'helena.martins@email.com', 'senha123', 'Rua das Gaivotas, 101', 'Jardim Oceânico', 35),
('Miguel Pereira', 'miguel.pereira@email.com', 'senha123', 'Avenida das Américas, 202', 'Barra da Tijuca', 35),
('Alice Ferreira', 'alice.ferreira@email.com', 'senha123', 'Rua Visconde de Pirajá, 303', 'Ipanema', 35),
('Arthur Rodrigues', 'arthur.rodrigues@email.com', 'senha123', 'Travessa das Laranjeiras, 404', 'Laranjeiras', 35),
('Laura Almeida', 'laura.almeida@email.com', 'senha123', 'Rua do Catete, 505', 'Catete', 35),
('Heitor Lima', 'heitor.lima@email.com', 'senha123', 'Avenida Atlântica, 606', 'Copacabana', 35),
('Manuela Barbosa', 'manuela.barbosa@email.com', 'senha123', 'Rua Augusta, 707', 'Consolação', 48),
('Bernardo Gonçalves', 'bernardo.goncalves@email.com', 'senha123', 'Avenida Brigadeiro Faria Lima, 808', 'Jardim Paulistano', 48),
('Valentina Ribeiro', 'valentina.ribeiro@email.com', 'senha123', 'Rua Oscar Freire, 909', 'Jardins', 48),
('Davi Nogueira', 'davi.nogueira@email.com', 'senha123', 'Alameda Santos, 1010', 'Cerqueira César', 48),
('Sophia Mendes', 'sophia.mendes@email.com', 'senha123', 'Rua da Consolação, 1111', 'Consolação', 48),
('Theo Cavalcanti', 'theo.cavalcanti@email.com', 'senha123', 'Avenida Ipiranga, 1212', 'República', 48),
('Isabella Santos', 'isabella.santos@email.com', 'senha123', 'Praça da Sé, 1313', 'Sé', 48),
('Lorenzo Silva', 'lorenzo.silva@email.com', 'senha123', 'Rua 25 de Março, 1414', 'Sé', 48),
('Júlia Oliveira', 'julia.oliveira@email.com', 'senha123', 'Avenida Tiradentes, 1515', 'Luz', 48),
('Pedro Souza', 'pedro.souza@email.com', 'senha123', 'Rua Direita, 1616', 'Sé', 48),
('Luiza Costa', 'luiza.costa@email.com', 'senha123', 'Largo do Arouche, 1717', 'República', 48),
('Gabriel Pereira', 'gabriel.pereira@email.com', 'senha123', 'Avenida São João, 1818', 'Centro', 48),
('Maria Clara Rodrigues', 'mariaclara.rodrigues@email.com', 'senha123', 'Rua Sete de Setembro, 1919', 'Centro', 35),
('Lucas Ferreira', 'lucas.ferreira@email.com', 'senha123', 'Avenida Rio Branco, 2020', 'Centro', 35),
('Beatriz Almeida', 'beatriz.almeida@email.com', 'senha123', 'Rua do Ouvidor, 2121', 'Centro', 35),
('Matheus Lima', 'matheus.lima@email.com', 'senha123', 'Praça XV de Novembro, 2222', 'Centro', 35),
('Yasmin Barbosa', 'yasmin.barbosa@email.com', 'senha123', 'Avenida Presidente Vargas, 2323', 'Centro', 35),
('Nicolas Gonçalves', 'nicolas.goncalves@email.com', 'senha123', 'Rua Uruguaiana, 2424', 'Centro', 35),
('Mariana Ribeiro', 'mariana.ribeiro@email.com', 'senha123', 'Largo da Carioca, 2525', 'Centro', 35),
('Rafael Nogueira', 'rafael.nogueira@email.com', 'senha123', 'Rua da Alfândega, 2626', 'Centro', 35),
('Lívia Mendes', 'livia.mendes@email.com', 'senha123', 'Avenida Passos, 2727', 'Centro', 35),
('Guilherme Cavalcanti', 'guilherme.cavalcanti@email.com', 'senha123', 'Rua Sete de Abril, 2828', 'República', 48),
('Letícia Santos', 'leticia.santos@email.com', 'senha123', 'Praça da República, 2929', 'República', 48),
('Enzo Silva', 'enzo.silva@email.com', 'senha123', 'Rua Barão de Itapetininga, 3030', 'República', 48),
('Ana Júlia Oliveira', 'anajulia.oliveira@email.com', 'senha123', 'Avenida Vieira de Carvalho, 3131', 'República', 48),
('Bruno Souza', 'bruno.souza@email.com', 'senha123', 'Largo do Paissandu, 3232', 'República', 48),
('Melissa Costa', 'melissa.costa@email.com', 'senha123', 'Rua Dom José de Barros, 3333', 'República', 48),
('Emanuel Pereira', 'emanuel.pereira@email.com', 'senha123', 'Rua 24 de Maio, 3434', 'República', 48),
('Sarah Rodrigues', 'sarah.rodrigues@email.com', 'senha123', 'Avenida Cásper Líbero, 3535', 'Luz', 48),
('Cauã Almeida', 'caua.almeida@email.com', 'senha123', 'Rua Washington Luís, 3636', 'Luz', 48),
('Esther Lima', 'esther.lima@email.com', 'senha123', 'Praça da Luz, 3737', 'Luz', 48),
('Isaac Barbosa', 'isaac.barbosa@email.com', 'senha123', 'Rua Mauá, 3838', 'Luz', 48),
('Rebeca Gonçalves', 'rebeca.goncalves@email.com', 'senha123', 'Rua Santa Ifigênia, 3939', 'Santa Efigênia', 48),
('Daniel Ribeiro', 'daniel.ribeiro@email.com', 'senha123', 'Rua dos Timbiras, 4040', 'Santa Efigênia', 48),
('Elisa Nogueira', 'elisa.nogueira@email.com', 'senha123', 'Avenida Ipiranga, 4141', 'Santa Efigênia', 48),
('Calebe Mendes', 'calebe.mendes@email.com', 'senha123', 'Rua dos Gusmões, 4242', 'Santa Efigênia', 48),
('Antonella Cavalcanti', 'antonella.cavalcanti@email.com', 'senha123', 'Alameda Barão de Limeira, 4343', 'Santa Efigênia', 48),
('Rodrigo Santos', 'rodrigos.santos@email.com', 'senha123', 'Rua Helvétia, 4444', 'Santa Efigênia', 48),
('Isabelly Silva', 'isabelly.silva@email.com', 'senha123', 'Avenida Duque de Caxias, 4545', 'Santa Efigênia', 48),
('Benjamin Oliveira', 'benjamin.oliveira@email.com', 'senha123', 'Largo Coração de Jesus, 4646', 'Santa Efigênia', 48),
('Clarice Souza', 'clarice.souza@email.com', 'senha123', 'Alameda Glete, 4747', 'Santa Efigênia', 48),
('Sebastião Costa', 'sebastiao.costa@email.com', 'senha123', 'Rua das Palmeiras, 4848', 'Santa Cecília', 48),
('Lavínia Pereira', 'lavinia.pereira@email.com', 'senha123', 'Rua Martim Francisco, 4949', 'Santa Cecília', 48)
ON CONFLICT (EmailCliente) DO NOTHING;


-- Este bloco insere produtos variados e os conecta às categorias e medicamentos.
WITH novosprodutos AS (
    INSERT INTO public.Produto (NomeProduto, DescrProd, PrecVenda, DtValidade, IDEstoque) VALUES
    ('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2027-01-31', 4),
    ('Creme Hidratante Corporal', 'Hidratação profunda para peles secas.', 32.50, '2026-06-30', 5),
    ('Kit de Curativos Avançado', 'Contém band-aids, gaze, antisséptico e esparadrapo.', 25.00, '2028-01-01', 6),
    ('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2026-10-31', 7),
    ('Shampoo Anticaspa', 'Controle eficaz da caspa e oleosidade.', 28.90, '2025-12-31', 8),
    ('Termômetro Digital Infravermelho', 'Medição de temperatura sem contato.', 99.90, '2030-01-01', 9),
    ('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2027-03-31', 10),
    ('Tiras para Glicosímetro (50 un)', 'Tiras reagentes para medição de glicose.', 65.00, '2026-09-30', 11),
    ('Colírio Lubrificante', 'Alívio para olhos secos e irritados.', 22.00, '2025-08-31', 12),
    ('Relaxante Muscular 20cp', 'Indicado para dores e contraturas musculares.', 18.50, '2026-11-30', 13),
    ('Repelente de Insetos Loção', 'Proteção prolongada contra mosquitos.', 19.90, '2027-02-28', 14),
    ('Protetor Labial com Manteiga de Cacau', 'Hidrata e protege os lábios.', 8.50, '2026-07-31', 15),
    ('Fio Dental Menta 50m', 'Fio dental encerado com sabor de menta.', 6.80, '2028-05-31', 16),
    ('Sabonete Líquido Antisséptico', 'Limpeza profunda e proteção contra bactérias.', 12.30, '2026-04-30', 17),
    ('Multivitamínico A-Z Homem', 'Complexo vitamínico para a saúde masculina.', 49.90, '2025-10-31', 18),
    ('Creme para Assaduras', 'Proteção e tratamento para a pele do bebê.', 21.75, '2026-08-31', 19),
    ('Gel para Dores Musculares', 'Gel de massagem para alívio de dores e cansaço.', 35.40, '2027-01-31', 20),
    ('Barra de Proteína Chocolate', 'Lanche prático e nutritivo com 15g de proteína.', 9.00, '2025-07-31', 21),
    ('Água Micelar de Limpeza Facial', 'Limpa, demaquila e purifica a pele.', 42.00, '2026-02-28', 22),
    ('Tala para Punho Ajustável', 'Suporte e imobilização para o punho.', 55.80, '2030-01-01', 23),
    ('Dorflex 36cp', 'Analgésico e relaxante muscular.', 23.50, '2026-12-31', 4),
    ('Neosaldina 30 drágeas', 'Analgésico para dores de cabeça.', 29.90, '2027-01-31', 5),
    ('Escova de Dentes Macia', 'Escova com cerdas macias para gengivas sensíveis.', 14.20, '2029-01-01', 6),
    ('Creme Dental Branqueador', 'Auxilia no clareamento dos dentes.', 9.50, '2026-03-31', 7),
    ('Cálcio + Vitamina D3', 'Suplemento para fortalecimento dos ossos.', 38.00, '2025-11-30', 8),
    ('Antisséptico Bucal Menta Suave', 'Hálito fresco e proteção contra germes.', 25.50, '2026-05-31', 7),
    ('Melatonina 0.21mg', 'Suplemento para auxiliar na indução do sono.', 45.00, '2026-01-31', 11)
    RETURNING IDProduto, NomeProduto
),
novosmedicamentos AS (
    INSERT INTO public.Medicamento (IDProduto, Indicacao, Contraindicacao)
    SELECT np.IDProduto,
        CASE np.NomeProduto
            WHEN 'Colírio Lubrificante' THEN 'Olhos secos e irritação.' WHEN 'Relaxante Muscular 20cp' THEN 'Dores musculares, torcicolo.'
            WHEN 'Dorflex 36cp' THEN 'Dores de cabeça tensionais.' WHEN 'Neosaldina 30 drágeas' THEN 'Enxaquecas e dores de cabeça.'
            WHEN 'Cálcio + Vitamina D3' THEN 'Prevenção da osteoporose.' WHEN 'Melatonina 0.21mg' THEN 'Insônia ocasional.'
        END,
        CASE np.NomeProduto
            WHEN 'Colírio Lubrificante' THEN 'Alergia a componentes da fórmula.' WHEN 'Relaxante Muscular 20cp' THEN 'Glaucoma, miastenia grave.'
            WHEN 'Dorflex 36cp' THEN 'Alergia a dipirona, glaucoma.' WHEN 'Neosaldina 30 drágeas' THEN 'Pressão alta, alergia a componentes.'
            WHEN 'Cálcio + Vitamina D3' THEN 'Hipercalcemia.' WHEN 'Melatonina 0.21mg' THEN 'Gravidez, lactação.'
        END
    FROM novosprodutos np
    WHERE np.NomeProduto IN ('Colírio Lubrificante', 'Relaxante Muscular 20cp', 'Dorflex 36cp', 'Neosaldina 30 drágeas', 'Cálcio + Vitamina D3', 'Melatonina 0.21mg')
)
INSERT INTO public.ProdCateg (IDProduto, IDCategoria)
SELECT np.IDProduto, c.IDCategoria
FROM novosprodutos np
JOIN public.Categoria c ON c.NomeCategoria =
    CASE
        WHEN np.NomeProduto = 'Protetor Solar Facial FPS 50' THEN 'Proteção Solar' WHEN np.NomeProduto = 'Creme Hidratante Corporal' THEN 'Cuidados Corporais'
        -- (Restante do CASE aqui... omitido por brevidade)
        WHEN np.NomeProduto = 'Melatonina 0.21mg' THEN 'Suplementos Alimentares'
    END;


-- ===================================================================
-- DML - Inserção em Massa de 150 Vendas Fictícias
-- ===================================================================
INSERT INTO public.CliCompraProd (DataCompra, Quantidade, IDCliente, IDProduto) VALUES
('2025-01-05', 2, 13, 5), ('2025-01-08', 1, 45, 12), ('2025-01-12', 3, 22, 25),
('2025-01-15', 1, 5, 30), ('2025-01-18', 2, 55, 1), ('2025-01-21', 1, 33, 8),
('2025-01-24', 4, 19, 15), ('2025-01-28', 1, 48, 22), ('2025-02-02', 2, 7, 29),
('2025-02-05', 1, 60, 4), ('2025-02-09', 1, 2, 18), ('2025-02-13', 3, 41, 26),
('2025-02-17', 2, 28, 11), ('2025-02-20', 1, 1, 31), ('2025-02-24', 1, 52, 6),
('2025-03-01', 2, 38, 14), ('2025-03-04', 1, 16, 21), ('2025-03-08', 3, 49, 2),
('2025-03-12', 1, 23, 28), ('2025-03-16', 2, 57, 19), ('2025-03-19', 1, 10, 24),
('2025-03-23', 4, 3, 1), ('2025-03-27', 1, 51, 16), ('2025-04-03', 2, 26, 7),
('2025-04-06', 1, 12, 23), ('2025-04-10', 1, 44, 13), ('2025-04-14', 2, 31, 27),
('2025-04-18', 3, 9, 3), ('2025-04-22', 1, 56, 10), ('2025-04-26', 2, 20, 17),
('2025-04-30', 1, 36, 20), ('2025-05-04', 1, 4, 9), ('2025-05-07', 3, 40, 5),
('2025-05-11', 2, 24, 22), ('2025-05-15', 1, 59, 18), ('2025-05-19', 4, 14, 1),
('2025-05-23', 1, 34, 29), ('2025-05-27', 2, 6, 11), ('2025-06-02', 1, 46, 25),
('2025-06-05', 3, 17, 30), ('2025-06-09', 1, 53, 2), ('2025-06-13', 2, 29, 21),
('2025-06-17', 1, 8, 26), ('2025-06-21', 4, 39, 12), ('2025-06-25', 1, 15, 7),
('2025-06-29', 2, 50, 23), ('2025-07-03', 1, 21, 14), ('2025-07-07', 3, 43, 6),
('2025-07-11', 1, 18, 20), ('2025-07-15', 2, 54, 15), ('2025-07-19', 1, 27, 28),
('2025-07-23', 5, 3, 1), ('2025-07-27', 1, 35, 24), ('2025-08-01', 2, 47, 9),
('2025-08-04', 1, 11, 27), ('2025-08-08', 3, 32, 4), ('2025-08-12', 1, 58, 17),
('2025-08-16', 2, 25, 23), ('2025-08-20', 1, 5, 29), ('2025-08-24', 4, 37, 1),
('2025-08-28', 1, 13, 19), ('2025-09-02', 2, 42, 11), ('2025-09-05', 1, 22, 26),
('2025-09-09', 3, 61, 8), ('2025-09-13', 1, 30, 21), ('2025-09-17', 2, 7, 30),
('2025-09-21', 1, 48, 5), ('2025-09-23', 4, 1, 1), ('2025-09-23', 1, 55, 12),
('2025-10-01', 2, 19, 25), ('2025-10-04', 1, 33, 31), ('2025-10-08', 3, 45, 2),
('2025-10-12', 1, 2, 28), ('2025-10-16', 2, 60, 18), ('2025-10-20', 1, 28, 7),
('2025-10-24', 4, 41, 14), ('2025-10-28', 1, 16, 22), ('2025-11-02', 2, 52, 4),
('2025-11-05', 1, 23, 29), ('2025-11-09', 1, 38, 10), ('2025-11-13', 3, 57, 20),
('2025-11-17', 2, 10, 27), ('2025-11-21', 1, 49, 3), ('2025-11-25', 1, 26, 16),
('2025-11-29', 4, 12, 1), ('2025-12-03', 2, 51, 9), ('2025-12-07', 1, 20, 24),
('2025-12-11', 1, 36, 6), ('2025-12-15', 3, 44, 13), ('2025-12-19', 2, 9, 30),
('2025-12-23', 1, 56, 17), ('2025-12-28', 5, 14, 1), ('2025-01-11', 1, 40, 23),
('2025-02-15', 2, 21, 15), ('2025-03-21', 1, 50, 28), ('2025-04-24', 3, 4, 2),
('2025-05-30', 1, 37, 26), ('2025-06-19', 2, 13, 11), ('2025-07-25', 1, 46, 22),
('2025-08-14', 4, 8, 1), ('2025-09-23', 2, 62, 29), ('2025-10-18', 1, 17, 5),
('2025-11-23', 3, 43, 19), ('2025-12-26', 1, 32, 27), ('2025-01-30', 2, 53, 10),
('2025-02-28', 1, 29, 25), ('2025-03-10', 1, 35, 8), ('2025-04-12', 4, 47, 1),
('2025-05-14', 1, 11, 16), ('2025-06-16', 2, 58, 20), ('2025-07-17', 1, 24, 27),
('2025-08-18', 3, 39, 3), ('2025-09-23', 1, 15, 13), ('2025-10-26', 2, 49, 29),
('2025-11-15', 1, 6, 6), ('2025-12-17', 4, 42, 1), ('2025-01-26', 1, 18, 10),
('2025-02-26', 2, 57, 21), ('2025-03-26', 1, 27, 26), ('2025-04-28', 3, 7, 2),
('2025-05-25', 1, 40, 30), ('2025-06-27', 2, 19, 4), ('2025-07-29', 1, 54, 18),
('2025-08-30', 5, 2, 1), ('2025-09-23', 1, 36, 11), ('2025-10-30', 2, 45, 25),
('2025-11-01', 1, 5, 28), ('2025-12-02', 3, 59, 15), ('2025-01-02', 1, 21, 7),
('2025-02-03', 2, 34, 14), ('2025-03-06', 1, 46, 20), ('2025-04-07', 4, 10, 1),
('2025-05-09', 1, 61, 23), ('2025-06-10', 2, 25, 9), ('2025-07-12', 1, 38, 17),
('2025-08-13', 3, 52, 3), ('2025-09-23', 1, 12, 12);