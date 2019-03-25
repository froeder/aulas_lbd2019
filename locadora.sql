CREATE TABLE dvd (
    numero INTEGER PRIMARY KEY
) ;

CREATE TABLE cliente (
    nmro_associado INTEGER PRIMARY KEY, 
    nome VARCHAR(255),
    sobrenome VARCHAR(255),
    endereco VARCHAR(255),
    telefone VARCHAR(255)
) ;

CREATE TABLE aluga ( 
    id INTEGER PRIMARY KEY ,
    devolvido DATE,
    data_aluguel DATE, 
    nmro_cliente INTEGER,
    nmro_dvd INTEGER,
    valor DECIMAL(2,0),
    CONSTRAINT nmro_cliente_fk FOREIGN KEY (nmro_cliente) REFERENCES cliente (nmro_associado),
    CONSTRAINT nmro_dvd_fk FOREIGN KEY (nmro_dvd) REFERENCES dvd (numero) 
);

CREATE TABLE categoria (
    id INTEGER PRIMARY KEY ,
    tipo VARCHAR(255),
    valor DECIMAL(2,0)
) ;

CREATE TABLE filme (
    id INTEGER PRIMARY KEY ,
    categoria INTEGER,
    titulo VARCHAR(255),
    CONSTRAINT categoria_fk FOREIGN KEY (categoria) REFERENCES categoria (id)
) ;

CREATE TABLE ator(
    nome_real VARCHAR(255),
    data_nascimento DATE,
    filme INTEGER,
    CONSTRAINT filme_fk FOREIGN KEY (filme) REFERENCES filme (id)
) ;
