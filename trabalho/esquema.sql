<<<<<<< HEAD
CREATE TABLE endereco(
    id SERIAL PRIMARY KEY, 
    rua VARCHAR(255) NOT NULL,
    numero VARCHAR(10) NOT NULL,   
    bairro VARCHAR(10) NOT NULL, 
    cidade VARCHAR(10) NOT NULL, 
    estado VARCHAR(10) NOT NULL, 
    cep INTEGER NOT NULL, 
    complemento VARCHAR(128) NOT NULL
);

CREATE TABLE pessoa(
    cpf INTEGER PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    sexo VARCHAR(1) NOT NULL,
    estado_civil VARCHAR(15) NOT NULL,
    profissao VARCHAR(100) NOT NULL,
    CHECK (sexo IN('M', 'F'))
);

CREATE TABLE cargo(
    id SERIAL PRIMARY KEY, 
    descricao VARCHAR(255) NOT NULL, 
    salario_base NUMERIC(20,2) NOT NULL
);

CREATE TABLE cliente_funcionario(
    id INTEGER PRIMARY KEY,
    id_cargo INTEGER NOT NULL,
    login VARCHAR(255) NOT NULL,
    senha VARCHAR(128) NOT NULL,
    data_ingresso_imobiliaria DATE NOT NULL,
    CONSTRAINT fk_cpf FOREIGN KEY (id) REFERENCES pessoa (cpf),
    CONSTRAINT fk_cargo FOREIGN KEY (id_cargo) REFERENCES cargo (id)
);

CREATE TABLE cliente_proprietario(
    id INTEGER PRIMARY KEY,
    CONSTRAINT fk_cpf FOREIGN KEY (id) REFERENCES pessoa (cpf)
);

CREATE TABLE cliente_usuario(
    id INTEGER PRIMARY KEY,
    CONSTRAINT fk_cpf FOREIGN KEY (id) REFERENCES pessoa (cpf)
);

CREATE TABLE telefone(
    id INTEGER PRIMARY KEY, 
    telefone VARCHAR(100) NOT NULL, 
    telfone_tipo VARCHAR(15) NOT NULL,
    CONSTRAINT fk_id_cliente FOREIGN KEY (id) REFERENCES cliente_usuario (id)
);

CREATE TABLE fiador(
    id_cliente INTEGER NOT NULL, 
    id_pessoa INTEGER NOT NULL,
    CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente_usuario (id),
    CONSTRAINT fk_id_pessoa FOREIGN KEY (id_pessoa) REFERENCES pessoa (cpf),
    PRIMARY KEY (id_pessoa, id_cliente)
);

CREATE TABLE indicacao(
    id_cliente INTEGER NOT NULL, 
    id_pessoa INTEGER NOT NULL,
    CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente_usuario (id),
    CONSTRAINT fk_id_pessoa FOREIGN KEY (id_pessoa) REFERENCES pessoa (cpf),
    PRIMARY KEY (id_pessoa, id_cliente)
);

CREATE TABLE imovel(
    id SERIAL PRIMARY KEY,
    id_endereco INTEGER NOT NULL, 
    id_cliente_proprietario INTEGER NOT NULL, 
    disponivel BOOLEAN NOT NULL,
    disponivel_tipo VARCHAR(10) NOT NULL,
    valor_sugerido NUMERIC(10,2) NOT NULL, 
    valor_real NUMERIC(10,2) NOT NULL,
    valor_repassse_imobiliaria NUMERIC(10,2),
    descricao VARCHAR(255),
    area NUMERIC(10,2) NOT NULL,
    avaliacao NUMERIC(10,2),
    CONSTRAINT fk_cliente_proprietario FOREIGN KEY (id_cliente_proprietario) REFERENCES cliente_proprietario (id),
    CONSTRAINT fk_endereco FOREIGN KEY (id_endereco) REFERENCES endereco(id)
);

CREATE TABLE foto(
    id SERIAL PRIMARY KEY,
    id_imovel INTEGER NOT NULL,
    caminho VARCHAR(255) NOT NULL,
    CONSTRAINT fk_imovel FOREIGN KEY (id_imovel) REFERENCES imovel (id)
);

CREATE TABLE quartos(
    id SERIAL PRIMARY KEY, 
    quantidade_quarto INTEGER NOT NULL,
    quantidade_suite INTEGER NOT NULL,
    quantidade_sala_estar INTEGER NOT NULL,
    quantidade_sala_jantar INTEGER NOT NULL,
    numero_vagas_garagem INTEGER NOT NULL, 
    armario_embutido BOOLEAN NOT NULL
);

