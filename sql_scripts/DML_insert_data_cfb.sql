-- estados e uf

INSERT INTO UF (IDUF, NomeUF) VALUES
('AC', 'Acre'),
('AL', 'Alagoas'),
('AP', 'Amapá'),
('AM', 'Amazonas'),
('BA', 'Bahia'),
('CE', 'Ceará'),
('DF', 'Distrito Federal'),
('ES', 'Espírito Santo'),
('GO', 'Goiás'),
('MA', 'Maranhão'),
('MT', 'Mato Grosso'),
('MS', 'Mato Grosso do Sul'),
('MG', 'Minas Gerais'),
('PA', 'Pará'),
('PB', 'Paraíba'),
('PR', 'Paraná'),
('PE', 'Pernambuco'),
('PI', 'Piauí'),
('RJ', 'Rio de Janeiro'),
('RN', 'Rio Grande do Norte'),
('RS', 'Rio Grande do Sul'),
('RO', 'Rondônia'),
('RR', 'Roraima'),
('SC', 'Santa Catarina'),
('SP', 'São Paulo'),
('SE', 'Sergipe'),
('TO', 'Tocantins');

DO $$
BEGIN
  RAISE NOTICE 'UFs adicionados com sucesso';
END;
$$;

-- municipios de exemplo
INSERT INTO Municipio (NomeMunicipio, IDUF) VALUES
('Rio Branco', 'AC'),
('Cruzeiro do Sul', 'AC'),
('Maceió', 'AL'),
('Arapiraca', 'AL'),
('Macapá', 'AP'),
('Santana', 'AP'),
('Manaus', 'AM'),
('Parintins', 'AM'),
('Salvador', 'BA'),
('Feira de Santana', 'BA'),
('Fortaleza', 'CE'),
('Caucaia', 'CE'),
('Brasília', 'DF'),
('Vitória', 'ES'),
('Goiânia', 'GO'),
('Aparecida de Goiânia', 'GO'),
('São Luís', 'MA'),
('Imperatriz', 'MA'),
('Cuiabá', 'MT'),
('Várzea Grande', 'MT'),
('Campo Grande', 'MS'),
('Dourados', 'MS'),
('Belo Horizonte', 'MG'),
('Uberlândia', 'MG'),
('Belém', 'PA'),
('Ananindeua', 'PA'),
('João Pessoa', 'PB'),
('Campina Grande', 'PB'),
('Curitiba', 'PR'),
('Londrina', 'PR'),
('Recife', 'PE'),
('Olinda', 'PE'),
('Teresina', 'PI'),
('Parnaíba', 'PI'),
('Rio de Janeiro', 'RJ'),
('Niterói', 'RJ'),
('Natal', 'RN'),
('Mossoró', 'RN'),
('Porto Alegre', 'RS'),
('Caxias do Sul', 'RS'),
('Porto Velho', 'RO'),
('Ji-Paraná', 'RO'),
('Boa Vista', 'RR'),
('Rorainópolis', 'RR'),
('Florianópolis', 'SC'),
('Joinville', 'SC'),
('São Paulo', 'SP'),
('Campinas', 'SP'),
('Aracaju', 'SE'),
('Nossa Senhora do Socorro', 'SE'),
('Palmas', 'TO'),
('Araguaína', 'TO');


DO $$
BEGIN
  RAISE NOTICE 'Municípios adicionados com sucesso';
END;
$$;

-- CLIENTES DE TESTE
INSERT INTO Cliente (NomeCliente, EmailCliente, Senha, Rua, Bairro, IDMunicipio, IDUF) VALUES
('Anderson Silva', 'anderson.silva@email.com', 'senha123', 'Rua das Flores, 100', 'Centro', 1, 'AC'),
('Ana Souza', 'ana.souza@email.com', 'senha123', 'Avenida Brasil, 250', 'Jardim', 3, 'AL'),
('Carlos Pereira', 'carlos.pereira@email.com', 'senha123', 'Rua do Sol, 75', 'Boa Vista', 5, 'AP'),
('Fernanda Lima', 'fernanda.lima@email.com', 'senha123', 'Travessa Verde, 42', 'Centro', 7, 'AM'),
('Lucas Oliveira', 'lucas.oliveira@email.com', 'senha123', 'Rua das Acácias, 180', 'Jardim América', 9, 'BA'),
('Mariana Costa', 'mariana.costa@email.com', 'senha123', 'Avenida das Palmeiras, 12', 'Cidade Alta', 11, 'CE'),
('Pedro Santos', 'pedro.santos@email.com', 'senha123', 'Rua Nova, 33', 'Centro', 13, 'DF'),
('Juliana Ribeiro', 'juliana.ribeiro@email.com', 'senha123', 'Rua do Lago, 88', 'Bairro Alto', 15, 'GO'),
('Thiago Martins', 'thiago.martins@email.com', 'senha123', 'Avenida Central, 500', 'Centro', 17, 'MA'),
('Camila Fernandes', 'camila.fernandes@email.com', 'senha123', 'Rua do Comércio, 210', 'Centro', 19, 'MT');


DO $$
BEGIN
  RAISE NOTICE 'primeiros clientes adicionados com sucesso';
END;
$$;
--estoque

