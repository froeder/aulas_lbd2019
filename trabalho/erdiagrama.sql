CREATE TABLE pessoa (
 cpf CHAR(10) NOT NULL,
 nome CHAR(10),
 email CHAR(10),
 estado_civil CHAR(10),
 sexo CHAR(10),
 profissao CHAR(10)
);

ALTER TABLE pessoa ADD CONSTRAINT PK_pessoa PRIMARY KEY (cpf);


CREATE TABLE cliente_funcionario (
 cpf CHAR(10) NOT NULL
);

ALTER TABLE cliente_funcionario ADD CONSTRAINT PK_cliente_funcionario PRIMARY KEY (cpf);


CREATE TABLE cliente_proprietario (
 cpf CHAR(10) NOT NULL
);

ALTER TABLE cliente_proprietario ADD CONSTRAINT PK_cliente_proprietario PRIMARY KEY (cpf);


CREATE TABLE cliente_usuario (
 fk_cpf_cliente CHAR(10) NOT NULL
);

ALTER TABLE cliente_usuario ADD CONSTRAINT PK_cliente_usuario PRIMARY KEY (fk_cpf_cliente);


CREATE TABLE fiado (
 cpf CHAR(10) NOT NULL,
 fk_cpf_cliente_0 CHAR(10)
);

ALTER TABLE fiado ADD CONSTRAINT PK_fiado PRIMARY KEY (cpf);


CREATE TABLE indicacao (
 cpf CHAR(10),
 fk_cpf_cliente_0 CHAR(10)
);


ALTER TABLE cliente_funcionario ADD CONSTRAINT FK_cliente_funcionario_0 FOREIGN KEY (cpf) REFERENCES pessoa (cpf);


ALTER TABLE cliente_proprietario ADD CONSTRAINT FK_cliente_proprietario_0 FOREIGN KEY (cpf) REFERENCES pessoa (cpf);


ALTER TABLE cliente_usuario ADD CONSTRAINT FK_cliente_usuario_0 FOREIGN KEY (fk_cpf_cliente) REFERENCES pessoa (cpf);


ALTER TABLE fiado ADD CONSTRAINT FK_fiado_0 FOREIGN KEY (cpf) REFERENCES cliente_usuario (fk_cpf_cliente);
ALTER TABLE fiado ADD CONSTRAINT FK_fiado_1 FOREIGN KEY (cpf) REFERENCES pessoa (cpf);
ALTER TABLE fiado ADD CONSTRAINT FK_fiado_2 FOREIGN KEY (fk_cpf_cliente_0) REFERENCES cliente_usuario (fk_cpf_cliente);


ALTER TABLE indicacao ADD CONSTRAINT FK_indicacao_0 FOREIGN KEY (cpf) REFERENCES pessoa (cpf);
ALTER TABLE indicacao ADD CONSTRAINT FK_indicacao_1 FOREIGN KEY (cpf) REFERENCES cliente_usuario (fk_cpf_cliente);
ALTER TABLE indicacao ADD CONSTRAINT FK_indicacao_2 FOREIGN KEY (fk_cpf_cliente_0) REFERENCES cliente_usuario (fk_cpf_cliente);


