CREATE TABLE tb_clientes(
id_cliente      INTEGER,
nome            VARCHAR2(10)NOT NULL,
sobrenome       VARCHAR2(10)NOT NULL,
dt_nascimento   DATE,
telefone        VARCHAR2(12),
fg_ativo        INTEGER,

CONSTRAINT pk_tb_clientes_id_cliente PRIMARY KEY(id_cliente)
);

SELECT *
FROM tb_clientes;

DESCRIBE tb_clientes;

CREATE TABLE tb_tipos_produtos(
id_tipo_produto        INTEGER,
nm_tipo_produto        VARCHAR2(10)NOT NULL,
fg_ativo               INTEGER,
CONSTRAINT pk_tb_tipos_produtos_id_tipo_produto PRIMARY KEY(id_tipo_produto)
);

CREATE TABLE tb_produtos(
id_produto          INTEGER,
id_tipo_produto     INTEGER,
nm_produto          VARCHAR2(30)NOT NULL,
ds_produto          VARCHAR2(50),
preco               NUMBER(5,2),
fg_ativo            INTEGER,
CONSTRAINT pk_tb_produtos_id_produto PRIMARY KEY(id_produto),
CONSTRAINT fk_tb_produtos_id_tipo_produto 
    FOREIGN KEY (id_tipo_produto) REFERENCES tb_tipos_produtos(id_tipo_produto)
);

CREATE TABLE tb_compras(
id_produto      INTEGER,
id_cliente      INTEGER,
quantidade      INTEGER,
fg_ativo        INTEGER,
CONSTRAINT fk_tb_compras_id_produto FOREIGN KEY(id_produto)
        REFERENCES tb_produtos(id_produto),
CONSTRAINT fk_tb_compras_id_cliente FOREIGN KEY(id_cliente)
        REFERENCES tb_clientes(id_cliente),
CONSTRAINT pk_tb_compras_id_cliente_id_cliente PRIMARY KEY(id_produto,id_cliente)
);

CREATE TABLE tb_funcionarios(
id_funcionario          INTEGER,
id_gerente              INTEGER,
nome                    VARCHAR2(10)NOT NULL,
sobrenome               VARCHAR2(10)NOT NULL,
cargo                   VARCHAR2(20),
salario                 NUMBER(8,2),
fg_ativo                INTEGER,
CONSTRAINT pk_tb_funcionarios_id_funcionario PRIMARY KEY(id_funcionario),
CONSTRAINT fk_tb_funcionarios_id_gerente FOREIGN KEY(id_gerente)
        REFERENCES tb_funcionarios(id_funcionario)
);

CREATE TABLE tb_grades_salarios(
id_salario      INTEGER,
base_salario    NUMBER(8,2),
teto_salario    NUMBER(8,2),
fg_ativo        INTEGER,
CONSTRAINT pk_tb_grades_salarios_id_salario PRIMARY KEY(id_salario)
);

