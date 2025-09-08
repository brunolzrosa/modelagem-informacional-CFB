
-- Tabela UF
CREATE TABLE UF
(
  IDUF VARCHAR(2) NOT NULL,
  NomeUF VARCHAR(100) NOT NULL,
  PRIMARY KEY (IDUF)
);


-- Tabela Municipio
CREATE TABLE Municipio
(
  IDMunicipio INT GENERATED ALWAYS AS IDENTITY,
  NomeMunicipio VARCHAR(255) NOT NULL,
  IDUF VARCHAR(2) NOT NULL,
  PRIMARY KEY (IDMunicipio, IDUF),
  FOREIGN KEY (IDUF) REFERENCES UF(IDUF)
);


-- Tabela Cliente
CREATE TABLE Cliente
(
  IDCliente INT GENERATED ALWAYS AS IDENTITY,
  NomeCliente VARCHAR(255) NOT NULL,
  EmailCliente VARCHAR(200) NOT NULL UNIQUE,
  Senha VARCHAR(20) NOT NULL,
  Rua VARCHAR(255) NOT NULL,
  Bairro VARCHAR(255) NOT NULL,
  IDMunicipio INT NOT NULL,
  IDUF VARCHAR(2) NOT NULL,
  PRIMARY KEY (IDCliente),
  FOREIGN KEY (IDMunicipio, IDUF) REFERENCES Municipio(IDMunicipio, IDUF)
);


-- Tabela Estoque
CREATE TABLE Estoque
(
  IDEstoque INT GENERATED ALWAYS AS IDENTITY,
  Quantidade INT NOT NULL,
  Prateleira VARCHAR(255) NOT NULL,
  PRIMARY KEY (IDEstoque)
);


-- Tabela Produto
CREATE TABLE Produto
(
  IDProduto INT GENERATED ALWAYS AS IDENTITY,
  NomeProduto VARCHAR(255) NOT NULL,
  DescrProd VARCHAR(500) NOT NULL,
  PrecVenda NUMERIC(10,2) NOT NULL,
  DtValidade DATE NOT NULL,
  IDEstoque INT NOT NULL,
  PRIMARY KEY (IDProduto),
  FOREIGN KEY (IDEstoque) REFERENCES Estoque(IDEstoque)
);


-- Tabela Fornecedor
CREATE TABLE Fornecedor
(
  IDFornecedor INT GENERATED ALWAYS AS IDENTITY,
  NomeFornecedor VARCHAR(255) NOT NULL,
  CNPJ VARCHAR(25) NOT NULL,
  PRIMARY KEY (IDFornecedor)
);

-- Tabela Medicamento
CREATE TABLE Medicamento
(
  IDProduto INT PRIMARY KEY,
  Indicacao VARCHAR(255) NOT NULL,
  Contraindicacao VARCHAR(255) NOT NULL,
  FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto)
);


-- Tabela Categoria
CREATE TABLE Categoria
(
  IDCategoria INT GENERATED ALWAYS AS IDENTITY,
  NomeCategoria VARCHAR(255) NOT NULL,
  PRIMARY KEY (IDCategoria)
);


-- Tabela Vacina

CREATE TABLE Vacina
(
  IDProduto INT PRIMARY KEY,
  FabricanteVac VARCHAR(255) NOT NULL,
  IDCliente INT NOT NULL,
  FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto),
  FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);


-- Tabela Enfermidades

CREATE TABLE Enfermidades
(
  IDEnfermidade INT GENERATED ALWAYS AS IDENTITY,
  NomeEnferm VARCHAR(255) NOT NULL,
  DescrEnferm VARCHAR(500) NOT NULL,
  PRIMARY KEY (IDEnfermidade)
);


-- Tabela CliCompraProd

CREATE TABLE CliCompraProd
(
  IDCompra INT GENERATED ALWAYS AS IDENTITY,
  Quantidade INT NOT NULL,
  DataCompra DATE NOT NULL,
  IDCliente INT NOT NULL,
  IDProduto INT NOT NULL,
  PRIMARY KEY (IDCompra),
  FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente),
  FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto)
);


-- Tabela FornEstoque

CREATE TABLE FornEstoque
(
  IDFornecedor INT NOT NULL,
  IDEstoque INT NOT NULL,
  PrecoCompra NUMERIC(10,2) NOT NULL,
  PRIMARY KEY (IDFornecedor, IDEstoque),
  FOREIGN KEY (IDFornecedor) REFERENCES Fornecedor(IDFornecedor),
  FOREIGN KEY (IDEstoque) REFERENCES Estoque(IDEstoque)
);


-- Tabela ProdCateg

CREATE TABLE ProdCateg
(
  IDProduto INT NOT NULL,
  IDCategoria INT NOT NULL,
  PRIMARY KEY (IDProduto, IDCategoria),
  FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto),
  FOREIGN KEY (IDCategoria) REFERENCES Categoria(IDCategoria)
);


-- Tabela CliEnferm

CREATE TABLE CliEnferm
(
  IDCliente INT NOT NULL,
  IDEnfermidade INT NOT NULL,
  DtCadEnferm DATE NOT NULL,
  PRIMARY KEY (IDCliente, IDEnfermidade),
  FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente),
  FOREIGN KEY (IDEnfermidade) REFERENCES Enfermidades(IDEnfermidade)
);


-- Tabela Cliente_TelefoneCliente
CREATE TABLE Cliente_TelefoneCliente
(
  IDCliente INT NOT NULL,
  TelefoneCliente VARCHAR(14) NOT NULL,
  PRIMARY KEY (TelefoneCliente, IDCliente),
  FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);


-- Tabela Fornecedor_Telefone
CREATE TABLE Fornecedor_Telefone
(
  IDFornecedor INT NOT NULL,
  Telefone VARCHAR(14) NOT NULL,
  PRIMARY KEY (Telefone, IDFornecedor),
  FOREIGN KEY (IDFornecedor) REFERENCES Fornecedor(IDFornecedor)
);


-- Tabela InteracaoMedicamentosa
CREATE TABLE InteracaoMedicamentosa
(
  IDProdutoX INT NOT NULL,
  IDProdutoY INT NOT NULL,
  DescrInteracaoMedicam VARCHAR(255) NOT NULL,
  PRIMARY KEY (IDProdutoX, IDProdutoY),
  FOREIGN KEY (IDProdutoX) REFERENCES Medicamento(IDProduto),
  FOREIGN KEY (IDProdutoY) REFERENCES Medicamento(IDProduto)
);


-- Tabela LembreteCliente
CREATE TABLE LembreteCliente
(
  IDProduto INT NOT NULL,
  IDCliente INT NOT NULL,
  DataAlarme DATE NOT NULL,
  PRIMARY KEY (IDProduto, IDCliente),
  FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto),
  FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);