CREATE TABLE casa(
    id SERIAL PRIMARY KEY,
    id_imovel INTEGER NOT NULL,
    id_quartos INTEGER NOT NULL,
    data_construcao DATE NOT NULL,
    CONSTRAINT fk_imovel FOREIGN KEY (id_imovel) REFERENCES imovel (id),
    CONSTRAINT fk_quartos FOREIGN KEY (id_quartos) REFERENCES quartos (id)
);

CREATE TABLE apartamento(
    id SERIAL PRIMARY KEY,
    id_imovel INTEGER NOT NULL,
    id_quartos INTEGER NOT NULL,
    andar VARCHAR(10) NOT NULL,
    valor_condominio NUMERIC(10,2) NOT NULL,
    possui_porteiro BOOLEAN NOT NULL, 
    CONSTRAINT fk_imovel FOREIGN KEY (id_imovel) REFERENCES imovel (id),
    CONSTRAINT fk_quartos FOREIGN KEY (id_quartos) REFERENCES quartos (id)
);

CREATE TABLE terreno(
    id SERIAL PRIMARY KEY,
    id_imovel INTEGER NOT NULL,
    largura NUMERIC(10,2) NOT NULL,
    comprimento NUMERIC(10,2) NOT NULL,
    topologia VARCHAR(15) NOT NULL,
    CONSTRAINT fk_imovel FOREIGN KEY (id_imovel) REFERENCES imovel (id)
);

CREATE TABLE comercial(
    id SERIAL PRIMARY KEY,
    id_imovel INTEGER NOT NULL,
    quantidade_banheiro INTEGER NOT NULL,
    quantidade_quartos INTEGER NOT NULL,
    data_construcao DATE NOT NULL,
    CONSTRAINT fk_imovel FOREIGN KEY (id_imovel) REFERENCES imovel (id)
) ;

CREATE TABLE forma_pagamento(
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
) ;

CREATE TABLE transacao(
    id_numero_contrato SERIAL PRIMARY KEY,
    id_cliente_funcionario INTEGER NOT NULL,
    id_imovel INTEGER NOT NULL,
    id_cliente_proprietario INTEGER NOT NULL,
    id_cliente_usuario INTEGER NOT NULL,
    id_forma_pagamento INTEGER NOT NULL,
    valor_comissao NUMERIC(10,2) NOT NULL,
    data_transacao DATE NOT NULL,
    CONSTRAINT fk_ FOREIGN KEY(id_) REFERENCES  (),
    CONSTRAINT fk_ FOREIGN KEY(id_) REFERENCES  (),
    CONSTRAINT fk_ FOREIGN KEY(id_) REFERENCES  (),
    CONSTRAINT fk_ FOREIGN KEY(id_) REFERENCES  (),
    CONSTRAINT fk_ FOREIGN KEY(id_) REFERENCES  (),
);


MAPEMANETO DE TABELA

ARRUMAR RELACIONAMENTO TOTAL EM ENTIDADE FRACAS DE IMOVEL PRO GENERALIZACAO

tipo de dados do postgres no dicionario de dados

fiador e indicacao tem q ser unico
=======
CREATE TABLE endereco(
    id SERIAL PRIMARY KEY, 
    rua VARCHAR(255) NOT NULL,
    numero VARCHAR(10) NOT NULL,   
    bairro VARCHAR(30) NOT NULL, 
    cidade VARCHAR(30) NOT NULL, 
    estado VARCHAR(20) NOT NULL, 
    cep VARCHAR(20) NOT NULL, 
    complemento VARCHAR(128)
);

CREATE TABLE pessoa(
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    sexo VARCHAR(1) NOT NULL,
    estado_civil VARCHAR(15) NOT NULL,
    profissao VARCHAR(100) NOT NULL,
    CHECK (sexo IN('M', 'F'))
);

CREATE TABLE cargo(
    id SERIAL PRIMARY KEY, 
    descricao VARCHAR(255) NOT NULL, 
    salario_base NUMERIC(20,2) NOT NULL
);

CREATE TABLE cliente_funcionario(
    id SERIAL PRIMARY KEY,
    id_pessoa VARCHAR(11) NOT NULL,
    id_cargo INTEGER NOT NULL,
    login VARCHAR(255) NOT NULL,
    senha VARCHAR(128) NOT NULL,
    data_ingresso_imobiliaria DATE NOT NULL,
    salario NUMERIC(10,2) NOT NULL,
    CONSTRAINT fk_cpf FOREIGN KEY (id_pessoa) REFERENCES pessoa (cpf),
    CONSTRAINT fk_cargo FOREIGN KEY (id_cargo) REFERENCES cargo (id)
);


