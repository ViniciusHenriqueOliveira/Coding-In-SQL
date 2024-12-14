CREATE TABLE mulher(
id_mulher		INTEGER,
nome_mulher		VARCHAR2(10),
PRIMARY KEY(id_mulher));

CREATE TABLE homem(
id_homem		INTEGER,
nome_homem 		VARCHAR2(10),
ud_mulher		INTEGER,
PRIMARY KEY(id_homem),
FOREIGN KEY(id_mulher) REFERENCES mulher(id_mulher));

INSERT INTO mulher VALUES ( 1, ‘Edna’);
INSERT INTO mulher VALUES ( 2, ‘Stefanny’);
INSERT INTO mulher VALUES ( 3,  ‘Cássia’);

INSERT INTO homem VALUES ( 10, ‘Anderson’);
INSERT INTO homem VALUES ( 20, ‘Jander’, 1);
INSERT INTO homem VALUES ( 30, ‘Rogério’, 2);

--a. Selecionar os casamentos 
SELECT *
FROM mulher m, homem h
WHERE m.id_mulher = h.id_mulher;

--b. Selecionar os casamentos utilizando NATURAL JOIN 
SELECT * FROM mulher NATURAL JOIN homem;

--c. Selecionar os casamentos utilizando JOIN...USING 
SELECT *
FROM mulher m
INNER JOIN homem h
USING(id_mulher);

--d. Selecionar os casamentos utilizando JOIN...ON 
SELECT *
FROM mulher m
INNER JOIN homem h ON (m.id_mulher = h.id_mulher);

--e. Por meio de um produto cartesiano, simule todos os casamentos possíveis. Existem duas respostas para essa questão, realize ambas 
SELECT *
FROM mulher
CROSS JOIN homem;

SELECT *
FROM homem h, mulher m;

--f. Selecionar os casamentos, caso não exista homens casados, é desejável exibi-los 
SELECT *
FROM mulher m, homem h
WHERE m.id_mulher (+) = h.id_mulher;

--g. Selecionar os casamentos, caso não exista mulheres casadas, é desejável exibi-las 
SELECT *
FROM mulher m, homem h
WHERE m.id_mulher = h.id_mulher (+);

--h. Além do símbolo (+), um OUTER JOIN pode ser realizada por meio da NATURAL OUTER JOIN, OUTER  JOIN...USING e OUTER JOIN...ON. Selecionar os casamentos e todos os homens que não estejam  casados 
SELECT *
FROM homem h
LEFT OUTER JOIN mulher m ON ( h.id_mulher = m.id_mulher);

--i. Selecionar os casamentos e todas as mulheres mesmo que não estejam casadas 
SELECT *
FROM homem h
RIGHT OUTER JOIN mulher m ON ( h.id_mulher = m.id_mulher);

--j. Refaça as consultas acima (c e d) usando OUTER JOIN...USING e OUTER JOIN...ON k. Selecionar todos os casamentos e, caso não exista homens e mulheres casados também é desejável  exibi-los. 
SELECT *
FROM mulher m
FULL OUTER JOIN homem h USING (id_mulher);

SELECT *
FROM mulher m
FULL OUTER JOIN homem h ON (m.id_mulher = h.id_mulher);

--k. Refaça a consulta anterior (f) usando OUTER JOIN...USING e OUTER JOIN...ON. Observe que não é  possível o uso do símbolo (+). 
SELECT *
FROM mulher m
FULL OUTER JOIN homem h USING (id_mulher);

SELECT *
FROM mulher m
FULL OUTER JOIN homem h ON (m.id_mulher = h.id_mulher);

