SELECT *
FROM tb_clientes;

SELECT *
FROM tb_clientes
WHERE id_cliente = 2;

SELECT ROWID, id_cliente
FROM tb_clientes;

SELECT ROWNUM, id_cliente, nome, sobrenome
FROM tb_clientes;

SELECT ROWNUM, id_cliente, nome, sobrenome
FROM tb_clientes
WHERE id_cliente = 3; 
 
SELECT 2 * 6
FROM dual; 

SELECT 10 * 12 / 3 - 1
FROM dual; 

SELECT 10 * (12 / 3 - 1)
FROM dual;  

SELECT TO_DATE('22/JUN/2023') + 2     
FROM dual;      

SELECT TO_DATE('31/DEZ/2023') - TO_DATE('22/JUN/2023') FROM dual; 

SELECT nm_produto, preco, preco + 2,00 FROM tb_produtos; 

DESCRIBE dual;

SELECT *
FROM dual;  

SELECT preco, preco * 2 DOBRO_PREÇO
FROM tb_produtos; 

SELECT preco, preco * 2 "Dobro do Preço"
FROM tb_produtos;  

SELECT preco, preco * 2 AS "Dobro do Preço"
FROM tb_produtos;  

SELECT nome ||' '|| sobrenome "Nome do Cliente"
FROM tb_clientes; 

SELECT 'O funcionário ' || nome || ' ' || sobrenome ||
' recebe o salário de R$ ' || salario || ', mas deseja ' || 
salario * 3 "Salário dos Sonhos"
FROM tb_funcionarios

SELECT id_cliente, nome, sobrenome, dt_nascimento
FROM tb_clientes
WHERE dt_nascimento IS NULL; 

SELECT id_cliente, nome, sobrenome, telefone
FROM tb_clientes
WHERE telefone IS NULL;  

SELECT id_cliente, nome, sobrenome, NVL(telefone, 'Número do telefone desconhecimento') AS Número_Telefone
FROM tb_clientes;  

SELECT id_cliente, nome, sobrenome, NVL(dt_nascimento, '22/JUN/2013') AS "Data de Nascimento"
FROM tb_clientes;   

SELECT  nome, LENGTH(nome)"expressão 1",
        sobrenome, LENGTH(sobrenome)"expressão 2",
        NULLIF(LENGTH(nome),LENGTH(sobrenome))"resultado"
FROM tb_funcionarios; 

SELECT nome, sobrenome, COALESCE(dt_nascimento, TO_DATE('04/SET/24')) "Exemplo COALESCE"
FROM tb_clientes
WHERE id_cliente = 4; 

SELECT  nome, sobrenome,
        COALESCE(telefone, TO_CHAR('Telefone insexistente')) "Exemplo COALESCE"
FROM tb_clientes; 
