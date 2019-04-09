-- 
-- CRIA SCHEMA SAFIS 
-- 
DROP SCHEMA safis CASCADE;
CREATE SCHEMA safis;
SET SEARCH_PATH TO safis;

--
-- TABELAS
--
CREATE TABLE aluno(
	matricula INT,
	PRIMARY KEY (matricula)
);

CREATE TABLE  alunocurriculo(
	 matricula INT, 
         codcurso CHAR(3), 
	 dataaprovacao DATE, 
	 dataingresso DATE, 
         valormensalidade DEC(10, 2),  
         PRIMARY KEY(matricula, codcurso)
);

CREATE TABLE  alunohistorico(
         matricula INT, 
         coddisciplina CHAR(7), 
         codturma SMALLINT, 
  	 nota DEC(5,2), 
         frequencia SMALLINT, 
 	 situacao CHAR CHECK (situacao IN ('M', 'A', 'N', 'F', 'C')),
         PRIMARY KEY (matricula, coddisciplina, codturma)
);

CREATE TABLE  atividade(
         codatividade INT, 
         descricaoatividade VARCHAR(40),
         matricula INT,
         codprojeto INT, 
         datainicioatividade DATE,
         datafimatividade DATE,
         dataprevistainicioatividade DATE,
         dataprevistafimatividade DATE,
         numerohoras INT,
         PRIMARY KEY (codatividade)
);

CREATE TABLE curriculo(
	codcurso CHAR(3), 
	dataaprovacao DATE,
	PRIMARY KEY (codcurso, dataaprovacao)
);

CREATE TABLE curso(
	codcurso CHAR(3),
        nomecurso VARCHAR(40) UNIQUE, 
	matricula INT, 
        codunidade CHAR(5),
	PRIMARY KEY (codcurso)
); 

CREATE TABLE  despesa(
	codprojeto INT, 
	coddespesa SMALLINT, 
        descricaodespesa VARCHAR(40),
	valordespesa DEC(10,2),
	datapagamentodespesa DATE,
	cnpj CHAR(14),
	PRIMARY KEY(codprojeto, coddespesa)
);

CREATE TABLE  dirigente(
	matricula INT, 
        tipodirigente CHAR CHECK (tipodirigente IN ('C', 'U', 'G')),
        gratificacao DEC(10,2),
	PRIMARY KEY(matricula)
);

CREATE TABLE  disciplina(
	coddisciplina CHAR(7), 
	nomedisciplina VARCHAR(40), 
	cargahoraria SMALLINT,
	PRIMARY KEY (coddisciplina)
);

CREATE TABLE  disciplinacurriculo(
        codcurso CHAR(3), 
        dataaprovacao DATE, 
        coddisciplina CHAR(7), 
        periodo SMALLINT, 
        caracteristica CHAR(2) CHECK (caracteristica IN ('OB', 'OP')),
	PRIMARY KEY (codcurso, dataaprovacao, coddisciplina)
);

CREATE TABLE fonefornecedor(
	cnpj CHAR(14),
	fone CHAR(12),
        PRIMARY KEY (cnpj, fone)
);

CREATE TABLE  fornecedor(
	cnpj CHAR(14), 
	nomefornecedor VARCHAR(40),
	enderecofornecedor VARCHAR(60),
	PRIMARY KEY (cnpj)
);

CREATE TABLE  funcionario(
	matricula INT, 
	dataadmissao DATE, 
	remuneracao DEC(10,2), 
	codunidade CHAR(5),
	PRIMARY KEY (matricula)
);

CREATE TABLE pessoa(
        matricula INT,
        cpf CHAR(11) UNIQUE,
        nomepessoa VARCHAR(40),
        genero CHAR CHECK (genero IN ('M', 'F')),
        PRIMARY KEY (matricula)
);

CREATE TABLE pessoaresultado(
        matricula INT, 
	codresultado INT, 
        PRIMARY KEY (matricula, codresultado)
);

CREATE TABLE prerequisito(
	coddisciplina CHAR(7), 
	codprerequisito CHAR(7), 
	PRIMARY KEY(coddisciplina, codprerequisito)
);

CREATE TABLE professor(
	matricula INT,
        titulo CHAR CHECK (titulo IN ('B', 'E', 'M', 'D')),
        vinculo CHAR CHECK (vinculo IN ('H', 'P', 'I')),
	PRIMARY KEY(matricula)
);

CREATE TABLE professorhistorico(
	matricula INT,
	coddisciplina CHAR(7),
	codturma SMALLINT,
        nroreprovadosnota INT,
	nroreprovadosfalta INT, 
	nromatriculados INT,
	nroaprovados INT,
	PRIMARY KEY(matricula, coddisciplina, codturma)
);

