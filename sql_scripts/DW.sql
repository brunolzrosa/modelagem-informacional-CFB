-- ===================================================================
-- DATA WAREHOUSE - CFB FARMÁCIA
-- ===================================================================

-- ========================
-- Tabela Dim_Tempo
-- ========================
-- DESCRIÇÃO: Tabela de dimensão de calendário. 
-- ========================
CREATE TABLE Dim_Tempo (
  PK_Tempo INT PRIMARY KEY,
  Data_Completa DATE NOT NULL,
  Dia_Semana VARCHAR(20) NOT NULL,
  Dia_do_Mes INT NOT NULL,
  Mes INT NOT NULL,
  Nome_Mes VARCHAR(20) NOT NULL,
  Trimestre INT NOT NULL,
  Ano INT NOT NULL
);

-- ========================
-- Tabela Dim_Endereco
-- ========================
-- DESCRIÇÃO: Armazena as informações geográficas dos clientes.
-- Ela é criada a partir de um JOIN entre as tabelas Cliente, Municipio e UF 
-- ========================
CREATE TABLE Dim_Endereco (
  PK_Endereco INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  Logradouro VARCHAR(255) NOT NULL,
  Bairro VARCHAR(255) NOT NULL,
  Municipio VARCHAR(255) NOT NULL,
  UF VARCHAR(100) NOT NULL,
  Sigla_UF VARCHAR(2) NOT NULL
);

-- ========================
-- Tabela Dim_Cliente
-- ========================
-- DESCRIÇÃO: Contém os dados descritivos dos seus clientes.
-- O PK_Cliente é uma "Surrogate Key" (chave substituta), um novo ID
-- gerado apenas para o DW. 
-- ========================
CREATE TABLE Dim_Cliente (
  PK_Cliente INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  IDCliente_Original INT NOT NULL,
  NomeCliente VARCHAR(255) NOT NULL,
  EmailCliente VARCHAR(200) NOT NULL
);

-- ========================
-- Tabela Dim_Categoria
-- ========================
-- DESCRIÇÃO: Armazena os nomes das categorias dos produtos.
-- Derivada diretamente da tabela Categoria.
-- ========================
CREATE TABLE Dim_Categoria (
  PK_Categoria INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  IDCategoria_Original INT NOT NULL,
  NomeCategoria VARCHAR(255) NOT NULL
);

-- ========================
-- Tabela Dim_Produto
-- ========================
-- DESCRIÇÃO: Contém os detalhes dos produtos (medicamentos, etc.).
-- Junta informações da tabela Produto e Medicamento.
-- ========================
CREATE TABLE Dim_Produto (
  PK_Produto INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  IDProduto_Original INT NOT NULL,
  NomeProduto VARCHAR(255) NOT NULL,
  Descricao VARCHAR(500),
  Indicacao VARCHAR(255),       -- tabela Medicamento
  Contraindicacao VARCHAR(255)  -- tabela Medicamento
);

-- ========================
-- Tabela Fato_Receita
-- ========================
-- DESCRIÇÃO: Esta é a tabela central (FATO). Cada linha representa
-- um item de uma venda. Ela contém as métricas numéricas
-- (Valor e Quantidade) e as chaves estrangeiras (FK) que a conectam
-- a todas as dimensões.
-- ========================
CREATE TABLE Fato_Receita (
  -- Chaves Estrangeiras para as dimensões
  FK_Tempo INT NOT NULL,
  FK_Endereco INT NOT NULL,
  FK_Cliente INT NOT NULL,
  FK_Categoria INT NOT NULL,
  FK_Produto INT NOT NULL,

  -- Métricas
  Valor_Vendido NUMERIC(10, 2) NOT NULL,
  Quantidade_Vendida INT NOT NULL,

  IDCompra_Original INT,

  -- Definindo as chaves estrangeiras
  FOREIGN KEY (FK_Tempo) REFERENCES Dim_Tempo(PK_Tempo),
  FOREIGN KEY (FK_Endereco) REFERENCES Dim_Endereco(PK_Endereco),
  FOREIGN KEY (FK_Cliente) REFERENCES Dim_Cliente(PK_Cliente),
  FOREIGN KEY (FK_Categoria) REFERENCES Dim_Categoria(PK_Categoria),
  FOREIGN KEY (FK_Produto) REFERENCES Dim_Produto(PK_Produto)
);