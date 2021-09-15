USE Loja;

SELECT * FROM tb_Clientes

BEGIN TRAN;
ALTER TABLE tb_Clientes ADD cdEndereco INT;

ALTER TABLE tb_Clientes
ADD CONSTRAINT FK_ClienteEnderecos
FOREIGN KEY (cdEndereco)
REFERENCES tb_endereco (cdEndereco)

ROLLBACK TRAN;

--COMMIT TRAN;