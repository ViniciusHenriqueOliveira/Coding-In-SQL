<h1 align="left"> Codando em SQL</h1>

###

<p align="left"> Nesse repositório estarão contidos conceitos e exercícios em SQL, ordenado por cada disciplina que tive na faculdade de Engenharia da Computação. </p>

###

<h1 align="left"> Banco de Dados</h1>

###

<p align="left"><strong>Conceitos abordados:</strong></p>

###

[Modelo Entidade Relacionamento](Banco-de-Dados/DER)<br>

[Modelo Relacional](Banco-de-Dados)<br>

[Criação de tabela em SQL, utilizando o Oracle Live SQL](Banco-de-Dados)<br>

Álgebra Relacional<br>

### 

[*Acesse a disciplina clicando aqui*](https://github.com/ViniciusHenriqueOliveira/Coding-In-SQL/tree/main/Banco-de-Dados)

### 

<h1 align="left"> Laboratório de Banco de Dados </h1>  

###

<p align="left"> SQL Developer foi a interface gráfica utilizada nesta disciplina, afinal é um ambiente de desenvolvimento que permite inserir instruções SQL, examinar tabelas, executar scripts, editar/depurar códigos PL/SQL, entres outras funções...</p>

###

<p align="left">Versão do Oracle mais recente foi usada: Oracle Database 23ai (14/12/2024)</p>

###

<h3 align="left"><strong>Conceitos abordados:</strong></h3>


###

**Instruções SQL**<br>
- Instruções de consultas<br>
Recuperam linhas armazenadas nas tabelas.<br>
Comando *SELECT*<br><br>
- Instruções DML(Data Manipulation Language)<br>
Modificam o conteúdo das tabelas.<br><br>
- Instruções DDL(Data Definition Language)<br>
Utilizada para criar objetos e estruturas.<br>
Exemplo de Sintaxe: *Create USER nome_usuário IDENTIFIED BY senha*<br><br>
- Instruções TC(Transaction Control)<br>
Registram permanentemente as alterações feitas nos dados ou, desfazem essas alterações.<br><br>
- Instruções DCL(Data Control Language)<br>
Utilizada para atribuir permissões para o usuário.<br>
Exemplo de Sintaxe: *GRANT connet, resource TO nome_usuário*<br>

**Tipos de Dados(Oracle)**<br>
char(comprimento), varchar2(comprimento), date, integer, number(precisão, escala), binary_float, binary_double)<br>

