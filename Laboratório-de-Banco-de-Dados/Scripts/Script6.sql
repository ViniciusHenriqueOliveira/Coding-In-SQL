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

--Aula do dia 16/10/24
--Join(SQL/92) ou mais atual
SELECT p.nm_produto AS PRODUTO, tp.nm_tipo_produto AS TIPO
FROM tb_produtos p
INNER JOIN tb_tipos_produtos tp ON (p.id_tipo_produto = tp.id_tipo_produto)
ORDER BY p.nm_produto;

--não-equijoin
SELECT f.nome, f.sobrenome, f.cargo, f.salario, gs.id_salario
FROM tb_funcionarios f 
INNER JOIN tb_grades_salarios gs ON (f.salario BETWEEN gs.base_salario AND gs.teto_salario)
ORDER BY gs.id_salario;

--Joins com USING
-- O uso de USING substituindo ON
SELECT p.nm_produto AS PRODUTO, tp.nm_tipo_produto AS TIPO
FROM tb_produtos p
INNER JOIN tb_tipos_produtos tp
USING (id_tipo_produto);

--Caso seja necessário exibir o ID_TIPO_PRODUTO, será necessário somente fornecer o nome da coluna sozinho, sem um nome ou apelido da tabela na cláusula SELECT
SELECT p.nm_produto AS PRODUTO, tp.nm_tipo_produto AS TIPO, id_tipo_produto
FROM tb_produtos p 
INNER JOIN tb_tipos_produtos tp
USING (id_tipo_produto);

--O nome da coluna dentro da cláusula USING deverá estar sozinho, se não gerará esse erro: ORA-01748: somente nomes simples de coluna permitidos aqui
--01748. 00000 -  "only simple column names allowed here"
SELECT p.nm_produto AS PRODUTO, tp.nm_tipo_produto AS TIPO, id_tipo_produto
FROM tb_produtos p
INNER JOIN tb_tipos_produtos tp
USING(p.id_tipo_produto);

-- JOINs internas em mais de duas tabelas usando SQL/92
SELECT c.nome, c.sobrenome, p.nm_produto AS produto, tp.nm_tipo_produto AS tipo
FROM tb_clientes c
INNER JOIN tb_compras co USING (id_cliente)
INNER JOIN tb_produtos p USING(id_produto)
INNER JOIN tb_tipos_produtos tp USING (id_tipo_produto)
ORDER BY p.nm_produto;

-- Joins Externas (SQL/92)
-- o OUTER é opcional, mas como estamos aprendendo vamos usar a sintaxe completa
-- LEFT OUTER JOIN
SELECT p.nm_produto AS produto, tp.nm_tipo_produto AS tipo
FROM tb_produtos p
LEFT OUTER JOIN tb_tipos_produtos tp USING (id_tipo_produto)
ORDER BY p.nm_produto;

--RIGHT OUTER JOIN
SELECT p.nm_produto AS produto, tp.nm_tipo_produto AS tipo 
FROM tb_produtos p
RIGHT OUTER JOIN tb_tipos_produtos tp USING (id_tipo_produto)
ORDER BY p.nm_produto;

--FULL OUTER JOIN
SELECT p.nm_produto AS produto, tp.nm_tipo_produto AS tipo
FROM tb_produtos p
FULL OUTER JOIN tb_tipos_produtos tp USING (id_tipo_produto)
ORDER BY p.nm_produto;

--Auto Join (SQL/92)
--nesse caso não é possível usar o USING pois é diferente o jeito nomeado as variáveis 
-- INNER JOIN
SELECT f.nome || '' || f.sobrenome || ' trabalha para ' || g.nome
FROM tb_funcionarios f
INNER JOIN tb_funcionarios g ON (f.id_gerente = g.id_funcionario)
ORDER BY f.nome;

--Join Cruzada (SQL/92)
SELECT *
FROM tb_tipos_produtos
CROSS JOIN tb_produtos;

--Variáveis Temporárias
SELECT id_produto, nm_produto, preco
FROM tb_produtos
WHERE id_produto = &v_id_produto;

-- exemplo, *v_coluna = id_produto    v_tabela = tb_produtos     v_id_produto = 1
--nesse caso vai ter que colocar a variavel v_coluna duas vezes
SELECT nm_produto, &v_coluna
FROM &v_tabela 
WHERE &v_coluna = &v_id_produto;

-- dois e comerciais (&&) significa que ele entende que tem que reutilizar, ou seja, não necessita inserir duas vezes 
SELECT nm_produto, &&v_coluna
FROM &v_tabela 
WHERE &&v_coluna = &v_id_produto;

-- Definir uma variável nomeada v_id_produto, atribuindo o valor 7
DEFINE v_id_produto = 7;

SELECT nm_produto, id_produto
FROM tb_produtos
WHERE id_produto = &v_id_produto;

--Variáveis Definidas
ACCEPT v_id NUMBER FORMAT 99 PROMPT 'Entre com ID';

SELECT id_produto, nm_produto, preco
FROM tb_produtos 
WHERE id_produto = &v_id;

-- UNDEFINE: comando utilizado para remover variáveis
DEFINE v_id_produto = 7;

SELECT nm_produto, id_produto
FROM tb_produtos
WHERE id_produto = &v_id_produto;

UNDEFINE v_id_produto;

--Relatórios Simples
/*Tem que criar um arquivo nomeado teste_1.sql, nisso tem que clicar em loja com o lado direito do mouse, lá seleciona 'Abir Planilha SQL',
ir na pasta em C:, dentro dela selecionar a pasta Temp.
  Em loja você só chama através desse comando que está abaixo, o código fica armazenado em teste_1.sql
*/
--Espaços nos nomes dos diretorios (inserir entre aspas tudo após o @)
@C:\Temp\teste_1.sql