INSERT INTO tb_clientes(id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
    VALUES(1,'John','Brown','01/Jan/1965','800-55-1211',1);

INSERT INTO tb_clientes(id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
    VALUES(2,'Cynthia','Green','05/Fev/1968','800-555-1212',1);
    
INSERT INTO tb_clientes
    VALUES(3,'Steve','White','16/Mar/1971','800-555-1213',1);
    
COMMIT;

SELECT *
FROM tb_clientes; ------Primeira aula

INSERT INTO tb_clientes(id_cliente,nome,sobrenome,dt_nascimento,telefone,fg_ativo)
    VALUES(4,'Gail','Black','','800-555-1214',1);
    
INSERT INTO tb_clientes(id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
    VALUES(5,'Doreen','Blue','20/Mai/1970',NULL,1);
    
INSERT INTO tb_clientes(id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
    VALUES(6,'Fred','Brown','01/Jan/1970','800-555-1215',1);
    
COMMIT;

SELECT *
FROM tb_clientes
ORDER BY nome;


DESCRIBE tb_tipos_produtos;

INSERT INTO tb_tipos_produtos(id_tipo_produto, nm_tipo_produto, fg_ativo)
    VALUES(1,'Book',1);

INSERT INTO tb_tipos_produtos(id_tipo_produto, nm_tipo_produto, fg_ativo)
    VALUES(2,'Video',1);
    
INSERT INTO tb_tipos_produtos(id_tipo_produto, nm_tipo_produto, fg_ativo)
    VALUES(3,'DVD',1);
    
INSERT INTO tb_tipos_produtos(id_tipo_produto, nm_tipo_produto, fg_ativo)
    VALUES(4,'CD',1);
    
INSERT INTO tb_tipos_produtos(id_tipo_produto, nm_tipo_produto, fg_ativo)
    VALUES(5,'Magazine',1);
    
COMMIT;

SELECT *
FROM tb_tipos_produtos


DESCRIBE tb_produtos;

INSERT INTO tb_produtos(id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo)
    VALUES(1,1,'Modern Science','A description of modern science',19.95,1);
    
INSERT INTO tb_produtos(id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo)
    VALUES(2,1,'Chemistry','Introduction to Chemistry',30,1);
    
INSERT INTO tb_produtos(id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo)
    VALUES(3,2,'Supernova','A star explodes',25.99,1);
    
INSERT INTO tb_produtos(id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo)
    VALUES(4,2,'Tank War','Action movie about a future war',13.95,1);
    
COMMIT;

SELECT *
FROM tb_produtos


DESCRIBE tb_compras;

INSERT INTO tb_compras(id_cliente, id_produto, quantidade, fg_ativo)
    VALUES(1,1,1,1);
    
INSERT INTO tb_compras(id_cliente, id_produto, quantidade, fg_ativo)
    VALUES(2,1,3,1);
    
INSERT INTO tb_compras(id_cliente, id_produto, quantidade, fg_ativo)
    VALUES(1,4,1,1);
    
INSERT INTO tb_compras(id_cliente, id_produto, quantidade, fg_ativo)
    VALUES(2,2,1,1);
    
INSERT INTO tb_compras(id_cliente, id_produto, quantidade, fg_ativo)
    VALUES(1,3,1,1);
    
COMMIT;

SELECT *
FROM tb_compras


DESCRIBE tb_funcionarios;

INSERT INTO tb_funcionarios(id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)
    VALUES(1,NULL,'James','Smith','CEO',8000.00,1);
    
INSERT INTO tb_funcionarios(id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)
    VALUES(2,1,'Ron','Johnson','Sales Manager',6000.00,1);
    
INSERT INTO tb_funcionarios(id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)
    VALUES(3,2,'Fred','Hobbs','Salesperson',1500.00,1);
    
INSERT INTO tb_funcionarios(id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)
    VALUES(4,2,'Susan','Jones','Salesperson',5000.00,1);
    
COMMIT; --- Segunda aula

INSERT INTO tb_grades_salarios(id_salario, base_salario, teto_salario, fg_ativo)
    VALUES(1,1,2500.00,1);
    
INSERT INTO tb_grades_salarios(id_salario, base_salario, teto_salario, fg_ativo)
    VALUES(2,2500.01,5000.00,1);
    
INSERT INTO tb_grades_salarios(id_salario, base_salario, teto_salario, fg_ativo)
    VALUES(3,5000.01,7500.00,1);
    
INSERT INTO tb_grades_salarios(id_salario, base_salario, teto_salario, fg_ativo)
    VALUES(4,7500.01,9999.99,1);
    
COMMIT;

UPDATE tb_clientes
SET sobrenome = 'Orange'
WHERE id_cliente = 2;

SELECT *
FROM tb_clientes;

ROLLBACK;

DELETE FROM tb_clientes
WHERE id_cliente = 2;
--ORA-02292: restrição de integridade (LOJA.FK_TB_COMPRAS_ID_CLIENTE) violada - registro filho localizado

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

-- Invocando o objeto "get_cliente" via Saída DBMS
-- MENU: Exibir > Saída DBMS

--Invocando o objeto "get_cliente" passando como parâmetro um ID de cliente válido
CALL get_cliente(1);

--Invocando o objeto "get_cliente" passando como parâmetro um ID do cliente inválido
CALL get_cliente(99);

--Invocando o objeto "get_cliente" via bloco anônimo
SET serveroutput ON
BEGIN
    get_cliente(2);
END;

SET serveroutput ON
BEGIN
    get_cliente(90);
END;

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo) 
VALUES (5, 2, 'Rob', 'Green', 'Sales Person', 400000, 1);

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo) 
VALUES (6, 4, 'Jane', 'Brown', 'Support Person', 450000, 1);

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo) 
VALUES (7, 4, 'John', 'Grey', 'Support Manager', 300000, 1);

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo) 
VALUES (8, 7, 'Jean', 'Blue', 'Support Person', 290000, 1);

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)  
VALUES (9, 6, 'Henry', 'Heyson', 'Support Person', 300000, 1);

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)  
VALUES (10, 1, 'Kevin', 'Black', 'Ops Manager', 100000, 1);

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)  
VALUES (11, 10, 'Keith', 'Long', 'Ops Person', 500000, 1);

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)  
VALUES (12, 10, 'Frank', 'Howard', 'Ops Person', 450000, 1);

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)  
VALUES (13, 10, 'Doreen', 'Penn', 'Ops Person', 470000, 1);

