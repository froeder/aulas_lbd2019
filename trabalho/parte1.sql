CREATE TABLE pessoa(
    id SERIAL PRIMARY KEY ,
    cpf INTEGER NOT NULL ,
    nome VARCHAR(255) NOT NULL ,
    email VARCHAR(255) NOT NULL, 
    sexo VARCHAR(1) NOT NULL
    estado_civil VARCHAR(20) NOT NULL,
    profissao VARCHAR(255) NOT NULL,
    CHECK (sexo IN('M', 'F'))
) ;

CREATE TABLE telefone(
    id SERIAL PRIMARY KEY,
    id_cliente INTEGER NOT NULL, 
    telefone INTEGER NOT NULL, 
    telefone_tipo INTEGER NOT NULL
);

CREATE TABLE fiador(
    id SERIAL PRIMARY KEY, 
    id_pessoa INTEGER NOT NULL,
    CONSTRAINT fk_pessoa FOREIGN KEY (id_pessoa) REFERENCES pessoa(id)

);

CREATE TABLE indicacao(
    id SERIAL PRIMARY KEY,
    id_pessoa INTEGER NOT NULL,
    CONSTRAINT fk_pessoa FOREIGN KEY (id_pessoa) REFERENCES pessoa(id)
);

CREATE TABLE cliente_usuario(
    id SERIAL PRIMARY KEY,
    id_fiador INTEGER NOT NULL, 
    id_indicacao INTEGER NOT NULL,
    id_telefone INTEGER NOT NULL, 
    CONSTRAINT fk_id_fiador FOREIGN KEY (id_fiador) REFERENCES fiador (id),
    CONSTRAINT fk_id_indicacao FOREIGN KEY (id_indicacao) REFERENCES indicacao (id),
    CONSTRAINT fk_id_indicacao FOREIGN KEY (id_indicacao) REFERENCES indicacao (id)
);
           
ALTER TABLE telefone ADD CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES cliente_usuario (id) ;

CREATE TABLE cliente_proprietario(
    id SERIAL PRIMARY KEY,
    id_pessoa INTEGER,
    CONSTRAINT fk_pessoa FOREIGN KEY (idpessoa) REFERENCES pessoa(id)
);

CREATE TABLE cargo(
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL, 
    salario_base DECIMAL(10,2) NOT NULL
);

CREATE TABLE cliente_funcionario(
    id SERIAL PRIMARY KEY,
    id_cargo INTEGER,
    id_pessoa INTEGER,
    data_ingresso DATE NOT NULL, 
    salario DECIMAL(10,2) NOT NULL, 
    login VARCHAR(255) NOT NULL, 
    senha VARCHAR(128) NOT NULL,
    CONSTRAINT fk_pessoa FOREIGN KEY (id_pessoa) REFERENCES pessoa(id),
    CONSTRAINT fk_cargo FOREIGN KEY (id_cargo) REFERENCES cargo(id)
);

CREATE TABLE comissao(
    id SERIAL PRIMARY KEY,
    id_funcionario INTEGER NOT NULL, 
    id_transacao INTEGER NOT NULL,
    mes VARCHAR(15) NOT NULL, 
    valor DECIMAL(10,2) NOT NULL, 
    CONSTRAINT fk_funcionario FOREIGN KEY (id_funcionario) REFERENCES cliente_funcionario(id),
    CONSTRAINT fk_transacao FOREIGN KEY (id_transacao) REFERENCES transacao(id)
);

CREATE TABLE aluguel(
    id SERIAL PRIMARY KEY,
    id_transacao INTEGER NOT NULL,
    id_forma_pagamento INTEGER NOT NULL,
);

CREATE TABLE compra(
    id SERIAL PRIMARY KEY,
    id_transacao INTEGER NOT NULL,
    id_forma_pagamento INTEGER NOT NULL
);

CREATE TABLE transacao(
    id SERIAL PRIMARY KEY,
    id_imovel INTEGER NOT NULL,
    id_cliente_usuario INTEGER NOT NULL,
    id_cliente_funcionario INTEGER NOT NULL, 
    data DATE NOT NULL, 
    comissao DECIMAL(10,2) NOT NULL,
    numero_contrato INTEGER NOT NULL,
    CONSTRAINT fk_imovel FOREIGN KEY (id_imovel) REFERENCES imovel(id),
    CONSTRAINT fk_cliente_usuario FOREIGN KEY (id_cliente_usuario) REFERENCES cliente_usuario(id),
    CONSTRAINT fk_cliente_funcionario FOREIGN KEY (id_cliente_funcionario) REFERENCES cliente_funcionario(id)

);



