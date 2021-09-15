CREATE TABLE tb_Produtos(
	cdProduto INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	nmProduto VARCHAR(50) NOT NULL,
	vlProduto DECIMAL(6, 2) NOT NULL
);

CREATE TABLE tb_Clientes(
	cdCliente INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	nmCliente VARCHAR(50) NOT NULL,
	dtNascimento DATE,
	inSexo VARCHAR(1) NOT NULL,
	nmEndereco VARCHAR(50),
	nmCidade VARCHAR(50),
	nmEstado VARCHAR(30),
	nmTelefone1 VARCHAR(15),
	nmTelefone2 VARCHAR(15)
);

CREATE TABLE tb_Vendas(
	cdVendas INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	cdCliente INT NOT NULL FOREIGN KEY REFERENCES tb_Clientes (cdCliente),
	dtVenda DATETIME NOT NULL
);

CREATE TABLE tb_ProdutoVenda(
	cdProdutoVenda INT PRIMARY KEY IDENTITY(1,1),
	cdVendas INT NOT NULL FOREIGN KEY REFERENCES tb_Vendas (cdVendas),
	cdProduto INT NOT NULL FOREIGN KEY REFERENCES tb_Produtos (cdProduto),
	qtProduto INT NOT NULL
);

ALTER TABLE tb_Vendas
ADD CONSTRAINT FK_Produto_Vendas
FOREIGN KEY(cdProduto)
REFERENCES tb_Produtos(cdProduto)

--APAGAR TABELA

--DROP TABLE tb_Vendas