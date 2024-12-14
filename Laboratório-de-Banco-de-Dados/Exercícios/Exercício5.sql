--Elabore uma consulta para exibir o nome do empregado, sua respectiva descrição da função e a data de admissão
--dos empregados admitidos entre o período de 20 de fevereiro de 1987 e 1 de maio de 1989. Ordene a consulta
--resultante de modo ascendente de maneira posicional pela data de admissão.

SELECT e.nome, f.ds_funcao, hf.data_inicio
FROM tb_empregado e
    INNER JOIN tb_funcao f ON tf.id_funcao = e.id_departamento
    INNER JOIN tb_historico_funcao hf ON hf.id_empregado = e.id_empregado
WHERE hf.data_inicio BETWEEN '1987-02-20' AND '1989-05-01'
ORDER BY hf.data_inicio ASC; 

--Elabore uma consulta para exibir o nome do empregado com todas as letras em maiúsculo, além do tamanho do
--sobrenome (quantidade de caracteres), nome do departamento e nome do país, para todos os empregados cujo
--nome inicia-se pelos caracteres B, L ou A. Forneça um label apropriado para cada coluna.

SELECT  UPPER(e.nome) AS "Nome", LENGTH(e.sobrenome) AS "Quantidade de caracteres", d.nm_departamento AS "Nome do departamento", p.nm_pais AS "Nome do pais",
FROM tb_empregado e
 INNER JOIN tb_departamento d ON d.id_departamento = e.id_departamento
 INNER JOIN tb_localizacao l ON l.id_localizacao = d.id_localizacao
 INNER JOIN tb_pais p ON p.id_pais = l.id_pais
WHERE e.nome LIKE 'B%' OR e.nome LIKE 'L%' OR e.nome 'A%';

--Elabore uma consulta para exibir o nome do empregado, o nome do departamento e sua respectiva localização
--(cidade e estado) de todos os empegados que recebem comissão.

SELECT e.nome, d.nm_departamento, l.cidade, l.estado
FROM tb_empregado e
 INNER JOIN tb_departamento d ON d.id_departamento = e.id_departamento
 INNER JOIN tb_localizacao l ON l.id_localizacao = d.id_localizacao
WHERE e.percentual_comissao > 0
--WHERE e.percentual_comissao IS NOT NULL // Poderia fazer desta maneira?

--Realize uma Auto Junção para recuperar o nome de cada empregado juntamente com o nome de seu respectivo
--gerente. Exemplo: João trabalha para o Tiago.
--Todos os empregados deverão ser recuperados, sem exceção. Para o empregado que NÃO possuir gerente
--vinculado, utilize a função apropriada do Oracle para substituir o valor nulo (NULL) do nome do gerente para o
--STRING “os acionistas”. Ordene de maneira descendente à relação resultante pelo NOME do gerente.

SELECT e.nome || ' trabalha para o ' || NVL(g.sobrenome, 'os acionistas')
FROM tb_empregado e, tb_empregado g
WHERE g.id_gerente = e.id_empregado (+)
ORDER BY e.sobrenome DESC;

--Elabore um procedimento armazenado utilizando a linguagem PL/SQL a qual receberá 1 parâmetro do tipo inteiro,
--representando o id_empregado. Identifique esse stored procedure de sp_get_emp(p_id integer). O procedimento
--armazenado deverá retornar o nome completo, juntamente com a descrição da função que o empregado
--correspondente ao ID informado como parâmetro de entrada (IN) exerce atualmente. Se, eventualmente, o
--usuário informar um ID de empregado inexistente, exibir uma mensagem informativa.

CREATE OR REPLACE PROCEDURE sp_get_emp(p_id INTEGER) AS
v_nome      VARCHAR2(45);
v_funcao    VARCHAR2(35);

BEGIN

    SELECT e.nome || ' ' || e.sobrenome, f.ds_funcao
    INTO v_nome, v_funcao
    FROM tb_empregado e
    INNER JOIN tb_funcao f ON (e.id_funcao = f.id_funcao)
    WHERE e.id_empregado = p_id;
    
    DBMS_OUTPUT.PUT_LINE('Nome: ' || v_nome || ' ' || 'Função: ' || v_funcao);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Empregado ' || p_id || ' não localizado!!!');
    
END sp_get_emp;
