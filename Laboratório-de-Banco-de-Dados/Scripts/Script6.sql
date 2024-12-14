SELECT nm_produto, id_tipo_produto FROM tb_produtos WHERE id_produto = 3; 

SELECT nm_tipo_produto FROM tb_tipos_produtos WHERE id_tipo_produto = 2; 

SELECT tb_produtos.nm_produto, tb_tipos_produtos.nm_tipo_produto
FROM tb_produtos, tb_tipos_produtos
WHERE tb_produtos.id_tipo_produto = tb_tipos_produtos.id_tipo_produto AND tb_produtos.id_produto = 3; 

SELECT tb_produtos.nm_produto, tb_tipos_produtos.nm_tipo_produto
FROM tb_produtos, tb_tipos_produtos
WHERE tb_produtos.id_tipo_produto = tb_tipos_produtos.id_tipo_produto
ORDER BY tb_produtos.nm_produto;

SELECT p.nm_produto, tp.nm_tipo_produto
FROM tb_produtos p, tb_tipos_produtos tp
WHERE p.id_tipo_produto = tp.id_tipo_produto
ORDER BY p.nm_produto;

SELECT p.id_tipo_produto, tp.id_tipo_produto
FROM tb_produtos p, tb_tipos_produtos tp; 

SELECT c.nome, c.sobrenome, p.nm_produto AS produto,
tp.nm_tipo_produto AS tipo
FROM tb_clientes c, tb_compras co, tb_produtos p, tb_tipos_produtos tp
WHERE c.id_cliente = co.id_cliente AND
      p.id_produto = co.id_produto AND
      p.id_tipo_produto = tp.id_tipo_produto
ORDER BY p.nm_produto; --- JUNÇÃO EQUIVALANTE     

SELECT f.nome, f.sobrenome, f.cargo, f.salario, gs.id_salario
FROM tb_funcionarios f, tb_grades_salarios gs
WHERE f.salario BETWEEN gs.base_salario AND gs.teto_salario
ORDER BY gs.id_salario; --- JUNÇÂO NAO-EQUIVALANTE 

SELECT p.nm_produto AS produto,
       tp.nm_tipo_produto AS tipo
FROM tb_produtos p, tb_tipos_produtos tp
WHERE p.id_tipo_produto = tp.id_tipo_produto (+)
ORDER BY 1; --- JOIN EXTERNA ESQUERDA / LEFT OUTER-JOIN

SELECT *
FROM tb_tipos_produtos

SELECT p.nm_produto AS produto,
       tp.nm_tipo_produto AS tipo
FROM tb_produtos p, tb_tipos_produtos tp
WHERE p.id_tipo_produto (+) = tp.id_tipo_produto 
ORDER BY 1; --- JOIN EXTERNA DIRETA / RIGHT OUTER-JOIN 

SELECT p.nm_produto AS produto,
       tp.nm_tipo_produto AS tipo
FROM tb_produtos p, tb_tipos_produtos tp
WHERE p.id_tipo_produto (+) = tp.id_tipo_produto (+)
ORDER BY 1;

--01468. 00000 -  "a predicate may reference only one outer-joined table"

SELECT p.nm_produto AS produto,
       tp.nm_tipo_produto AS tipo
FROM tb_produtos p, tb_tipos_produtos tp
WHERE p.id_tipo_produto (+) = tp.id_tipo_produto
OR p.id_tipo_produto = 1; 

--ORA-25556: Um predicado sem o operador de junção externa (+) não é permitido no operando OR ou IN quando o operador de junção externa (+) está presente

SELECT f.nome || ' ' || f.sobrenome || ' trabalha para ' || 'quem? ' || g.nome
FROM tb_funcionarios f, tb_funcionarios g
WHERE f.id_gerente = g.id_funcionario
ORDER BY f.nome;

SELECT f.nome || ' trabalha para ' || NVL(g.sobrenome, 'os acionistas')
FROM tb_funcionarios f, tb_funcionarios g
WHERE f.id_gerente = g.id_funcionario (+)
ORDER BY f.sobrenome DESC;

SELECT * 
from tb_funcionarios 
