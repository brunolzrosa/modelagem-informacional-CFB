-- ==========================================================
-- DDL DEFINITIVO - CFB FARMÁCIA 
-- ==========================================================
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

-- Tabelas independentes
CREATE TABLE UF ( IDUF CHAR(2) PRIMARY KEY, NomeUF VARCHAR(100) NOT NULL );
CREATE TABLE Categoria ( IDCategoria INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, NomeCategoria VARCHAR(255) NOT NULL UNIQUE );
CREATE TABLE Fornecedor ( IDFornecedor INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, NomeFornecedor VARCHAR(255) NOT NULL, CNPJ VARCHAR(25) NOT NULL UNIQUE );
CREATE TABLE Enfermidades ( IDEnfermidade INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, NomeEnferm VARCHAR(255) NOT NULL, DescrEnferm VARCHAR(500) NOT NULL );

-- Tabelas dependentes
CREATE TABLE Municipio ( IDMunicipio INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, NomeMunicipio VARCHAR(255) NOT NULL, IDUF CHAR(2) NOT NULL, FOREIGN KEY (IDUF) REFERENCES UF(IDUF) );
CREATE TABLE Estoque ( IDEstoque INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, IDMunicipio INT NOT NULL, FOREIGN KEY (IDMunicipio) REFERENCES Municipio(IDMunicipio) );
CREATE TABLE Cliente ( IDCliente INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, NomeCliente VARCHAR(255) NOT NULL, EmailCliente VARCHAR(200) NOT NULL UNIQUE, Senha VARCHAR(255) NOT NULL, Rua VARCHAR(255) NOT NULL, Bairro VARCHAR(255) NOT NULL, IDMunicipio INT NOT NULL, FOREIGN KEY (IDMunicipio) REFERENCES Municipio(IDMunicipio) );
CREATE TABLE Produto ( IDProduto INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, NomeProduto VARCHAR(255) NOT NULL, DescrProd VARCHAR(500) NOT NULL, PrecVenda NUMERIC(10,2) NOT NULL, DtValidade DATE NOT NULL, IDEstoque INT NOT NULL, FOREIGN KEY (IDEstoque) REFERENCES Estoque(IDEstoque) );
CREATE TABLE Medicamento ( IDProduto INT PRIMARY KEY, Indicacao VARCHAR(255) NOT NULL, Contraindicacao VARCHAR(255) NOT NULL, FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto) );
CREATE TABLE Vacina ( IDProduto INT NOT NULL, IDCliente INT NOT NULL, FabricanteVac VARCHAR(255) NOT NULL, PRIMARY KEY (IDProduto, IDCliente), FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto), FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente));

-- Tabelas associativas
CREATE TABLE CliCompraProd ( IDCompra INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, IDCliente INT NOT NULL, IDProduto INT NOT NULL, Quantidade INT NOT NULL, DataCompra DATE NOT NULL, FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente), FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto) );
CREATE TABLE FornEstoque ( IDFornecedor INT NOT NULL, IDEstoque INT NOT NULL, PrecoCompra NUMERIC(10,2) NOT NULL, PRIMARY KEY (IDFornecedor, IDEstoque), FOREIGN KEY (IDFornecedor) REFERENCES Fornecedor(IDFornecedor), FOREIGN KEY (IDEstoque) REFERENCES Estoque(IDEstoque) );
CREATE TABLE ProdCateg ( IDProduto INT NOT NULL, IDCategoria INT NOT NULL, PRIMARY KEY (IDProduto, IDCategoria), FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto), FOREIGN KEY (IDCategoria) REFERENCES Categoria(IDCategoria) );
CREATE TABLE CliEnferm ( IDCliente INT NOT NULL, IDEnfermidade INT NOT NULL, DtCadEnferm DATE NOT NULL, PRIMARY KEY (IDCliente, IDEnfermidade), FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente), FOREIGN KEY (IDEnfermidade) REFERENCES Enfermidades(IDEnfermidade) );
CREATE TABLE Cliente_TelefoneCliente ( IDCliente INT NOT NULL, TelefoneCliente VARCHAR(14) NOT NULL, PRIMARY KEY (TelefoneCliente, IDCliente), FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente) );
CREATE TABLE Fornecedor_Telefone ( IDFornecedor INT NOT NULL, Telefone VARCHAR(14) NOT NULL, PRIMARY KEY (Telefone, IDFornecedor), FOREIGN KEY (IDFornecedor) REFERENCES Fornecedor(IDFornecedor) );
CREATE TABLE InteracaoMedicamentosa ( IDProdutoX INT NOT NULL, IDProdutoY INT NOT NULL, DescrInteracaoMedicam VARCHAR(255) NOT NULL, PRIMARY KEY (IDProdutoX, IDProdutoY), FOREIGN KEY (IDProdutoX) REFERENCES Medicamento(IDProduto), FOREIGN KEY (IDProdutoY) REFERENCES Medicamento(IDProduto) );
CREATE TABLE LembreteCliente ( IDProduto INT NOT NULL, IDCliente INT NOT NULL, DataAlarme DATE NOT NULL, PRIMARY KEY (IDProduto, IDCliente), FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto), FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente) );


-- Tabela Prateleira 
CREATE TABLE Prateleira (
    IDPrateleira INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    IDEstoque INT NOT NULL,
    FOREIGN KEY (IDEstoque) REFERENCES Estoque(IDEstoque)
);

-- Tabela Associativa ProdutoPrateleira 
CREATE TABLE ProdutoPrateleira (
    IDProduto INT NOT NULL,
    IDPrateleira INT NOT NULL,
    QuantidadeProduto INT NOT NULL,
    PRIMARY KEY (IDProduto, IDPrateleira),
    FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto),
    FOREIGN KEY (IDPrateleira) REFERENCES Prateleira(IDPrateleira)
);