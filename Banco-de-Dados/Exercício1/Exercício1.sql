CREATE TABLE tb_especialidades (
    codigo INTEGER,
    nome VARCHAR2(25),
    CONSTRAINT pk_codigo_especialidades PRIMARY KEY(codigo)
);

CREATE TABLE tb_medicos (
    crm VARCHAR2(12),
    cod_especialidade INTEGER,
    nome VARCHAR2(50),
    salario NUMBER,
    CONSTRAINT pk_crm_cod_esp_medicos PRIMARY KEY(crm, cod_especialidade),
    CONSTRAINT fk_cod_esp_medicos FOREIGN KEY(cod_especialidade) REFERENCES tb_especialidades(codigo)
);

CREATE TABLE tb_formacoes (
    cod_espformacao INTEGER,
    crm VARCHAR2(12),
    cod_especialidade INTEGER,
    CONSTRAINT pk_cod_espform_crm_cod_esp_formacoes 
    	PRIMARY KEY(cod_espformacao, crm, cod_especialidade),
    CONSTRAINT fk_cod_espform_formacoes FOREIGN KEY(cod_espformacao) 
    	REFERENCES tb_especialidades(codigo),
    CONSTRAINT fk_crm_cod_esp_especilidades FOREIGN KEY(crm, cod_especialidade)
    	REFERENCES tb_medicos(crm, cod_especialidade)
);

CREATE TABLE tb_pacientes (
    cpf VARCHAR2(11),
	crm VARCHAR2(12),
    cod_especialidade INTEGER,
    horario_visita DATE,
    nome VARCHAR2(50),
    rg VARCHAR2(13),
    endereco VARCHAR2(70),
    telefones VARCHAR2(150),
    data_nascimento DATE,
    CONSTRAINT pk_cpf_pacientes PRIMARY KEY(cpf),
    CONSTRAINT fk_crm_cod_esp_pacientes FOREIGN KEY(crm, cod_especialidade)
    	REFERENCES tb_medicos(crm, cod_especialidade)
);

CREATE TABLE tb_tratamentos (
    cpf VARCHAR2(11),
	crm VARCHAR2(12),
    cod_especialidade INTEGER,
	CONSTRAINT pk_cpf_crm_cod_esp_tratamentos PRIMARY KEY(cpf, crm, cod_especialidade),
    CONSTRAINT fk_crm_cod_esp FOREIGN KEY(crm, cod_especialidade)
    	REFERENCES tb_medicos(crm, cod_especialidade),
    CONSTRAINT fk_cpf_tratamentos FOREIGN KEY(cpf) 
    	REFERENCES tb_pacientes(cpf)
);

CREATE TABLE tb_quartos (
    andar INTEGER,
    numero INTEGER,
    cpf VARCHAR2(11),
    CONSTRAINT pk_andar_numero_quartos PRIMARY KEY(andar, numero),
    CONSTRAINT fk_cpf_quartos FOREIGN KEY(cpf)
    	REFERENCES tb_pacientes(cpf)
);
