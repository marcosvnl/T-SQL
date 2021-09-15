CREATE VIEW VM_ClienteEnderecoEstado AS
SELECT
	CL.cdCliente,
	CL.nmCliente,
	CL.dtNascimento,
	CL.inSexo,
	CI.cdCidade,
	CI.nmCidade,
	EN.cdEndereco,
	EN.nmCEP,
	ES.cdEstado,
	ES.nmEstado,
	ES.nmSigla

FROM tb_Clientes CL
INNER JOIN tb_Cidade CI ON CL.cdCliente = CI.cdCidade
INNER JOIN tb_Endereco EN ON CL.cdEndereco = CL.cdEndereco
INNER JOIN tb_Estado ES ON ES.cdEstado = CI.cdEstado

SELECT * FROM VM_ClienteEnderecoEstado