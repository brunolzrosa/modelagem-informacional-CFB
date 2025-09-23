-- ===================================================================
-- DATA WAREHOUSE - VERSÃO DDL FINAL E CORRIGIDA
-- Adicionadas as restrições UNIQUE para o ETL Incremental
-- ===================================================================
DROP SCHEMA IF EXISTS dw CASCADE; 
CREATE SCHEMA IF NOT EXISTS dw;

-- ========================
-- Tabela dw.Dim_Tempo
-- ========================
CREATE TABLE dw.Dim_Tempo (
  PK_Tempo INT PRIMARY KEY,
  Data_Completa DATE NOT NULL UNIQUE,
  Dia_Semana VARCHAR(20) NOT NULL,
  Dia_do_Mes INT NOT NULL,
  Mes INT NOT NULL,
  Nome_Mes VARCHAR(20) NOT NULL,
  Trimestre INT NOT NULL,
  Ano INT NOT NULL,
  UNIQUE(Data_Completa)
);

-- ========================
-- Tabela dw.Dim_Endereco
-- ========================
CREATE TABLE dw.Dim_Endereco (
  PK_Endereco INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  Logradouro VARCHAR(255) NOT NULL,
  Bairro VARCHAR(255) NOT NULL,
  Municipio VARCHAR(255) NOT NULL,
  Nome_UF VARCHAR(100) NOT NULL,
  Sigla_UF CHAR(2) NOT NULL,
  -- A chave única para um endereço é a combinação de seus campos
  CONSTRAINT uq_dim_endereco_completo UNIQUE (Logradouro, Bairro, Municipio, Sigla_UF)
);

-- ========================
-- Tabela dw.Dim_Cliente
-- ========================
CREATE TABLE dw.Dim_Cliente (
  PK_Cliente INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  IDCliente_Original INT NOT NULL UNIQUE, -- RESTRIÇÃO ADICIONADA
  Nome_Cliente VARCHAR(255) NOT NULL,
  Email_Cliente VARCHAR(200) NOT NULL
);

-- ========================
-- Tabela dw.Dim_Categoria
-- ========================
CREATE TABLE dw.Dim_Categoria (
  PK_Categoria INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  IDCategoria_Original INT NOT NULL UNIQUE, -- RESTRIÇÃO ADICIONADA
  Nome_Categoria VARCHAR(255) NOT NULL
);

-- ========================
-- Tabela dw.Dim_Produto
-- ========================
CREATE TABLE dw.Dim_Produto (
  PK_Produto INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  IDProduto_Original INT NOT NULL UNIQUE, -- RESTRIÇÃO ADICIONADA
  Nome_Produto VARCHAR(255) NOT NULL,
  Descricao_Produto VARCHAR(500),
  Indicacao VARCHAR(255),
  Contraindicacao VARCHAR(255)
);

-- ========================
-- Tabela dw.Fato_Receita
-- ========================
CREATE TABLE dw.Fato_Receita (
  FK_Tempo INT NOT NULL,
  FK_Endereco INT NOT NULL,
  FK_Cliente INT NOT NULL,
  FK_Categoria INT NOT NULL,
  FK_Produto INT NOT NULL,
  Valor_Vendido NUMERIC(10, 2) NOT NULL,
  Quantidade_Vendida INT NOT NULL,
  IDCompra_Original INT UNIQUE, -- RESTRIÇÃO ADICIONADA

  FOREIGN KEY (FK_Tempo) REFERENCES dw.Dim_Tempo(PK_Tempo),
  FOREIGN KEY (FK_Endereco) REFERENCES dw.Dim_Endereco(PK_Endereco),
  FOREIGN KEY (FK_Cliente) REFERENCES dw.Dim_Cliente(PK_Cliente),
  FOREIGN KEY (FK_Categoria) REFERENCES dw.Dim_Categoria(PK_Categoria),
  FOREIGN KEY (FK_Produto) REFERENCES dw.Dim_Produto(PK_Produto)
);