CREATE TABLE imovel(
    id SERIAL PRIMARY KEY,
    id_endereco INTEGER NOT NULL, 
    disponivel BOOLEAN NOT NULL,
    disponivel_tipo VARCHAR(10) NOT NULL,
    valor_sugerido NUMERIC(10,2) NOT NULL, 
    valor_real NUMERIC(10,2) NOT NULL,
    valor_repassse_imobiliaria NUMERIC(10,2),
    descricao VARCHAR(255),
    area NUMERIC(10,2) NOT NULL,
    avaliacao NUMERIC(10,2),
    imovel_tipo VARCHAR(20) NOT NULL,
    CONSTRAINT fk_endereco FOREIGN KEY (id_endereco) REFERENCES endereco(id)
);

CREATE TABLE cliente_proprietario(
    id SERIAL PRIMARY KEY,
    id_pessoa VARCHAR(11) NOT NULL,
    id_imovel INTEGER NOT NULL,
    CONSTRAINT fk_cpf FOREIGN KEY (id_pessoa) REFERENCES pessoa (cpf),
    CONSTRAINT fk_imovel FOREIGN KEY (id_imovel) REFERENCES imovel(id)
);

CREATE TABLE cliente_usuario(
    id_pessoa VARCHAR(11) NOT NULL,
    CONSTRAINT fk_cpf FOREIGN KEY (id_pessoa) REFERENCES pessoa (cpf),
    PRIMARY KEY (id_pessoa)
);

CREATE TABLE telefone(
    id SERIAL PRIMARY KEY, 
    id_cliente_usuario VARCHAR(11) NOT NULL,
    telefone VARCHAR(100) NOT NULL, 
    telefone_tipo VARCHAR(15) NOT NULL,
    CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente_usuario) REFERENCES cliente_usuario (id_pessoa)
);

CREATE TABLE fiador(
    id_cliente VARCHAR(11) NOT NULL, 
    id_pessoa VARCHAR(11) NOT NULL,
    CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente_usuario (id_pessoa),
    CONSTRAINT fk_id_pessoa FOREIGN KEY (id_pessoa) REFERENCES pessoa (cpf),
    PRIMARY KEY (id_pessoa, id_cliente)
);

CREATE TABLE indicacao(
    id_cliente VARCHAR(11) NOT NULL, 
    id_pessoa VARCHAR(11) NOT NULL,
    CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente_usuario (id_pessoa),
    CONSTRAINT fk_id_pessoa FOREIGN KEY (id_pessoa) REFERENCES pessoa (cpf),
    PRIMARY KEY (id_pessoa, id_cliente)
);


CREATE TABLE foto(
    id SERIAL PRIMARY KEY,
    id_imovel INTEGER NOT NULL,
    caminho VARCHAR(255) NOT NULL,
    CONSTRAINT fk_imovel FOREIGN KEY (id_imovel) REFERENCES imovel (id)
);

CREATE TABLE quartos(
    id SERIAL PRIMARY KEY, 
    quantidade_quarto INTEGER NOT NULL,
    quantidade_suite INTEGER NOT NULL,
    quantidade_sala_estar INTEGER NOT NULL,
    quantidade_sala_jantar INTEGER NOT NULL,
    numero_vagas_garagem INTEGER NOT NULL, 
    armario_embutido BOOLEAN NOT NULL
);

CREATE TABLE casa(
    id SERIAL PRIMARY KEY,
    id_imovel INTEGER NOT NULL,
    id_quartos INTEGER NOT NULL,
    data_construcao DATE NOT NULL,
    CONSTRAINT fk_imovel FOREIGN KEY (id_imovel) REFERENCES imovel (id),
    CONSTRAINT fk_quartos FOREIGN KEY (id_quartos) REFERENCES quartos (id)
);

CREATE TABLE apartamento(
    id SERIAL PRIMARY KEY,
    id_imovel INTEGER NOT NULL,
    id_quartos INTEGER NOT NULL,
    andar VARCHAR(10) NOT NULL,
    valor_condominio NUMERIC(10,2) NOT NULL,
    possui_porteiro BOOLEAN NOT NULL, 
    CONSTRAINT fk_imovel FOREIGN KEY (id_imovel) REFERENCES imovel (id),
    CONSTRAINT fk_quartos FOREIGN KEY (id_quartos) REFERENCES quartos (id)
);

CREATE TABLE terreno(
    id SERIAL PRIMARY KEY,
    id_imovel INTEGER NOT NULL,
    largura NUMERIC(10,2) NOT NULL,
    comprimento NUMERIC(10,2) NOT NULL,
    topologia VARCHAR(15) NOT NULL,
    CONSTRAINT fk_imovel FOREIGN KEY (id_imovel) REFERENCES imovel (id)
);

