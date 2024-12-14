SELECT id_cliente 
FROM tb_compras;   

SELECT DISTINCT id_cliente
FROM tb_compras;  

SELECT * FROM tb_clientes WHERE id_cliente <> 2;         

SELECT id_produto, nm_produto FROM tb_produtos WHERE id_produto > 2;

SELECT ROWNUM, id_produto, nm_produto FROM tb_produtos WHERE ROWNUM <= 3 ;    

SELECT * FROM tb_produtos;    

SELECT * FROM tb_clientes WHERE id_cliente > ANY (2, 3, 4); 

SELECT * FROM tb_clientes WHERE id_cliente > ALL (2, 3, 4);   

SELECT * FROM tb_clientes WHERE nome LIKE '_o%';    

SELECT * FROM tb_clientes WHERE nome LIKE '%a'; 

SELECT * FROM tb_clientes WHERE nome LIKE 'J%'; 

SELECT * FROM tb_clientes WHERE nome LIKE '____'; 

SELECT nome FROM tb_promocao WHERE nome LIKE '%\%%'ESCAPE'\'; -- Usando o escape como \
 
SELECT nome FROM tb_promocao WHERE nome LIKE '%*%%'ESCAPE'*'; -- Usando o escape como *

SELECT * FROM tb_clientes WHERE id_cliente IN(2, 3, 5); 
 
SELECT * FROM tb_clientes WHERE id_cliente NOT IN(2, 3, 5);    

SELECT * FROM tb_clientes WHERE id_cliente NOT IN(2, 3, 5, NULL); 

SELECT * FROM tb_clientes WHERE id_cliente NOT IN(2, 3, 5, NVL(NULL, 0));

SELECT * FROM tb_clientes WHERE id_cliente BETWEEN 1 AND 3;  

SELECT * FROM tb_clientes WHERE id_cliente NOT BETWEEN 1 AND 3;   

SELECT * FROM tb_clientes WHERE dt_nascimento > '01/JAN/1970' AND id_cliente > 3; 

SELECT * FROM tb_clientes WHERE dt_nascimento > '01/JAN/1970' OR id_cliente > 3; 

SELECT * FROM tb_clientes WHERE dt_nascimento > '01/JAN/1970' OR id_cliente < 2 AND telefone LIKE '%1211'; 

SELECT * FROM tb_clientes ORDER BY sobrenome; 

SELECT * FROM tb_clientes ORDER BY nome ASC, sobrenome DESC; 
