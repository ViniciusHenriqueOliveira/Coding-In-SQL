--Elabore uma consulta para exibir o nome do empregado e o valor da comissão. Caso o
--empregado não tenha comissão, exibir o string Nenhuma comissão. Insira um label
--COMISSÃO para a coluna resultante.

SELECT nome, NVL(TO_CHAR(percentual_comissao), 'Nenhuma comissão') AS "COMISSÃO"
FROM tb_empregado

--Elabore uma consulta para exibir os nomes e as datas de admissão de todos os empregados
--junto com o nome do gerente e a data de admissão de todos os empregados admitidos
--antes dos respectivos gerentes. Insira um label Empregado, Empregado Data Admissão,
--Gerente e Gerente Data Admissão, nas respectivas colunas.

SELECT e.nome AS "Empregado", e.data_admissao AS "Empregado Data Admissão", g.nome AS "Gerente", g.data_admissao AS "Gerente Data Admissão"
FROM tb_empregado e
INNER JOIN tb_empregado g ON(e.id_empregado = g.id_gerente)
WHERE e.data_admissao < g.data_admissao; 

--Elabore uma consulta para exibir o maior salário, o salário médio, o menor salário e a soma
--de todos os salários de todos os empregados. Insira um label Máximo, Mínimo, Média e
--Somatório nas respectivas colunas. Realize o arredondamento dos resultados para o
--número inteiro mais próximo.

SELECT ROUND(MAX(salario), 0) AS "Máximo", ROUND(MIN(salario), 0) AS "Mínimo", ROUND(AVG(salario), 0) AS "Média", ROUND(SUM(salario), 0) AS "Somatório" 
FROM tb_empregado;

--Elabore uma consulta para exibir o número do gerente e o salário do empregado com menor
--salário sob a supervisão desse gerente. Desconsidere todos cujo o gerente não seja
--conhecido. Desconsidere qualquer grupo cujo salário mínimo seja inferior a R$ 1.000,00.
--Ordene a saída de forma descendente pelo menor salário.

SELECT id_gerente, MIN(salario)
FROM tb_empregado
WHERE id_gerente IS NOT NULL
GROUP BY id_gerente
HAVING MIN(salario) >= 1000
ORDER BY MIN(salario) DESC;  

--Elabore uma consulta responsável por exibir o número total de empregados e, desse total, o
--número total de empregados contratados em 1990, 1991, 1992 e 1993. Insira os cabeçalhos
--apropriados nas colunas.

SELECT 
COUNT(*) AS "Número total de empregados",
SUM(CASE WHEN EXTRACT(YEAR FROM data_admissao) = 1990 THEN 1 ELSE 0 END) AS "Contratados em 1990",
SUM(CASE WHEN EXTRACT(YEAR FROM data_admissao) = 1991 THEN 1 ELSE 0 END) AS "Contratados em 1991",
SUM(CASE WHEN EXTRACT(YEAR FROM data_admissao) = 1992 THEN 1 ELSE 0 END) AS "Contratados em 1992",
SUM(CASE WHEN EXTRACT(YEAR FROM data_admissao) = 1993 THEN 1 ELSE 0 END) AS "Contratados em 1993"
FROM tb_empregado;  

--Pode ser feito dessa maneira

SELECT COUNT(*) total, 
       SUM(DECODE(TO_CHAR(data_admissao, 'YYYY'),1990,1,0)) "1990",
       SUM(DECODE(TO_CHAR(data_admissao, 'YYYY'),1991,1,0)) "1991",
       SUM(DECODE(TO_CHAR(data_admissao, 'YYYY'),1992,1,0)) "1992",
       SUM(DECODE(TO_CHAR(data_admissao, 'YYYY'),1993,1,0)) "1993"
FROM tb_empregado;

-- Elabore uma consulta para exibir os nomes dos empregados e indique o valor dos salários
--por meio de asteriscos. Cada asterisco representa mil reais. Classifique as tuplas
--resultantes de forma descendente pelo salário. Insira um label Funcionários e seus
--Salários para a coluna resultante.

SELECT 
    nome AS "Funcionários",
    RPAD('*', FLOOR(salario / 1000), '*') AS "Funcionários e seus salários"
FROM 
    tb_empregado
ORDER BY 
    salario DESC;
    
--Elabore uma consulta para exibir todos os atributos da tb_empregado. Separe cada
--atributo por uma vírgula. Identifique a coluna resultante como Saída.

DESCRIBE tb_empregado

