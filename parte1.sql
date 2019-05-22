CREATE TABLE telefone(
    id_cliente INTEGER, 
    telefone INTEGER NOT NULL, 
    telefone_tipo NOT NULL,
    CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES pessoa (id)
);

CREATE TABLE fiador();

CREATE TABLE indicacao();

CREATE TABLE pessoa(
    id SERIAL PRIMARY KEY ,
    cpf INTEGER NOT NULL ,
    nome VARCHAR(255) NOT NULL ,
    email VARCHAR(255) NOT NULL, 
    sexo VARCHAR(1) NOT NULL
    estado_civil VARCHAR(20) NOT NULL,
    profissao VARCHAR(255) NOT NULL,
    CHECK (sexo IN('M', 'F'))
)

CREATE TABLE cliente_usuario(
    id SERIAL PRIMARY KEY,
    id_fiador INTEGER NOT NULL, 
    id_indicacao INTEGER NOT NULL,
    CONSTRAINT fk_id_fiador FOREIGN KEY (id_fiador) REFERENCES pessoa (id),
    CONSTRAINT fk_id_indicacao FOREIGN KEY (id_indicacao) REFERENCES pessoa (id)
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
)
;

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
    CONSTRAINT fk_cliente_proprietario (id_cliente_proprietario) REFERENCES cliente_proprietario (id)
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
    id_quartos INTEGER NOT NULL,
    data_construção DATA NOT NULL,
    CONSTRAINT fk_quartos FOREIGN KEY (id_quartos) REFERENCES quartos (id)
);

CREATE TABLE imovel_apartamento
(
    id SERIAL PRIMARY KEY,
    id_quartos INTEGER NOT NULL ,
    data_construção DATA NOT NULL,
    andar INTEGER NOT NULL,
    valor_condominio DECIMAL (10,2) NOT NULL,
    possui_porteiro BOOLEAN,
    CONSTRAINT fk_quartos FOREIGN KEY (id_quartos) REFERENCES quartos (id)
);

CREATE TABLE imovel_terreno
(
    id SERIAL PRIMARY KEY,
    largura DECIMAL(10,2) NOT NULL,
    comprimento DECIMAL(10,2) NOT NULL,
    topologia VARCHAR(255) NOT NULL,
    CHECK (topologia IN ('Aclive', 'Declive', 'Nenhuma'))
);

CREATE TABLE imovel_comercial
(
    id SERIAL PRIMARY KEY,
    data_construção DATA NOT NULL,
    qtde_banheiro INTEGER NOT NULL,
    qtde_quartos INTEGER NOT NULL
);