INSERT INTO Estoque (Prateleira, Quantidade) VALUES
('Prateleira A1', 50),('Prateleira B2', 100),('Prateleira C3', 75);

DO $$
BEGIN
  RAISE NOTICE 'Estoques adicionados com sucesso';
END;
$$;

--fornecedor
INSERT INTO Fornecedor (CNPJ, NomeFornecedor) VALUES
('12.345.678/0001-90', 'Farmácia Central'),
('98.765.432/0001-12', 'Distribuidora Saúde');

DO $$
BEGIN
  RAISE NOTICE 'Fornecedores adicionados com sucesso';
END;
$$;

--categorias
INSERT INTO Categoria (NomeCategoria) VALUES
('Analgesicos'),('Antibióticos'),('Vacinas');

DO $$
BEGIN
  RAISE NOTICE 'Categorias adicionadas com sucesso';
END;
$$;

--produtos

INSERT INTO Produto (NomeProduto, DescrProd, PrecVenda, DtValidade, IDEstoque) VALUES
('Paracetamol 500mg', 'Comprimidos para dor e febre', 5.50, '2026-12-31', 1),
('Amoxicilina 500mg', 'Antibiótico para infecções bacterianas', 12.75, '2025-10-30', 2),
('Vacina Influenza 2025', 'Vacina contra gripe sazonal', 50.00, '2026-03-31', 3);

DO $$
BEGIN
  RAISE NOTICE 'Produtos adicionados com sucesso';
END;
$$;

-- medicamentos

INSERT INTO Medicamento (IDProduto, Indicacao, Contraindicacao) VALUES
(1, 'Dor de cabeça, febre', 'Alergia ao paracetamol'),
(2, 'Infecções bacterianas', 'Alergia a penicilinas');

DO $$
BEGIN
  RAISE NOTICE 'Medicamentos adicionados com sucesso';
END;
$$;

--vacinas

INSERT INTO Vacina (IDProduto, FabricanteVac, IDCliente) VALUES
(3, 'Laboratório Vida', 3);

DO $$
BEGIN
  RAISE NOTICE 'Vacinas adicionadas com sucesso';
END;
$$;


--CliCompraProd
INSERT INTO CliCompraProd (DataCompra, Quantidade, IDCliente, IDProduto) VALUES
('2025-09-01', 2, 1, 1),
('2025-09-02', 1, 2, 2),
('2025-09-03', 1, 3, 3);

DO $$
BEGIN
  RAISE NOTICE 'Compras de clientes adicionadas com sucesso';
END;
$$;

--FornEstoque
INSERT INTO FornEstoque (IDFornecedor, IDEstoque, PrecoCompra) VALUES
(1, 1, 3.50),
(2, 2, 8.00),
(1, 3, 30.00);

DO $$
BEGIN
  RAISE NOTICE 'Relações fornecedor-estoque adicionadas com sucesso';
END;
$$;


--ProdCategoria

INSERT INTO ProdCateg (IDProduto, IDCategoria) VALUES
(1, 1),
(2, 2),
(3, 3);

DO $$
BEGIN
  RAISE NOTICE 'Produtos categorizados adicionados com sucesso';
END;
$$;


--CliEnferm

INSERT INTO Enfermidades (NomeEnferm, DescrEnferm) VALUES
('Hipertensão', 'Pressão arterial elevada'),
('Diabetes', 'Controle de glicose elevado');

DO $$
BEGIN
  RAISE NOTICE 'Enfermidades adicionadas com sucesso';
END;
$$;

INSERT INTO CliEnferm (IDCliente, IDEnfermidade, DtCadEnferm) VALUES
(1, 1, '2025-01-15'),
(2, 2, '2025-02-20');

DO $$
BEGIN
  RAISE NOTICE 'Relações cliente-enfermidade adicionadas com sucesso';
END;
$$;


--telefone cliente

INSERT INTO Cliente_TelefoneCliente (IDCliente, TelefoneCliente) VALUES
(1, '11999990001'),
(2, '11999990002'),
(3, '11999990003'),
(4, '21999999000'),
(5, '21909090900'),
(2, '10101000100');

DO $$
BEGIN
  RAISE NOTICE 'Telefones de clientes adicionados com sucesso';
END;
$$;

--fornecedor telefone

INSERT INTO Fornecedor_Telefone (IDFornecedor, Telefone) VALUES
(1, '1133334444'),
(2, '1144445555');

DO $$
BEGIN
  RAISE NOTICE 'Telefones de fornecedores adicionados com sucesso';
END;
$$;


--interação medicamentosa 
INSERT INTO InteracaoMedicamentosa (DescrInteracaoMedicam, IDProdutoX, IDProdutoY) VALUES
('Não administrar juntos: risco de toxicidade', 1, 2);

DO $$
BEGIN
  RAISE NOTICE 'Interações medicamentosas adicionadas com sucesso';
END;
$$;


-- Lembretes de clientes com data de alarme
INSERT INTO LembreteCliente (IDProduto, IDCliente, DataAlarme) VALUES
(1, 1, '2025-09-10'),
(2, 2, '2025-09-11'),
(3, 3, '2025-09-12'),
(1, 2, '2025-09-13'),
(2, 3, '2025-09-14');

DO $$
BEGIN
  RAISE NOTICE 'Lembretes de clientes adicionados com sucesso';
END;
$$;





