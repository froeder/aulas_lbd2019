-- Tabela empregado
CREATE TABLE empregado (
    pnome VARCHAR(255),
    minicial VARCHAR(255),
    unome VARCHAR(255),
    ssn integer PRIMARY KEY,
    datanasc DATE,
    endereco VARCHAR(255),
    sexo CHAR,
    CHECK(sexo IN ('M', 'F')),
    salario DECIMAL(2,0),
    superssn INTEGER,
    dno INTEGER,
    CONSTRAINT superssn_fk FOREIGN KEY (superssn) REFERENCES empregado (ssn)
) ;

-- Tabela Departamento
CREATE TABLE departamento (
    dnome VARCHAR(255),
    dnumero INTEGER PRIMARY KEY, 
    gerssn INTEGER,
    gerdatainicio DATE,
    CONSTRAINT gerssn_fk FOREIGN KEY (gerssn) REFERENCES empregado (ssn)
);

--Tabela Departamento Localizacoes
CREATE TABLE dept_localizacoes (
    dnmro INTEGER , 
    dlocalizacao VARCHAR(255),
    PRIMARY KEY (dnmro, dlocalizacao),
    CONSTRAINT dnumero_fk FOREIGN KEY (dnmro) REFERENCES departamento (dnumero)
) ;

--Tabela Projeto

CREATE TABLE projeto (
    pjnome VARCHAR(255),
    pnumero INTEGER PRIMARY KEY,
    plocalizacao VARCHAR(255),
    dnum INTEGER,
    CONSTRAINT dnum_fk FOREIGN KEY (dnum) REFERENCES departamento (dnumero)
) ;

--Tabela Trabalha em

CREATE TABLE trabalha_em (
    essn INTEGER, 
    pno INTEGER,
    horas INTEGER,
    PRIMARY KEY(essn, pno),
    CONSTRAINT essn_fk FOREIGN KEY (essn) REFERENCES empregado (ssn),
    CONSTRAINT pno_fk FOREIGN KEY (pno) REFERENCES projeto (pnumero)
) ;

--Tabela Dependente

CREATE TABLE dependente (
    essn INTEGER,
    nome_dependente VARCHAR(255),
    sexo CHAR,
    CHECK (sexo IN ('M', 'F')),
    PRIMARY KEY (essn, nome_dependente),
    CONSTRAINT essn_fn FOREIGN KEY (essn) REFERENCES empregado (sSn) 
);

-- Adicionar constraint dno empregado

ALTER TABLE empregado ADD CONSTRAINT dno_fk FOREIGN KEY (dno) REFERENCES departamento (dnumero) ;
