INSERT INTO tb_especialidades (codigo, nome) VALUES (100, 'Cardiologia');
INSERT INTO tb_especialidades (codigo, nome) VALUES (101, 'Pediatria');
INSERT INTO tb_especialidades (codigo, nome) VALUES (102, 'Neurologia');
INSERT INTO tb_especialidades (codigo, nome) VALUES (103, 'Oncologia');

SELECT * FROM tb_especialidades WHERE nome LIKE '%logia';

INSERT INTO tb_medicos (crm, cod_especialidade, nome, salario) 
	VALUES ('12345', 103, 'João da Silva', 12000);
INSERT INTO tb_medicos (crm, cod_especialidade, nome, salario) 
	VALUES ('12567', 103, 'José da Silva', 10000);
INSERT INTO tb_medicos VALUES (4353, 101, 'Antonio Pereira', 15400);


SELECT * FROM tb_medicos WHERE nome LIKE 'J%é%';


INSERT INTO tb_formacoes VALUES (101, '12345', 103);


INSERT INTO tb_pacientes (cpf, nome, rg, endereco, telefones)
	VALUES ('22233344455', 'Mauro Oliveira', '33234454', 'Rua das Flores, 100', '(16) 333-4455');


UPDATE tb_pacientes SET rg = 112233 WHERE cpf = 22233344455;
UPDATE tb_pacientes SET data_nascimento = TO_DATE('04/MAY/1979') WHERE cpf = 22233344455;
SELECT * FROM tb_pacientes;

UPDATE tb_medicos SET salario = 22000 WHERE crm = '12567' AND cod_especialidade = 103;
UPDATE tb_medicos SET salario = 100 WHERE crm = '12345';
UPDATE tb_medicos SET salario = 2 WHERE cod_especialidade = 103;
UPDATE tb_medicos SET salario =  NULL;
SELECT * FROM tb_medicos;
