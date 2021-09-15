USE Loja

--CREATE TABLE tb_Clientes_Hist(
--	cdClientes_Hist INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
--	cdCliente INT NOT NULL,
--	nmCliente VARCHAR(50),
--	dtNascimento DATETIME,
--	inSexo CHAR,
--	cdEndereco INT,
--	dtInclusao DATETIME
--)

/*
NOTA:
	- As triger que retem o dato antes da alteração pode servir de Backup
	  de dados "Alterados" ou "Deletados"
*/

BEGIN TRAN;

CREATE TRIGGER tr_Backup_clientes 
ON tb_Clientes
FOR UPDATE AS
	INSERT INTO tb_Clientes_Hist(
		cdCliente,
		nmCliente,
		dtNascimento,
		inSexo,
		cdEndereco,
		dtInclusao
	)
	SELECT cdCliente, nmCliente, dtNascimento, inSexo, cdEndereco, GETDATE() FROM deleted;