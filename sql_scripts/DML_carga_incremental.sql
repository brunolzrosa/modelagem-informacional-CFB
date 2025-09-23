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


-- Este bloco insere 28 produtos variados e os conecta às categorias e medicamentos.
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
    ('Antisséptico Bucal Menta Suave', 'Hálito fresco e proteção contra germes.', 25.50, '2026-05-31