-- commit the transaction
COMMIT;

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo) 
VALUES (6, 2, 'Z Files', 'Series on mysterious activities', 49.99, 1);

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo) 
VALUES (7, 2, '2412: The Return', 'Aliens return', 14.95, 1);

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo)
VALUES (8, 3, 'Space Force 9', 'Adventures of heroes', 13.49, 1);

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo) 
VALUES (9, 3, 'From Another Planet', 'Alien from another planet lands on Earth', 12.99, 1);

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo)
VALUES (10, 4, 'Classical Music', 'The best classical music', 10.99, 1);

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo) 
VALUES (11, 4, 'Pop 3', 'The best popular music', 15.99, 1);

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo) 
VALUES (12, 4, 'Creative Yell', 'Debut album', 14.99, 1);

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo) 
VALUES (13, NULL, 'My Front Line', 'Their greatest hits', 13.49, 1);

-- commit the transaction
COMMIT;

CREATE TABLE tb_promocao (
  id_promocao        INTEGER CONSTRAINT pk_promocao PRIMARY KEY,
  nome               VARCHAR2(30) NOT NULL,
  duracao            INTERVAL DAY(3) TO SECOND (4)
);

INSERT INTO tb_promocao (id_promocao, nome, duracao)
VALUES 
(1, '10% off Z Files', INTERVAL '3' DAY);
INSERT INTO tb_promocao (id_promocao, nome, duracao)
VALUES 
(2, '20% off Pop 3', INTERVAL '2' HOUR);
INSERT INTO tb_promocao (id_promocao, nome, duracao)
VALUES 
(3, '30% off Modern Science', INTERVAL '25' MINUTE);
INSERT INTO tb_promocao (id_promocao, nome, duracao)
VALUES 
(4, '20% off Tank War', INTERVAL '45' SECOND);
INSERT INTO tb_promocao (id_promocao, nome, duracao)
VALUES 
(5, '10% off Chemistry', INTERVAL '3 2:25' DAY TO MINUTE);
INSERT INTO tb_promocao (id_promocao, nome, duracao)
VALUES 
(6, '20% off Creative Yell', INTERVAL '3 2:25:45' DAY TO SECOND);
INSERT INTO tb_promocao (id_promocao, nome, duracao)
VALUES 
(7, '15% off My Front Line', INTERVAL '123 2:25:45.12' DAY(3) TO SECOND(2));
COMMIT;

Select *
FROM tb_produtos