SELECT id_empregado || ', ' || nome || ', ' || sobrenome || ', ' || email || ', ' || telefone || ', ' || data_admissao || ', ' ||
       id_funcao || ', ' || salario || ', ' || percentual_comissao || ', ' || id_gerente || ', ' || id_departamento AS "Saída"
FROM tb_empregado; 

--Elabore uma consulta cuja finalidade é exibir a classe de todos os empregados com base no
--valor da coluna id_funcao, de acordo com a tabela apresentada abaixo:
--SH_CLERK      A
--ST_MAN        B
--AC_ACCOUNT    C
--AC_MGR        D
--IT_PROG       E
--Nenhuma das alternativas acima 0 (zero)

SELECT nome, id_funcao,
    CASE
        WHEN id_funcao = 'SH_CLERK' THEN 'A'
        WHEN id_funcao = 'ST_MAN' THEN 'B'
        WHEN id_funcao = 'AC_ACCOUNT' THEN 'C'
        WHEN id_funcao = 'AC_MGR' THEN 'D'
        WHEN id_funcao = 'IT_PROG' THEN 'E'
        ELSE '0' END AS "Classe"
FROM tb_empregado;  

-----------------Pode ser feito desssa maneira

SELECT id_funcao, DECODE(id_funcao,'IT_PROG', 'E',
                                   'AC_MGR', 'D',
                                   'AC_ACCOUNT', 'C',
                                   'ST_MAN', 'B',
                                   'SH_CLERK', 'A',
                                   '0') GRADE 
FROM tb_empregado;

--Elabore uma consulta para exibir o nome de cada empregado e calcule o número de meses entre 
--a data atual e a data em que o empregado foi admitido. Coloque um label Meses
--Trabalhado para a coluna resultante. Ordene as tuplas resultantes pelo número de meses
--desde a data de admissão.

SELECT nome, FLOOR(MONTHS_BETWEEN(SYSDATE, data_admissao)) AS "Meses Trabalhado"
FROM tb_empregado
ORDER BY "Meses Trabalhado";

--Elabore uma consulta para exibir o nome do empregado, o nome do departamento e a
--localização (cidade e estado) de todos os empregados que recebem comissão.

SELECT e.nome, d.nm_departamento, l.cidade, l.estado
FROM tb_empregado e
INNER JOIN tb_departamento d ON (e.id_departamento = d.id_departamento)
INNER JOIN tb_localizacao l ON(d.id_localizacao = l.id_localizacao)
WHERE percentual_comissao IS NOT NULL;

--Exibir o número do empregado, o nome, o salário e o aumento salarial de 15%, esse expresso
--como inteiro. Adicione um label na coluna resultante como Novo Salário.

SELECT id_empregado, nome, salario, (salario * 1.15) AS "Novo Salário"
FROM tb_empregado; 

--Exibir o nome do empregado, a data de admissão e a data de revisão do salário, que
--corresponde a primeira segunda-feira após seis meses de trabalho. Coloque um label
--Revisão para a coluna.

SELECT nome, data_admissao, NEXT_DAY(ADD_MONTHS(data_admissao, 6), 2) AS "Revisão"
FROM tb_empregado

--Elabore uma consulta para exibir o nome do empregado com a primeira letra em maiúsculo
--e todas as outras em minúsculos, além do tamanho do nome, para todos os empregados
--cujo o nome inicia-se pelos caracteres J, A ou M. Forneça um label apropriado para cada coluna.

SELECT INITCAP(nome) AS "Nome empregado", LENGTH(nome) AS "Comprimento do Nome"
FROM tb_empregado
WHERE nome LIKE 'J%' OR nome LIKE 'A%' OR nome LIKE 'M%';

--Elabore uma consulta responsável por substituir o string SH para SHIPPING da coluna
--id_funcao presenta na tb_empregado, para todos as funções que iniciam com o string SH.

SELECT nome, id_funcao, REPLACE(id_funcao, 'SH', 'SHIPPING') AS "Saída"
FROM tb_empregado
WHERE SUBSTR(id_funcao, 1, 2) = 'SH';

--Elabore uma consulta para exibir o id_departamento, o menor e o maior salário, cujo os
--menores salários sejam inferiores a R$ 7.000,00. Ordene as tuplas resultantes pelos
--menores salários.

SELECT id_departamento, MIN(salario), MAX(salario)
FROM tb_empregado
GROUP BY id_departamento
HAVING MIN(salario) < 7000
ORDER BY MIN(salario);  
