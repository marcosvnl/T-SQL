BEGIN TRAN;

CREATE TABLE #tmp_Cidade(
	cdCidade INT IDENTITY(1, 1),
	nmEstado VARCHAR(30),
	nmCidade VARCHAR(50),
	cdEstado INT
)

--DADOS NA TABELA TEMPORARIA 
INSERT INTO #tmp_Cidade(nmCidade, nmEstado)
SELECT DISTINCT nmCidade, nmEstado FROM tb_Clientes ORDER BY nmCidade;

--(mais complicado)
UPDATE TC
SET TC.cdEstado = E.cdEstado
FROM #tmp_Cidade TC
INNER JOIN tb_Clientes T ON TC.nmCidade = T.nmCidade
INNER JOIN tb_Estado E ON T.nmEstado = E.nmEstado

--(Mais fácil)
UPDATE TC SET
TC.cdEstado = E.cdEstado
--SELECT *
FROM #tmp_Cidade TC INNER JOIN tb_Estado E
ON TC.nmEstado = E.nmEstado

SELECT E.cdEstado, C.nmEstado FROM tb_Estado E
INNER JOIN tb_Clientes C ON E.nmEstado = C.nmEstado

SET IDENTITY_INSERT tb_Cidade ON; 

--INSERIR DADOS NA TABELA CIDADE
INSERT INTO tb_Cidade(cdCidade, cdEstado, nmCidade)
SELECT cdCidade, cdEstado, nmCidade FROM #tmp_Cidade

SET IDENTITY_INSERT tb_Cidade OFF; 

SELECT * FROM tb_Cidade

DROP TABLE #tmp_Cidade

SELECT * FROM #tmp_Cidade

ROLLBACK TRAN;