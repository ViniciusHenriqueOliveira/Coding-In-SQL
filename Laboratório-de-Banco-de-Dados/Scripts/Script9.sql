SELECT TO_NUMBER('970,13')
FROM dual; 

SELECT TO_NUMBER('-$12,345.67', '$99,999.99')
FROM dual; 

SELECT
 CAST(12345.67 AS VARCHAR2(10)),
 CAST('9A4F' AS RAW(2)),
 CAST('01-DEZ-2023' AS DATE),
 CAST(12345.678 AS NUMBER(10,2))
FROM dual;  

SELECT
 CAST(preco AS VARCHAR2(10)),
 CAST(preco + 2 AS NUMBER(7,2)),
 CAST(preco AS BINARY_DOUBLE)
FROM tb_produtos
WHERE id_produto = 1;  

--------------- Nível Intermediário-----------------

SELECT id_cliente, nome, sobrenome, dt_nascimento
FROM tb_clientes
WHERE REGEXP_LIKE(TO_CHAR(dt_nascimento, 'YYYY'), '196[5-8]$'); 

SELECT id_cliente, nome, sobrenome, dt_nascimento
FROM tb_clientes
WHERE REGEXP_LIKE(nome, 'j', 'i');  
    
SELECT 
 REGEXP_INSTR('Teste de expressão regular', 'e', 6, 2) AS resultado 
FROM dual; 
    
SELECT REGEXP_REPLACE('Teste de expressão regular', 'd[[:alpha:]]{1}', 'Oracle') AS resultado
FROM dual; 

SELECT
 REGEXP_SUBSTR('Teste de expressão regular', 'e[[:alpha:]]{8}') AS resultado
FROM dual;  

SELECT 
 REGEXP_COUNT('teste teste teste expressão regular', 't[[:alpha:]]{4}') AS resultado
FROM dual; 

SELECT AVG(preco)
FROM tb_produtos; 

SELECT ROUND(AVG(preco), 2)
FROM tb_produtos; 

SELECT AVG(preco + 2.00)
FROM tb_produtos; 

SELECT AVG(DISTINCT preco)
FROM tb_produtos;

SELECT COUNT(id_produto)
FROM tb_produtos; 

SELECT COUNT(ROWID)
FROm tb_produtos;  

SELECT MAX(preco), MIN(preco)
FROM tb_produtos; 

SELECT nm_produto, preco
FROM tb_produtos
WHERE preco = (SELECT MAX(preco)
                FROM tb_produtos);   

SELECT MAX(nm_produto), MIN(nm_produto)
FROM tb_produtos; 

SELECT MAX(dt_nascimento), MIN(dt_nascimento)
FROM tb_clientes; 

SELECT STDDEV(preco)
FROM tb_produtos;  

SELECT id_tipo_produto
FROM tb_produtos
GROUP BY id_tipo_produto; 

SELECT id_produto, id_cliente
FROM tb_compras
GROUP BY id_produto, id_cliente; 

SELECT id_tipo_produto, COUNT(ROWID)
FROM tb_produtos
GROUP BY id_tipo_produto
ORDER BY id_tipo_produto; 

SELECT p.id_tipo_produto, t.nm_tipo_produto, ROUND(AVG(preco), 2) AS "Média"
FROM tb_produtos p
INNER JOIN tb_tipos_produtos t ON (p.id_tipo_produto = t.id_tipo_produto)
GROUP BY p.id_tipo_produto, t.nm_tipo_produto
ORDER BY id_tipo_produto;  