CREATE TABLE comercial(
    id SERIAL PRIMARY KEY,
    id_imovel INTEGER NOT NULL,
    quantidade_banheiro INTEGER NOT NULL,
    quantidade_quartos INTEGER NOT NULL,
    data_construcao DATE NOT NULL,
    CONSTRAINT fk_imovel FOREIGN KEY (id_imovel) REFERENCES imovel (id)
) ;

CREATE TABLE forma_pagamento(
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
) ;

CREATE TABLE transacao(
    id_numero_contrato SERIAL PRIMARY KEY,
    id_cliente_funcionario INTEGER NOT NULL,
    id_imovel INTEGER NOT NULL,
    id_cliente_proprietario INTEGER NOT NULL,
    id_cliente_usuario VARCHAR(11) NOT NULL,
    id_forma_pagamento INTEGER NOT NULL,
    valor_comissao NUMERIC(10,2) NOT NULL,
    data_transacao DATE NOT NULL,
    CONSTRAINT fk_id_cliente_funcionario FOREIGN KEY(id_cliente_funcionario) REFERENCES  cliente_funcionario(id),
    CONSTRAINT fk_id_imovel FOREIGN KEY(id_imovel) REFERENCES  imovel(id),
    CONSTRAINT fk_id_cliente_proprietario FOREIGN KEY(id_cliente_proprietario) REFERENCES  cliente_proprietario(id),
    CONSTRAINT fk_id_cliente_usuario FOREIGN KEY(id_cliente_usuario) REFERENCES  cliente_usuario(id_pessoa),
    CONSTRAINT fk_id_forma_pagamento FOREIGN KEY(id_forma_pagamento) REFERENCES  forma_pagamento(id)
);

CREATE TABLE comissao(
    id SERIAL PRIMARY KEY, 
    id_cliente_funcionario INTEGER NOT NULL, 
    id_transacao INTEGER NOT NULL,
    mes VARCHAR(15) NOT NULL,
    valor NUMERIC(10,2) NOT NULL,
    CONSTRAINT fk_id_cliente_funcionario FOREIGN KEY (id_cliente_funcionario) references cliente_funcionario(id),
    CONSTRAINT fk_id_transacao FOREIGN KEY (id_transacao) references transacao(id_numero_contrato)
);

CREATE TABLE historico_imovel(
    id SERIAL PRIMARY KEY, 
    id_imovel INTEGER NOT NULL, 
    id_cliente_funcionario INTEGER NOT  NULL, 
    data_colocado DATE NOT NULL, 
    data_alteracao DATE NOT NULL, 
    CONSTRAINT fk_id_imovel FOREIGN KEY (id_imovel) REFERENCES imovel(id),
    CONSTRAINT fk_id_cliente_funcionario FOREIGN KEY (id_cliente_funcionario) REFERENCES cliente_funcionario(id)
);

CREATE TABLE historico_aluguel(
    id SERIAL PRIMARY KEY,
    id_cliente_usuario VARCHAR(11) NOT NULL, 
    id_imovel INTEGER NOT NULL,
    valor NUMERIC(10,2) NOT NULL,
    data_vencimento DATE NOT NULL, 
    data_pagamento DATE NOT NULL,
    CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente_usuario) REFERENCES  cliente_usuario(id_pessoa), 
    CONSTRAINT fk_id_imovel FOREIGN KEY (id_imovel) REFERENCES  imovel(id)
);

CREATE TABLE avaliacao(
    id SERIAL PRIMARY KEY,
    id_cliente_usuario VARCHAR(11) NOT NULL,
    id_imovel INTEGER NOT NULL,
    nota_questao_1 INTEGER NOT NULL,
    nota_questao_2 INTEGER NOT NULL,
    nota_questao_3 INTEGER NOT NULL,
    nota_questao_4 INTEGER NOT NULL,
    nota_questao_5 INTEGER NOT NULL,
    CONSTRAINT fk_id_cliente_usuario FOREIGN KEY (id_cliente_usuario) REFERENCES cliente_usuario(id_pessoa),
    CONSTRAINT fk_id_imovel FOREIGN KEY (id_imovel) REFERENCES imovel(id)
);


--MAPEMANETO DE TABELA

--ARRUMAR RELACIONAMENTO TOTAL EM ENTIDADE FRACAS DE IMOVEL PRO GENERALIZACAO

--tipo de dados do postgres no dicionario de dados
>>>>>>> f05b581bd6057ab35f034e9710115bae3e368cc9
