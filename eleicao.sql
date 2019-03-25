CREATE TABLE zona (
    numero INTEGER PRIMARY KEY
) ;

CREATE TABLE secao (
    nome VARCHAR(255),
    zona_nmro INTEGER,
    numero INTEGER PRIMARY KEY,
    CONSTRAINT zona_fk FOREIGN KEY (zona_nmro) REFERENCES zona (numero)
) ;

CREATE TABLE votos (
    zona INTEGER ,
    CONSTRAINT secao_fk FOREIGN KEY (zona) REFERENCES secao (numero)
);

CREATE TABLE eleitor (
    titulo_eleitor INTEGER PRIMARY KEY,
    nome VARCHAR(255),
    zona INTEGER,
    secao INTEGER,
    CONSTRAINT zona_fk FOREIGN KEY (zona) REFERENCES zona (numero),
    CONSTRAINT secao_fk FOREIGN KEY (secao) REFERENCES secao (numero)
);

CREATE TABLE candidato (
    nome VARCHAR(255),
    cpf INTEGER,
    partido VARCHAR(255)
);

CREATE TABLE partido (
    sigla VARCHAR(255) PRIMARY KEY
) ;

ALTER TABLE candidato ADD CONSTRAINT sigla_sk FOREIGN KEY (partido) REFERENCES  partido (sigla)
