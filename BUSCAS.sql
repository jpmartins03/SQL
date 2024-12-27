

/*(a) Pesquise os itens que foram vendidos sem desconto. As colunas presentes no resultado
da consulta são: ID_NF, ID_ITEM, COD_PROD E VALOR_UNIT.*/

CREATE VIEW itens_sem_desconto AS
SELECT ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT
FROM notas_fiscais
WHERE desconto = NULL;


/*(b) Pesquise os itens que foram vendidos com desconto. As colunas presentes no resultado
da consulta são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT E O VALOR
VENDIDO. OBS: O valor vendido é igual ao V ALOR_UNIT − (V ALOR_UNIT ∗
(DESCONT O/100)).*/

CREATE VIEW itens_com_desconto AS
SELECT
	ID_NF,
	ID_ITEM,
	COD_PROD,
	VALOR_UNIT,
	VALOR_UNIT - (VALOR_UNIT * (DESCONTO/100)) AS VALOR_VENDIDO
FROM 
	notas_fiscais
WHERE
	desconto IS NOT NULL;

/*(c) Altere o valor do desconto (para zero) de todos os registros onde este campo é nulo.*/

UPDATE notas_fiscais
SET DESCONTO = 0
WHERE DESCONTO IS NULL;


/*(d) Pesquise os itens que foram vendidos. As colunas presentes no resultado da consulta são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, VALOR_TOTAL,
DESCONTO, VALOR_VENDIDO. OBS: O VALOR_TOTAL é obtido pela fórmula:
QUANTIDADE * VALOR_UNIT. O VALOR_VENDIDO é igual a VALOR_UNIT
- (VALOR_UNIT*(DESCONTO/100)).*/

CREATE VIEW itens_vendidos AS
SELECT 
    ID_NF, 
    ID_ITEM, 
    COD_PROD, 
    VALOR_UNIT,
    QUANTIDADE * VALOR_UNIT AS VALOR_TOTAL,
    DESCONTO,
    VALOR_UNIT - (VALOR_UNIT * (DESCONTO / 100)) AS VALOR_VENDIDO
FROM 
    notas_fiscais;  


/*(e) Pesquise o valor total das NF e ordene o resultado do maior valor para o menor.
As colunas presentes no resultado da consulta são: ID_NF, VALOR_TOTAL. OBS:
O VALOR_TOTAL é obtido pela fórmula: P QUANTIDADE * VALOR_UNIT.
Agrupe o resultado da consulta por ID_NF.*/

CREATE VIEW total_nf AS
SELECT 
	ID_NF,
	sum(quantidade * valor_unit) AS VALOR_TOTAL
FROM
	notas_fiscais
GROUP BY
	id_nf
ORDER BY
	VALOR_TOTAL DESC;

/*(f) Pesquise o valor vendido das NF e ordene o resultado do maior valor para o menor. As
colunas presentes no resultado da consulta são: ID_NF, VALOR_VENDIDO. OBS:
O VALOR_TOTAL é obtido pela fórmula: P QUANTIDADE * VALOR_UNIT. O
VALOR_VENDIDO é igual a P V ALOR_UNIT−(V ALOR_UNIT∗(DESCONT O/100)).
Agrupe o resultado da consulta por ID_NF.*/

CREATE VIEW valor_vendido_nfs AS
SELECT 
    ID_NF,
    SUM((VALOR_UNIT - (VALOR_UNIT * (DESCONTO / 100))) * QUANTIDADE) AS VALOR_VENDIDO
FROM 
    notas_fiscais
GROUP BY 
    ID_NF
ORDER BY 
    VALOR_VENDIDO DESC;

/*(g) Consulte o produto que mais vendeu no geral. As colunas presentes no resultado
da consulta são: COD_PROD, QUANTIDADE. Agrupe o resultado da consulta por
COD_PROD.*/

CREATE VIEW mais_vendido AS
SELECT
	COD_PROD,
	SUM(QUANTIDADE) AS QUANTIDADE
FROM
	notas_fiscais
GROUP BY
	COD_PROD
ORDER BY
	QUANTIDADE DESC
LIMIT 1;

/*(h) Consulte as NF que foram vendidas mais de 10 unidades de pelo menos um produto.
As colunas presentes no resultado da consulta são: ID_NF, COD_PROD, QUANTIDADE. Agrupe o resultado da consulta por ID_NF, COD_PROD.*/

CREATE VIEW mais_de_dez AS
SELECT
	ID_NF,
	COD_PROD,
	SUM(QUANTIDADE) AS QUANTIDADE
FROM
	notas_fiscais
GROUP BY
	ID_NF,
	COD_PROD
HAVING
	SUM(QUANTIDADE) > 10;




/*(i) Pesquise o valor total das NF, onde esse valor seja maior que 500, e ordene o resultado do maior valor para o menor. As colunas presentes no resultado da consulta
são: ID_NF, VALOR_TOT. OBS: O VALOR_TOTAL é obtido pela fórmula: P
QUANTIDADE * VALOR_UNIT. Agrupe o resultado da consulta por ID_NF.*/

CREATE VIEW valor_total_nfs_maior_que_500 AS
SELECT 
    ID_NF,
    SUM(QUANTIDADE * VALOR_UNIT) AS VALOR_TOT
FROM 
    notas_fiscais
GROUP BY 
    ID_NF
HAVING 
    SUM(QUANTIDADE * VALOR_UNIT) > 500
ORDER BY 
    VALOR_TOT DESC;


/*(j) Qual o valor médio dos descontos dados por produto. As colunas presentes no resultado da consulta são: COD_PROD, MEDIA. Agrupe o resultado da consulta por
COD_PROD.*/

CREATE VIEW media_descontos_por_produto AS
SELECT 
    COD_PROD,
    AVG(DESCONTO) AS MEDIA
FROM 
    notas_fiscais
GROUP BY 
    COD_PROD;
