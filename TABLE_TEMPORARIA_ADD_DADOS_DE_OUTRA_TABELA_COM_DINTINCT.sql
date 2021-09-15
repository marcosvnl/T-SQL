CREATE TABLE tb_Endereco (
	cdEndereco INT NOT NULL PRIMARY KEY IDENTITY (1, 1),
	cdCidade INT NOT NULL,
	nmEndereco VARCHAR(50) NOT NULL,
	nmCEP VARCHAR(9) 
) 

CREATE TABLE tb_Cidade (
	cdCidade INT NOT NULL PRIMARY KEY IDENTITY (1, 1),
	cdEstado INT NOT NULL,
	nmCidade VARCHAR (30) NOT NULL	
)

CREATE TABLE tb_Estado (
	cdEstado INT NOT NULL PRIMARY KEY IDENTITY (1, 1),
	nmEstado VARCHAR (30),
	nmSigla VARCHAR (2) NOT NULL
)

ALTER TABLE tb_Endereco ADD CONSTRAINT FK_EnderecoCidade FOREIGN KEY (cdCidade) REFERENCES tb_Cidade (cdCidade)
ALTER TABLE tb_Cidade ADD CONSTRAINT FK_CidadeEstado FOREIGN KEY (cdEstado) REFERENCES tb_Estado (cdEstado)

CREATE TABLE #tmp_Estado (
	nmEstado VARCHAR (30),
	nmSigla VARCHAR (2)
)

--INSERIR OS DADOS DOS ESTADOS NAS TABEÇA TEMPORÁRIA
INSERT INTO #tmp_Estado (nmEstado)
SELECT DISTINCT nmEstado FROM tb_Clientes;

SELECT * FROM #tmp_Estado

UPDATE #tmp_Estado SET nmSigla = 'SP' WHERE nmEstado = 'São Paulo'



DROP TABLE #tmp_Estado