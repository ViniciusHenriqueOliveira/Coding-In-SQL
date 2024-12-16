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
- Instruções de consultas:<br>
Recuperam linhas armazenadas nas tabelas.<br>
Comando *SELECT*<br><br>
- Instruções DML(Data Manipulation Language)<br>
Modificam o conteúdo das tabelas.<br><br>
- Instruções DDL(Data Definition Language):<br>
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

Exemplo de um *UPDATE*:
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

**Números de Linha**<br>

**Cálculos Aritméticos**<br>

**Tabela *Dual***<br>

**Apelido(*Alias*)**<br>

**Concatenação**<br>

**Valores Nulos(*NULL*)**<br>

**Linhas Distintas(*Distinct*)**<br>

**Comparação de Valores**<br>

**Operadores SQL**<br>

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