CREATE TABLE projeto(
	codprojeto INT,
        tituloprojeto VARCHAR(40),
        coordenador INT,
        superprojeto INT, 
        fonte VARCHAR(40),
        valorexterno DEC(10,2),
        valorcontrapartida DEC(10,2),
        datainicioprojeto DATE,
        datafimprojeto DATE,
        estado CHAR CHECK (estado IN ('S', 'A', 'C', 'E')),
	PRIMARY KEY(codprojeto)
);

CREATE TABLE receita(
	codreceita INT,
	PRIMARY KEY(codreceita)
);

CREATE TABLE receitamensalidade(
	codreceita INT,
	valorreceita DEC(10,2),
	datareceita DATE,
	matricula INT,
	PRIMARY KEY(codreceita)
);

CREATE TABLE receitaprojeto(
	codreceita INT,
	descricaoreceita VARCHAR(40),
	valorreceita DEC(10,2),
	datareceita DATE,
	codprojeto INT,
	PRIMARY KEY(codreceita)
);

CREATE TABLE resultado(
	codresultado INT,
        tituloresultado VARCHAR(40) UNIQUE,
	codprojeto INT,
        anoresultado SMALLINT,
	mesresultado SMALLINT,
        descricaolocal VARCHAR(40),
	cidadelocal VARCHAR(40),
	estadolocal CHAR(2),
	paislocal VARCHAR(40),
        tiporesultado CHAR 
            CHECK (tiporesultado IN ('J', 'C', 'L', 'P', 'S', 'T', 'O')),
	PRIMARY KEY(codresultado)
);

CREATE TABLE sala(
	codsala CHAR(6),
        capacidade INT,
	PRIMARY KEY(codsala)
);

CREATE TABLE  tecnicoadministrativo(
	matricula INT,
        nivel CHAR CHECK (nivel IN ('A', 'M', 'S')),
	PRIMARY KEY (matricula)
);

CREATE TABLE  turma(
	coddisciplina CHAR(7), 
	codturma SMALLINT, 
	ano CHAR(4), 
	semestre CHAR, 
	nroaulasdadas SMALLINT,
	PRIMARY KEY (coddisciplina, codturma) 
);

CREATE TABLE  turmasala(
	coddisciplina CHAR(7), 
	codturma SMALLINT, 
        codsala CHAR(6),
        horario VARCHAR(256),
	PRIMARY KEY (coddisciplina, codturma, codsala) 
);

CREATE TABLE  unidade(
	codunidade CHAR(5), 
        nomeunidade VARCHAR(40) UNIQUE, 
	matricula INT,
        superunidade CHAR(5),
	PRIMARY KEY (codunidade)
);

--
-- RESTRIÇÕES DE INTEGRIDADE REFERENCIAL
--
ALTER TABLE aluno ADD CONSTRAINT matriculaFK
	FOREIGN KEY (matricula) REFERENCES pessoa(matricula) DEFERRABLE;
ALTER TABLE curso ADD CONSTRAINT matriculaFK 
	FOREIGN KEY (matricula) REFERENCES dirigente(matricula) DEFERRABLE;
ALTER TABLE curso ADD CONSTRAINT codunidadeFK 
	FOREIGN KEY (codunidade) REFERENCES unidade(codunidade) DEFERRABLE;
ALTER TABLE curriculo ADD CONSTRAINT codcursoFK 
	FOREIGN KEY (codcurso) REFERENCES curso(codcurso) DEFERRABLE;
ALTER TABLE alunocurriculo ADD CONSTRAINT matriculaFK 
	FOREIGN KEY (matricula) REFERENCES aluno(matricula) DEFERRABLE;
ALTER TABLE alunocurriculo ADD CONSTRAINT codcursodataaprovacaoFK 
	FOREIGN KEY (codcurso, dataaprovacao) REFERENCES curriculo(codcurso, dataaprovacao) DEFERRABLE;
ALTER TABLE alunohistorico ADD CONSTRAINT coddisciplinacodturmaFK 
	FOREIGN KEY (coddisciplina,codturma) REFERENCES turma(coddisciplina,codturma) DEFERRABLE;
ALTER TABLE atividade ADD CONSTRAINT matriculaFK 
	FOREIGN KEY (matricula) REFERENCES funcionario(matricula) DEFERRABLE;
ALTER TABLE atividade ADD CONSTRAINT codprojetoFK
	FOREIGN KEY (codprojeto) REFERENCES projeto(codprojeto) DEFERRABLE;
ALTER TABLE dirigente ADD CONSTRAINT matriculaFK 
	FOREIGN KEY (matricula) REFERENCES funcionario(matricula) DEFERRABLE;
ALTER TABLE disciplinacurriculo ADD CONSTRAINT codcursodataaprovacaoFK 
	FOREIGN KEY (codcurso, dataaprovacao) REFERENCES curriculo (codcurso, dataaprovacao) DEFERRABLE;
