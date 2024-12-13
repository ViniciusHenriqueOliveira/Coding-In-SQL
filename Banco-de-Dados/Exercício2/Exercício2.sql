CREATE TABLE tb_cliente (
    cpf VARCHAR2(14),
    email VARCHAR2(50),
    endereco VARCHAR2(100),
    telefone VARCHAR2(13),
    nome VARCHAR2(60),
    CONSTRAINT pk_tb_cliente_cpf PRIMARY KEY (cpf)
);

CREATE TABLE tb_pedido (
    codigo NUMBER,
    valor NUMBER,
    quantidade_produto NUMBER,
    data_entrega DATE,
    cpf_cliente VARCHAR2(14),
    CONSTRAINT pk_tb_pedido_codigo PRIMARY KEY(codigo),
    CONSTRAINT fk_tb_pedido_cpf_cliente FOREIGN KEY(cpf_cliente) 
    	REFERENCES tb_cliente(cpf)
);

CREATE TABLE tb_produto (
    codigo NUMBER,
    nome VARCHAR2(60),
    valor_unit NUMBER,
    codigo_pedido NUMBER,
    CONSTRAINT pk_tb_produto_codigo PRIMARY KEY(codigo),
    CONSTRAINT fk_tb_produto_codigo_pedido FOREIGN KEY(codigo_pedido)
    	REFERENCES tb_pedido(codigo)
);

CREATE TABLE tb_estoque (
    descricao VARCHAR2(100),
    quantidade_existente NUMBER,
    unidade_medida VARCHAR2(2),
    quantidade_minima NUMBER,
    codigo_produto NUMBER,
    CONSTRAINT pk_tb_estoque_descricao PRIMARY KEY(descricao),
    CONSTRAINT fk_tb_estoque_codigo_produto FOREIGN KEY(codigo_produto)
    	REFERENCES tb_produto(codigo)
);

CREATE TABLE tb_balconista (
    cpf VARCHAR2(14),
    nome VARCHAR2(60),
    salario NUMBER,
    telefone VARCHAR2(13),
    codigo_pedido NUMBER,
    descricao_estoque VARCHAR2(100),
    CONSTRAINT pk_tb_balconista_cpf PRIMARY KEY(cpf),
    CONSTRAINT fk_tb_balconista_codigo_pedido FOREIGN KEY(codigo_pedido)
    	REFERENCES tb_pedido(codigo),
    CONSTRAINT fk_tb_balconista_descricao_estoque FOREIGN KEY(descricao_estoque)
    	REFERENCES tb_estoque
);

CREATE TABLE tb_fornecedor (
    cnpj VARCHAR2(14),
    nome VARCHAR2(60),
    telefone VARCHAR2(13),
    codigo_produto NUMBER,
    CONSTRAINT pk_tb_fornecedor_cnpj PRIMARY KEY(cnpj),
    CONSTRAINT fk_tb_fornecedor_codigo_produto FOREIGN KEY(codigo_produto)
    	REFERENCES tb_produto
);

CREATE TABLE tb_setor (
    codigo NUMBER,
    cnpj_fornecedor VARCHAR2(14),
    codigo_produto NUMBER,
    CONSTRAINT pk_tb_setor_codigo PRIMARY KEY(codigo),
    CONSTRAINT fk_tb_setor_cnpj_fornecedor FOREIGN KEY(cnpj_fornecedor)
    	REFERENCES tb_fornecedor,
    CONSTRAINT fk_tb_setor_codigo_produto FOREIGN KEY(codigo_produto)
    	REFERENCES tb_produto
);

CREATE TABLE tb_solitacao (
    numero_solitacao NUMBER,
    situação_solitacao VARCHAR2(9),
    quantidade_produto NUMBER,
    cnpj_fornecedor VARCHAR2(14),
    codigo_produto NUMBER,
    codigo_setor NUMBER,
    CONSTRAINT pk_tb_solitacao_numero_solitacao PRIMARY KEY(numero_solitacao),
    CONSTRAINT fk_tb_solitacao_cnpj_fornecedor FOREIGN KEY(cnpj_fornecedor)
    	REFERENCES tb_fornecedor,
    CONSTRAINT fk_tb_solitacao_codigo_produto FOREIGN KEY(codigo_produto)
    	REFERENCES tb_produto,
    CONSTRAINT fk_tb_solitacao_codigo_setor FOREIGN KEY(codigo_setor)
    	REFERENCES tb_setor
);

