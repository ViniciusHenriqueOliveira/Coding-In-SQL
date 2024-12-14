SELECT id_tipo_produto, VARIANCE(preco)
FROM tb_produtos
GROUP BY id_tipo_produto
ORDER BY id_tipo_produto; 

SELECT VARIANCE(preco)
FROM tb_produtos
GROUP BY id_tipo_produto
ORDER BY VARIANCE(preco); 

SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos; 

--ORA-00937: não é uma função de grupo de grupo simples
--00937. 00000 -  "not a single-group group function"

SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos
WHERE AVG(preco) > 20.00
GROUP BY id_tipo_produto;  

--ORA-00934: a função de grupo não é permitida aqui
--00934. 00000 -  "group function is not allowed here"

SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos
GROUP BY id_tipo_produto
HAVING AVG(preco) > 20.00; 

CREATE TABLE tb_pessoas(
nm_pessoa         VARCHAR2(60)
);

SELECT *
FROM tb_pessoas;
-- Realizando a carga na tb_pessoas

-- Executar 2 x
INSERT INTO tb_pessoas
VALUES
('Bruno');

-- Executar 1 x
INSERT INTO tb_pessoas
VALUES
('Diego');

-- Executar 3 x
INSERT INTO tb_pessoas
VALUES
('Nicole');

-- Executar 1 x 
INSERT INTO tb_pessoas
VALUES
('Rafael');

-- Executar 4 x
INSERT INTO tb_pessoas
VALUES
('Fernando');

SELECT *
FROM tb_pessoas;

SELECT nm_pessoa AS "Nomes duplicados"
FROM tb_pessoas
GROUP BY nm_pessoa
HAVING COUNT(1) > 1; 

SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos
WHERE preco < 15.00
GROUP BY id_tipo_produto
ORDER BY id_tipo_produto;   

SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos
WHERE preco < 15.00
GROUP BY id_tipo_produto
HAVING AVG(preco) > 13.00
ORDER BY id_tipo_produto; 

INSERT INTO tb_clientes (id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
VALUES (7, 'Steve', 'Purple', DATE '1972-10-25', '800-55-1215', 1); 

SELECT *
FROM tb_clientes
ORDER BY id_cliente; 

ROLLBACK;  

SELECT id_cliente, TO_CHAR(dt_nascimento, 'MONTH DD, YYYY')
FROM tb_clientes; 

SELECT TO_CHAR(SYSDATE, 'MONTH DD, YYYY, HH24:MI:SS')
FROM dual;

SELECT TO_CHAR(TO_DATE('05-FEV-1968'), 'MONTH DD, YYYY')
FROM dual;  

SELECT TO_DATE('04-JUL-2023'), TO_DATE('04-JUL-23')
FROM dual; 

SELECT TO_DATE('Jul 04, 2023', 'MONTH DD, YYYY')
FROM dual; 

SELECT *
FROM nls_session_parameters; 

ALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY'; 

SELECT TO_DATE('7.4.23', 'MM.DD.YY')
FROM dual; 

INSERT INTO tb_clientes(id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
VALUES (10, 'Nome', 'Sobrenome', TO_DATE('Jul 04, 2013 19:32:36', 'MONTH DD, YYYY HH24:MI:SS'), '800-555-1215', 1); 

SELECT id_cliente, TO_CHAR(dt_nascimento, 'DD-MON-YYYY HH24:MI:SS')
FROm tb_clientes
ORDER By id_cliente; 

ROLLBACK;  

SELECT TO_CHAR(TO_DATE('Jul 04, 2023 19:32:36', 'MONTH DD, YYYY HH24:MI:SS'), 'HH24:MI:SS')
FROM dual; 

SELECT 
 TO_CHAR(TO_DATE('Jul 04,15', 'MONTH DD, YY'), 'MONTH DD, YYYY'),
 TO_CHAR(TO_DATE('Jul 04,75', 'MONTH DD, YY'), 'MONTH DD, YYYY')
FROM dual; 

SELECT 
 TO_CHAR(TO_DATE('Jul 04,15', 'MONTH DD, RR'), 'MONTH DD, YYYY'),
 TO_CHAR(TO_DATE('Jul 04,75', 'MONTH DD, RR'), 'MONTH DD, YYYY')
FROM dual; 

SELECT ADD_MONTHS('Jul 01, 2023', 13)
FROM dual; 

SELECT LAST_DAY('JUL 01, 2023')
FROM dual; 

SELECT MONTHS_BETWEEN('Jul 03, 2023', 'Mai 01, 2021')
FROM dual; --Cai na prova, perguntando o quantidade de ano

SELECT NEXT_DAY('Jul 03, 2023', 1)
FROM dual; 

SELECT NEXT_DAY(SYSDATE, 1)
FROM dual; 