ALTER TABLE disciplinacurriculo ADD CONSTRAINT coddisciplinaFK 
	FOREIGN KEY (coddisciplina) REFERENCES disciplina(coddisciplina) DEFERRABLE;
ALTER TABLE fonefornecedor ADD CONSTRAINT cnpjFK 
	FOREIGN KEY (cnpj) REFERENCES fornecedor(cnpj) DEFERRABLE;
ALTER TABLE funcionario ADD CONSTRAINT matriculaFK 
	FOREIGN KEY (matricula) REFERENCES pessoa(matricula) DEFERRABLE;
ALTER TABLE funcionario ADD CONSTRAINT codunidadeFK 
	FOREIGN KEY (codunidade) REFERENCES unidade (codunidade) DEFERRABLE;
ALTER TABLE pessoaresultado ADD CONSTRAINT matriculaFK 
	FOREIGN KEY (matricula) REFERENCES pessoa(matricula) DEFERRABLE;
ALTER TABLE pessoaresultado ADD CONSTRAINT codresultadoFK 
	FOREIGN KEY (codresultado) REFERENCES resultado(codresultado) DEFERRABLE;
ALTER TABLE prerequisito ADD CONSTRAINT coddisciplinaFK 
	FOREIGN KEY (coddisciplina) REFERENCES disciplina(coddisciplina) DEFERRABLE;
ALTER TABLE prerequisito ADD CONSTRAINT codprerequisitoFK 
	FOREIGN KEY (codprerequisito) 
	REFERENCES disciplina(coddisciplina) DEFERRABLE;
ALTER TABLE professor ADD CONSTRAINT matriculaFK 
	FOREIGN KEY (matricula) REFERENCES funcionario(matricula) DEFERRABLE;
ALTER TABLE professorhistorico ADD CONSTRAINT matriculaFK 
	FOREIGN KEY (matricula) REFERENCES professor(matricula) DEFERRABLE;
ALTER TABLE professorhistorico ADD CONSTRAINT codturmaFK 
	FOREIGN KEY (coddisciplina, codturma) 
        REFERENCES turma(coddisciplina, codturma) DEFERRABLE;
ALTER TABLE projeto ADD CONSTRAINT coordenadorFK 
	FOREIGN KEY (coordenador)
        REFERENCES funcionario(matricula) DEFERRABLE;
ALTER TABLE projeto ADD CONSTRAINT superprojetoFK 
	FOREIGN KEY (superprojeto)
        REFERENCES projeto(codprojeto) DEFERRABLE;
ALTER TABLE receitamensalidade ADD CONSTRAINT codreceitaFK 
	FOREIGN KEY (codreceita)
        REFERENCES receita(codreceita) DEFERRABLE;
ALTER TABLE receitamensalidade ADD CONSTRAINT matriculaFK 
	FOREIGN KEY (matricula)
        REFERENCES aluno(matricula) DEFERRABLE;
ALTER TABLE receitaprojeto ADD CONSTRAINT codreceitaFK 
	FOREIGN KEY (codreceita)
        REFERENCES receita(codreceita) DEFERRABLE;
ALTER TABLE receitaprojeto ADD CONSTRAINT codprojetoFK 
	FOREIGN KEY (codprojeto)
        REFERENCES projeto(codprojeto) DEFERRABLE;
ALTER TABLE resultado ADD CONSTRAINT codprojetoFK 
	FOREIGN KEY (codprojeto)
        REFERENCES projeto(codprojeto) DEFERRABLE;
ALTER TABLE tecnicoadministrativo ADD CONSTRAINT matriculaFK 
	FOREIGN KEY (matricula) REFERENCES funcionario(matricula) DEFERRABLE;
ALTER TABLE turma ADD CONSTRAINT coddisciplinaFK 
	FOREIGN KEY (coddisciplina) REFERENCES disciplina(coddisciplina) DEFERRABLE;
ALTER TABLE turmasala ADD CONSTRAINT codturmaFK 
	FOREIGN KEY (coddisciplina, codturma) 
        REFERENCES turma(coddisciplina, codturma) DEFERRABLE;
ALTER TABLE turmasala ADD CONSTRAINT codsalaFK 
	FOREIGN KEY (codsala) REFERENCES sala(codsala) DEFERRABLE;
ALTER TABLE unidade ADD CONSTRAINT matriculaFK 
	FOREIGN KEY (matricula) REFERENCES dirigente(matricula) DEFERRABLE;
ALTER TABLE unidade ADD CONSTRAINT superunidadeFK 
	FOREIGN KEY (superunidade) REFERENCES unidade(codunidade) 
        ON DELETE SET NULL DEFERRABLE;
---
--- FIM
---