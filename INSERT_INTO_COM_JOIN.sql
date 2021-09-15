SELECT * FROM tb_Cidade
SELECT * FROM tb_Clientes
SELECT * FROM tb_Endereco

BEGIN TRAN;

INSERT INTO tb_Endereco (nmEndereco, cdCidade)
SELECT
	C.nmEndereco,
	CI.cdCidade
FROM tb_Clientes C 
INNER JOIN tb_Cidade CI ON C.nmCidade = CI.nmCidade 

ROLLBACK TRAN;

COMMIT TRAN;