--Função Distinct (suprime as linhas em duplicidade)
SELECT id_cliente
FROM tb_compras;

SELECT DISTINCT id_cliente
FROM tb_compras;

--Comparando valores
SELECT *
FROM tb_clientes
WHERE id_cliente <> 2;

SELECT id_produto, nm_produto
FROM tb_produtos
WHERE id_produto > 2;

SELECT ROWNUM,id_produto, nm_produto
FROM tb_produtos
WHERE ROWNUM <= 3;

SELECT *
FROM tb_clientes
WHERE id_cliente > ANY(2,3,4);

SELECT *
FROM tb_clientes
WHERE id_cliente > ALL(2,3,4);

-- Usando os Operadores SQL
--Operador LIKE
--Curiinga do LIKE é o '%' e o '_'
SELECT *
FROM tb_clientes
WHERE nome LIKE '_o%';

SELECT *
FROM tb_clientes
WHERE nome LIKE '%a';

SELECT *
FROM tb_clientes
WHERE nome LIKE 'J%';

SELECT *
FROM tb_clientes
WHERE nome LIKE '____';

--Operador IN
SELECT *
FROM tb_clientes
WHERE id_cliente IN(2,3,5);

SELECT *
FROM tb_clientes
WHERE id_cliente NOT IN(2,3,5);

--O NULL vai inviabilizar as outras tuplas, por isso que não vai mostrar nenhuma tupla, e não porque não satisfaz o predicado
SELECT * 
FROM tb_clientes
WHERE id_cliente NOT IN(2,3,5,NULL);

--Como usou o NVL todo resultado NULL vai ser transformado em 0, por conta disso, vai ter resultados que satisfaz o predicado dessa vez
SELECT *
FROM tb_clientes
WHERE id_cliente NOT IN(2,3,5, NVL(NULL, 0));

--Operador BETWEEN
--Recupera os valores que estão entre o 1 e 3
SELECT *
FROM tb_clientes
WHERE id_cliente BETWEEN 1 AND 3;

--Análogo : de como não usar o BETWEEN sem usar esse operador
SELECT *
FROM tb_clientes
WHERE id_cliente >= 1 AND
      id_cliente <= 3;
    
SELECT *
FROM tb_clientes
WHERE id_cliente NOT BETWEEN 1 AND 3;

--Operadores lógicos: 'AND', 'OR' e 'NOT'
SELECT *
FROM tb_clientes
WHERE dt_nascimento > '01/JAN/1970' AND
      id_cliente > 3;
      
SELECT *
FROM tb_clientes
WHERE dt_nascimento > '01/JAN/1970' OR
      id_cliente > 3;
      
--Precedencia de operadores
--O AND tem precedência em OR, ou seja, sem parenteses o AND é verificado primero que o OR
SELECT *
FROM tb_clientes
WHERE dt_nascimento > '01/JAN/1970' OR
      id_cliente < 2 AND
      telefone LIKE '%1211'; 
      
--Cláusula ORDER BY
SELECT *
FROM tb_clientes
ORDER BY sobrenome;

SELECT *
FROM tb_clientes
ORDER BY nome ASC, sobrenome DESC;

SELECT id_cliente, nome,sobrenome
FROM tb_clientes
ORDER BY 1;
