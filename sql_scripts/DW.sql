-- ===================================================================
-- DATA WAREHOUSE - CFB FARMÁCIA 
-- ===================================================================

-- ========================
-- Tabela Dim_Tempo
-- ========================
-- DESCRIÇÃO: Dimensão de calendário para análises baseadas em tempo.
-- ========================
CREATE TABLE Dim_Tempo (
  PK_Tempo INT PRIMARY KEY, -- Ex: 20250923 para 23/09/2025
  Data_Completa DATE NOT NULL,
  Dia_Semana VARCHAR(20) NOT NULL,
  Dia_do_Mes INT NOT NULL,
  Mes INT NOT NULL,
  Nome_Mes VARCHAR(20) NOT NULL,
  Trimestre INT NOT NULL,
  Ano INT NOT NULL,
  UNIQUE(Data_Completa)
);

-- ========================
-- Tabela Dim_Endereco
-- ========================
-- DESCRIÇÃO: Armazena as informações geográficas dos clientes.
-- ========================
CREATE TABLE Dim_Endereco (
  PK_Endereco INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  Logradouro VARCHAR(255) NOT NULL,
  Bairro VARCHAR(255) NOT NULL,
  Municipio VARCHAR(255) NOT NULL,
  Nome_UF VARCHAR(100) NOT NULL,
  Sigla_UF CHAR(2) NOT NULL
);
-- ========================
-- Tabela Dim_Cliente
-- ========================
-- DESCRIÇÃO: Contém os dados descritivos dos seus clientes.
-- ========================
CREATE TABLE Dim_Cliente (
  PK_Cliente INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  IDCliente_Original INT NOT NULL,
  Nome_Cliente VARCHAR(255) NOT NULL,
  Email_Cliente VARCHAR(200) NOT NULL
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
  Nome_Categoria VARCHAR(255) NOT NULL
);

-- ========================
-- Tabela Dim_Produto
-- ========================
-- DESCRIÇÃO: Contém os detalhes dos produtos.
-- ========================
CREATE TABLE Dim_Produto (
  PK_Produto INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  IDProduto_Original INT NOT NULL,
  Nome_Produto VARCHAR(255) NOT NULL,
  Descricao_Produto VARCHAR(500),
  Indicacao VARCHAR(255),       -- vem da tabela Medicamento
  Contraindicacao VARCHAR(255)  -- vm da tabela Medicamento
);

-- ========================
-- Tabela Fato_Receita
-- ========================
-- DESCRIÇÃO: A tabela central. Cada linha representa um produto
-- comprado por um cliente em uma data específica.
-- ========================
CREATE TABLE Fato_Receita (
  -- Chaves Estrangeiras das dimensões
  FK_Tempo INT NOT NULL,
  FK_Endereco INT NOT NULL,
  FK_Cliente INT NOT NULL,
  FK_Categoria INT NOT NULL,
  FK_Produto INT NOT NULL,

  -- Métricas 
  Valor_Vendido NUMERIC(10, 2) NOT NULL,
  Quantidade_Vendida INT NOT NULL,

  -- Chave da compra original 
  IDCompra_Original INT,

  -- chaves estrangeiras
  FOREIGN KEY (FK_Tempo) REFERENCES Dim_Tempo(PK_Tempo),
  FOREIGN KEY (FK_Endereco) REFERENCES Dim_Endereco(PK_Endereco),
  FOREIGN KEY (FK_Cliente) REFERENCES Dim_Cliente(PK_Cliente),
  FOREIGN KEY (FK_Categoria) REFERENCES Dim_Categoria(PK_Categoria),
  FOREIGN KEY (FK_Produto) REFERENCES Dim_Produto(PK_Produto)
);