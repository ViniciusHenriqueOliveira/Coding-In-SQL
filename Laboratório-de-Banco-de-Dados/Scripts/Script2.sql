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
    
COMMIT;
