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
    CONSTRAINT fk_quartos FOREIGN KEY (id_quartos) REFERENCES quartos (id)
);

CREATE TABLE imovel_apartamento
(
    id SERIAL PRIMARY KEY,
    id_quartos INTEGER NOT NULL ,
    andar INTEGER NOT NULL,
    valor_condominio DECIMAL (10,2) NOT NULL,
    possui_porteiro BOOLEAN NOT NULL
);