CREATE TABLE endereco
(
    id SERIAL PRIMARY KEY,
    rua VARCHAR(255) NOT NULL,
    numero INTEGER,
    bairro VARCHAR (255) NOT NULL,
    cidade VARCHAR (255) NOT NULL,
    estado VARCHAR (255) NOT NULL,
    cep VARCHAR (255) NOT NULL,
    complemento VARCHAR (255) NOT NULL
);

CREATE TABLE imovel
(
    id SERIAL PRIMARY KEY,
    id_endereco INTEGER NOT NULL,
    id_cliente_proprietario INTEGER NOT NULL,
    disponivel BOOLEAN,
    disponivel_tipo VARCHAR(20),
    valor_sugerido DECIMAL(10,2) NOT NULL,
    valor_real DECIMAL(10,2) NOT NULL,
    valor_repasse_imobiliaria DECIMAL(10,2),
    descricao VARCHAR(255) ,
    area DECIMAL(10,2) NOT NULL,
    CHECK (disponivel_tipo IN ("Aluguel", "Compra", "Indisponivel")),
    CONSTRAINT fk_cliente_proprietario FOREIGN KEY (id_cliente_proprietario) REFERENCES cliente_proprietario (id)
);

CREATE TABLE fotos
(
    id_imovel INTEGER NOT NULL,
    caminho VARCHAR(255) NOT NULL,
    CONSTRAINT fk_id_imovel FOREIGN KEY (id_movel) REFERENCES imovel(id)
);

CREATE TABLE quartos
(
    id SERIAL PRIMARY KEY,
    qtde_quartos INTEGER NOT NULL,
    qtde_suites INTEGER NOT NULL,
    qtde_sala_estar INTEGER NOT NULL,
    qtde_sala_jantar INTEGER NOT NULL,
    numero_vagas_garagem INTEGER NOT NULL,
    armario_embutido BOOLEAN NOT NULL
);

CREATE TABLE imovel_casa
(
    id SERIAL PRIMARY KEY,
    id_imovel PRIMARY_KEY,
    id_quartos INTEGER NOT NULL,
    data_construção DATA NOT NULL,
    CONSTRAINT fk_quartos FOREIGN KEY (id_quartos) REFERENCES quartos (id),
    CONSTRAINT fk_imovel FOREIGN KEY (id_imovel) REFERENCES imovel(id)
);

CREATE TABLE imovel_apartamento
(
    id SERIAL PRIMARY KEY,
    id_quartos INTEGER NOT NULL ,
    id_imovel INTEGER,
    data_construção DATA NOT NULL,
    andar INTEGER NOT NULL,
    valor_condominio DECIMAL (10,2) NOT NULL,
    possui_porteiro BOOLEAN,
    CONSTRAINT fk_quartos FOREIGN KEY (id_quartos) REFERENCES quartos (id),
    CONSTRAINT fk_imovel FOREIGN KEY (id_imovel) REFERENCES imovel(id)
);

CREATE TABLE imovel_terreno
(
    id SERIAL PRIMARY KEY,
    id_imovel INTEGER,
    largura DECIMAL(10,2) NOT NULL,
    comprimento DECIMAL(10,2) NOT NULL,
    topologia VARCHAR(255) NOT NULL,
    CHECK (topologia IN ('Aclive', 'Declive', 'Nenhuma')),
    CONSTRAINT fk_imovel FOREIGN KEY (id_imovel) REFERENCES imovel(id)
);

CREATE TABLE imovel_comercial
(
    id SERIAL PRIMARY KEY,
    id_imovel INTEGER,
    data_construção DATA NOT NULL,
    qtde_banheiro INTEGER NOT NULL,
    qtde_quartos INTEGER NOT NULL,
    CONSTRAINT fk_imovel FOREIGN KEY (id_imovel) REFERENCES imovel(id)
);



funçao para pegar idade do inquilino, se for muito velho nao permitir

funcao saber quantos transacoes fez cada funcionario

quanto custa hora media de cada funcionario