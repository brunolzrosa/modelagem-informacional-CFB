-- ============================
-- Tabelas principais
-- ============================

-- UF
CREATE TABLE UF (
    IDUF CHAR(2) PRIMARY KEY,
    NomeUF VARCHAR(100) NOT NULL
);

-- Município
CREATE TABLE Municipio (
    IDMunicipio INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    NomeMunicipio VARCHAR(255) NOT NULL,
    IDUF CHAR(2) NOT NULL,
    FOREIGN KEY (IDUF) REFERENCES UF(IDUF)
);

-- Cliente
CREATE TABLE Cliente (
    IDCliente INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    NomeCliente VARCHAR(255) NOT NULL,
    EmailCliente VARCHAR(200) NOT NULL UNIQUE,
    Senha VARCHAR(255) NOT NULL,
    Rua VARCHAR(255) NOT NULL,
    Bairro VARCHAR(255) NOT NULL,
    IDMunicipio INT NOT NULL,
    FOREIGN KEY (IDMunicipio) REFERENCES Municipio(IDMunicipio)
);

-- Estoque
CREATE TABLE Estoque (
    IDEstoque INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    IDMunicipio INT NOT NULL,
    FOREIGN KEY (IDMunicipio) REFERENCES Municipio(IDMunicipio)
);

-- Produto
CREATE TABLE Produto (
    IDProduto INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    NomeProduto VARCHAR(255) NOT NULL,
    DescrProd VARCHAR(500) NOT NULL,
    PrecVenda NUMERIC(10,2) NOT NULL,
    DtValidade DATE NOT NULL,
    IDEstoque INT NOT NULL,
    FOREIGN KEY (IDEstoque) REFERENCES Estoque(IDEstoque)
);

-- Fornecedor
CREATE TABLE Fornecedor (
    IDFornecedor INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    NomeFornecedor VARCHAR(255) NOT NULL,
    CNPJ VARCHAR(25) NOT NULL
);

-- Medicamento
CREATE TABLE Medicamento (
    IDProduto INT PRIMARY KEY,
    Indicacao VARCHAR(255) NOT NULL,
    Contraindicacao VARCHAR(255) NOT NULL,
    FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto)
);

-- Categoria
CREATE TABLE Categoria (
    IDCategoria INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    NomeCategoria VARCHAR(255) NOT NULL
);

-- Enfermidades
CREATE TABLE Enfermidades (
    IDEnfermidade INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    NomeEnferm VARCHAR(255) NOT NULL,
    DescrEnferm VARCHAR(500) NOT NULL
);

-- ============================
-- Tabelas associativas
-- ============================

-- Compra de produtos pelo cliente
CREATE TABLE CliCompraProd (
    IDCompra INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    IDCliente INT NOT NULL,
    IDProduto INT NOT NULL,
    Quantidade INT NOT NULL,
    DataCompra DATE NOT NULL,
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente),
    FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto)
);

-- Fornecedor e Estoque
CREATE TABLE FornEstoque (
    IDFornecedor INT NOT NULL,
    IDEstoque INT NOT NULL,
    PrecoCompra NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (IDFornecedor, IDEstoque),
    FOREIGN KEY (IDFornecedor) REFERENCES Fornecedor(IDFornecedor),
    FOREIGN KEY (IDEstoque) REFERENCES Estoque(IDEstoque)
);

-- Produto e Categoria
CREATE TABLE ProdCateg (
    IDProduto INT NOT NULL,
    IDCategoria INT NOT NULL,
    PRIMARY KEY (IDProduto, IDCategoria),
    FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto),
    FOREIGN KEY (IDCategoria) REFERENCES Categoria(IDCategoria)
);

-- Cliente e Enfermidade
CREATE TABLE CliEnferm (
    IDCliente INT NOT NULL,
    IDEnfermidade INT NOT NULL,
    DtCadEnferm DATE NOT NULL,
    PRIMARY KEY (IDCliente, IDEnfermidade),
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente),
    FOREIGN KEY (IDEnfermidade) REFERENCES Enfermidades(IDEnfermidade)
);

-- Telefones do Cliente
CREATE TABLE Cliente_TelefoneCliente (
    IDCliente INT NOT NULL,
    TelefoneCliente VARCHAR(14) NOT NULL,
    PRIMARY KEY (TelefoneCliente, IDCliente),
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);

-- Telefones do Fornecedor
CREATE TABLE Fornecedor_Telefone (
    IDFornecedor INT NOT NULL,
    Telefone VARCHAR(14) NOT NULL,
    PRIMARY KEY (Telefone, IDFornecedor),
    FOREIGN KEY (IDFornecedor) REFERENCES Fornecedor(IDFornecedor)
);

-- Interação Medicamentosa
CREATE TABLE InteracaoMedicamentosa (
    IDProdutoX INT NOT NULL,
    IDProdutoY INT NOT NULL,
    DescrInteracaoMedicam VARCHAR(255) NOT NULL,
    PRIMARY KEY (IDProdutoX, IDProdutoY),
    FOREIGN KEY (IDProdutoX) REFERENCES Medicamento(IDProduto),
    FOREIGN KEY (IDProdutoY) REFERENCES Medicamento(IDProduto)
);

-- Lembrete do Cliente
CREATE TABLE LembreteCliente (
    IDProduto INT NOT NULL,
    IDCliente INT NOT NULL,
    DataAlarme DATE NOT NULL,
    PRIMARY KEY (IDProduto, IDCliente),
    FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto),
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);

-- Prateleira
CREATE TABLE Prateleira (
    IDPrateleira INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    IDEstoque INT NOT NULL,
    FOREIGN KEY (IDEstoque) REFERENCES Estoque(IDEstoque)
);

-- Produto na Prateleira
CREATE TABLE ProdutoPrateleira (
    IDProduto INT NOT NULL,
    IDPrateleira INT NOT NULL,
    QuantidadeProduto INT NOT NULL,
    PRIMARY KEY (IDProduto, IDPrateleira),
    FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto),
    FOREIGN KEY (IDPrateleira) REFERENCES Prateleira(IDPrateleira)
);

-- Vacina
CREATE TABLE Vacina (
    IDProduto INT NOT NULL,
    IDCliente INT NOT NULL,
    FabricanteVac VARCHAR(255) NOT NULL,
    PRIMARY KEY (IDProduto, IDCliente),
    FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto),
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);