**Características de um Esquema Lógico**<br>
Por meio de um esquema lógico, analisar e compreender conexões entre tabelas<br>
![Logical Database Model](https://github.com/user-attachments/assets/eebe6401-06b6-4429-acbc-d4509633eaa8)

**Criação de objetos(tabelas)**<br>
A instrução *CREATE TABLE* é usada para criar uma nova tabela em um banco de dados.<br>
Dentro da função *CREATE TABLE*, Os parâmetros das colunas são definidos, juntamente com seus datatype que a coluna pode armazenar (por exemplo, varchar, integer, date, etc...).<br>
Para Garantir a integridade e a validade dos dados dentro do banco de dados, são utilizados *CONSTRAINT*, pois definem regras sobre os dados que serão armazenados em uma tabela.<br>

Exemplo de uma tabela com uma chave primária(Lembrando que o *NOT NULL*, também é uma *CONSTRAINT*):<br> 
<pre>
CREATE TABLE tb_tipos_produtos(
id_tipo_produto      INTEGER,
nm_tipo_produto      VARCHAR2(10) NOT NULL,
fg_ativo             INTEGER,
CONSTRAINT pk_tb_tipos_produtos_id_tipo_produto
    PRIMARY KEY(id_tipo_produto)
);
</pre>

Exemplo de uma tabela com uma chave primária e uma chave estrangeira:<br> 
<pre>
CREATE TABLE tb_produtos(
id_produto           INTEGER,
id_tipo_produto      INTEGER,
nm_produto           VARCHAR2(30) NOT NULL,
ds_produto           VARCHAR(50),
preco                NUMBER(5,2),
fg_ativo             INTEGER,
CONSTRAINT pk_tb_produtos_id_produto PRIMARY KEY(id_produto),
CONSTRAINT fk_tb_produtos_id_tipo_produto
    FOREIGN KEY(id_tipo_produto)
        REFERENCES tb_tipos_produtos(id_tipo_produto)
);
</pre>

Exemplo de uma tabla com uma chave primária composta por duas chaves estrangeiras:<br> 
<pre>
CREATE TABLE tb_compras(
id_produto        INTEGER,
id_cliente        INTEGER,
quantidade        INTEGER,
fg_ativo          INTEGER,
CONSTRAINT fk_tb_compras_id_produto FOREIGN KEY(id_produto)
      REFERENCES tb_produtos(id_produto),
CONSTRAINT fk_tb_compras_id_cliente FOREIGN KEY(id_cliente)
      REFERENCES tb_clientes(id_cliente),
CONSTRAINT pk_tb_compras_id_produto_id_cliente PRIMARY KEY(id_produto, id_cliente)
);
</pre>

**Inserção de linhas/tuplas**<br>
Durante a inserção de uma tupla, a ordem dos valores na lista *VALUES* corresponde à ordem na qual as colunas são especificadas na lista de colunas.<br> 

Exemplo de uma inserção em uma tabela:<br> 
<pre>
INSERT INTO tb_tipos_produtos(id_tipo_produto, nm_tipo_produto,fg_ativo)
    VALUES(1, 'Book', 1);
</pre>

**Alteração de linhas/tuplas**<br>
Em uma intrução *UPDATE*, é necessário especificar as linhas que serão alteradas e uma lista de nomes de colunas, junto com seus novos valores.<br>
❗NUNCA ESQUECER O *WHERE* EM UM UPDATE❗<br> 
Um *UPDATE* sem *WHERE* atualiza todas as linhas<br>

Exemplo de um *UPDATE*:<br>
<pre>
UPDATE tb_clientes
SET sobrenome = 'Orange'
WHERE id_cliente = 2;
</pre>

**PL/SQL**<br>
Linguagem procedural da Oracle.<br>
Permite adicionar programação em torno de instruções SQL.<br>
Usado principalmente para criação de procedures e functions em um BD.<br>

Exemplo de uma procedure que localizada e o ID do cliente e exibe uma mensagem:<br>
Utilza-se a intrução *CALL*, para invocar a procedure.<br>
<pre>
CREATE OR REPLACE PROCEDURE get_cliente(p_id_cliente IN tb_clientes.id_cliente%TYPE)
AS
v_nome          tb_clientes.nome%TYPE;
v_sobrenome     tb_clientes.sobrenome%TYPE;
v_controle      INTEGER;

BEGIN
 SELECT COUNT(*)INTO v_controle
  FROM tb_clientes
  WHERE id_cliente = p_id_cliente;
  
IF(v_controle = 1) THEN
    SELECT nome, sobrenome INTO v_nome, v_sobrenome
    FROM tb_clientes
    WHERE id_cliente = p_id_cliente;
    
    DBMS_OUTPUT.PUT_LINE('Cliente localizado: '||v_nome||' '||v_sobrenome);

ELSE
    DBMS_OUTPUT.PUT_LINE('Cliente NÃO localizado');
END IF;

EXCEPTION
 WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Erro');
  
END get_cliente;
</pre>

**Ordem de execução de uma Querie***<br>
![QueryExecutionOrder](https://github.com/user-attachments/assets/8c145952-8e94-43c7-b314-e554c62eb9cc)

**Identificadores de Linha**<br>
Cada linha de uma tabela no Oracle tem um identificador exclusivo denominado rowid.<br>
Para saber esse identificador basta:<br>
<pre>
SELECT ROWID, id_cliente
FROM tb_clientes;
</pre>

**Números de Linha**<br>
A instrução ROWNUM, é uma pseudocoluna que retorna o número da linha em um conjunto de resultados.<br>
Exemplo de uma aplicação:<br>
<pre>
SELECT ROWNUM, id_cliente, nome, sobrenome
FROM tb_clientes;
</pre>

**Cálculos Aritméticos**<br>
- (+) Adição<br>  
- (-) Subtração<br>
- (*) Multiplicação<br>
- (/) Divisão<br>

Exemplo onde a consulta utiliza o operador de multiplicação(*):<br>
<pre>
SELECT 2 * 6
FROM dual;
</pre>

Exemplo onde a consulta utiliza o operador de multiplicação(*), divisão(/) e subtração(-):<br>
Nota-se que a precedência de operador aritmético,  não se alteram na linguagem SQL.<br>
<pre>
SELECT 10 * 12 / 3 - 1
FROM dual;
</pre>

Exemplo com o parênteses para especificar a ordem de execução dos operadores:<br>
<pre>
SELECT 10 * (12 / 3 - 1)
FROM dual;
</pre>

Exemplo com operandos sendo colunas de uma tabela:<br>
<pre>
SELECT nm_produto, preco, preco + 2.00
FROM tb_produtos;
</pre>
**Aritmética de Data**<br>
<pre>
SELECT TO_DATE('11/DEZ/2024') + 6 AS "Dias no Github"
FROM dual;
</pre>

<pre>
SELECT TO_DATE('16/DEZ/2024') - TO_DATE('11/DEZ/2024) AS "Dias no Github"
FROM dual;
</pre>

**Tabela *Dual***<br>
A estrutura da tabela dual possui apenas uma única linha, que é do tipo Varchar2, nomeada de dummy e com valor X.<br>
Utilizamos a tabela dual, quando queremos executar expressões ou funções no Oracle SQL sem a necessidade de acessar ou manipular dados de uma tabela real.<br>

**Apelido(*Alias*)**<br>
<pre>
SELECT preco, preco * DOBRO_PREÇO
FROM tb_produtos;
</pre>

Nota-se que ao utilizar aspas duplas("), preserva-se a caixa de texto do apelido dado a coluna.<br>
<pre>
SELECT preco, preco * 2 "Dobro do Preço"
FROM tb_produtos;
</pre>

**Concatenação**<br>
Operador de concatenação(||).<br>

Exemplo do uso de concatenação:<br>
<pre>
SELECT nome || '' || sobrenome AS "Nome do Cliente"
FROM tb_clientes;
</pre>
O retorno da consulta será o nome, juntamente com o sobrenome, em uma coluna com o apelido de "Nome do Cliente".<br>

**Valores Nulos(*NULL*)**<br>
Um valor nulo é um valor único cujo significado do valor da coluna é desconhecido.<br>

Exemplo, onde verifica a existência de valores nulos(*IS NULL*):<br>
<pre>
SELECT id_cliente, nome, sobrenome, dt_nascimento
FROM tb_clientes
WHERE dt_nascimento IS NULL;
</pre>

- Uso da função *NVL*(*Null Value*)<br>
Retorna outro valor no lugar de um valor nulo.<br>
<pre>
SELECT id_cliente, nome, sobrenome,
    NVL(telefone, 'Número do telefone desconhecido') AS Número_Telefone
FROM tb_cliente;
</pre>

- Uso da função *NULLIF*<br>
Compara duas expressões, se elas forem equivalentes, a função retorna *NULL*. Caso elas sejam distintas, a função retorna a primeira função.<br>

Exemplo:<br>
<pre>
SELECT nome, LENGTH(nome) "expressão1",
       sobrenome, LENGTH(sobrenome) "expressão2",
       NULLIF(LENGTH(nome), LENGTH(sobrenome)) "resultado"
FROM tb_funcionarios;
</pre>

- Uso da função *COALESCE*<br>
Se a primeira expressão não for nula, a função COALESCE retorna essa expressão, caso contrário, ela realiza um COALESCE das expressões restantes.<br>

Exemplo:<br>
Nota-se que caso o ID_GERENTE não for nulo, o mesmo será exibido.<br>
Se o ID_GERENTE for nulo, PERCENTUAL_COMISSAO é exibido.<br>
Se ambos forem nulos, "Nenhuma comissão e nenhum gerente" será exibido.<br>
<pre>
SELECT sobrenome, id_empregado, percentual_comissao, id_gerente,
       COALESCE(TO_CHAR(percentual_comissao),
                TO_CHAR(id_gerente),
                'Nenhuma comissão e nenhum gerente')
FROM tb_empregado;
</pre>

**Linhas Distintas(*Distinct*)**<br>
Suprime as linhas duplicadas.<br>
<pre>
SELECT DISTINCT id_cliente
FROM tb_compras;
</pre>

**Comparação de Valores**<br>
- (=) Igual<br>
- (<> ou !=) Diferente<br>
- (<) Menor que<br>
- (>) Maior que<br>
- (<=) Menor ou igual<br>
- (>=) Maior ou igual<br>
- (*ANY*) Compara um valor com qualquer valor em uma lista<br>
- (*SOME*) Idêntico ao ANY<br>
- (*ALL*) Compara um valor com todos os valores em uma lista<br>

*ANY*, *SOME* e *ALL* possui o pré-requisito de inserir um operador =, <>, <, <= ou >= antes

**Operadores SQL**<br>
- (*LIKE*) Corresponde a padrão em strings<br>
Uso do operador *LIKE* em uma clásula *WHERE* para procurar um padrão em uma *STRING*
O Sublinhado(_) corresponde a um caractere em uma posição específica e a porcentagem(%) a qualquer número de caracteres a partir de uma determinada posição

Exemplo que procure um cliente que tenha i como segunda letra no nome, tenha qualquer quantidade caracteres e termine com S:<br>
<pre>
SELECT *
FROM tb_clientes
WHERE nome LIKE '_i%S'
</pre>

- (*IN*) Corresponde a lista de valores<br>
<pre>
SELECT *
FROM tb_clientes
WHERE id_cliente IN (2, 3, 5);
</pre>

- (*BETWEEN*) Corresponde a um intervalo de valores<br>
SELECT *
FROM tb_clientes
WHERE id_cliente BETWEEN 1 AND 3;
</pre>

- (*IS NULL*) Corresponde a valores nulos<br>

- (*IS NAN*) Corresponde a um valor especial *NAN*(*Not a number*)<br>

- (*IS INFINITE*) corresponde a valores *BINARY_FLOAT* e *BINARY_DOUBLE* infinitos)<br>

Possibilidade de utilizar *NOT* para inverter o significado de um operador.<br>

**Cláusula ORDER BY**<br>

**JOINs**<br>

**Variáveis**<br>

**Relatórios Simples**<br>

**Funções Simples**<br>
- Funções de Caracteres<br><br>
- Funções Numéricas<br><br>
- Funções de Conversão<br><br>
- Funções de Expressão Regular<br>

**Funções Agregadas**<br>

**GROUP BY**<br>

**Manipulação de Datas e Horas**

###

[*Acesse a disciplina clicando aqui*](https://github.com/ViniciusHenriqueOliveira/Coding-In-SQL/tree/main/Laborat%C3%B3rio-de-Banco-de-Dados)
