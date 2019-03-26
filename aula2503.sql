INSERT INTO empregado (pnome, minicial, unome, ssn, datanasc, endereco, sexo, salario, superssn, dno) VALUES 
('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638 Voss, Houston, Tx', 'M', 40000, 888665555, NULL) ;


INSERT INTO empregado (pnome, minicial, unome, ssn, datanasc, endereco, sexo, salario, superssn, dno) VALUES 
('James', 'E', 'Borg', 888665555, '1937-11-10', '450 Stone, Houston, TX', 'M', 55000, null, NULL) ;

INSERT INTO empregado (pnome, minicial, unome, ssn, datanasc, endereco, sexo, salario, superssn, dno) VALUES 
('Jennifer', 'S', 'Wallace', 987654321 , '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000 , 888665555, NULL) ;
--Fazer updates


INSERT INTO empregado (pnome, minicial, unome, ssn, datanasc, endereco, sexo, salario, superssn, dno) VALUES 
('John', 'B', 'Smith', 123456789, '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, 333445555, 5) ;

INSERT INTO empregado (pnome, minicial, unome, ssn, datanasc, endereco, sexo, salario, superssn, dno) VALUES 
('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321 Castle, SPring, TX', 'F',25000 ,987654321 , 4) ;

--Daqui

INSERT INTO empregado (pnome, minicial, unome, ssn, datanasc, endereco, sexo, salario, superssn, dno) VALUES 
('Ramesh', 'K', 'Narayan',666884444 , '1962-09-15', '975 Fire Oak, Humble, TX', 'M',38000 ,333445555 , 5) ;

INSERT INTO empregado (pnome, minicial, unome, ssn, datanasc, endereco, sexo, salario, superssn, dno) VALUES 
('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000,333445555 ,5 ) ;

INSERT INTO empregado (pnome, minicial, unome, ssn, datanasc, endereco, sexo, salario, superssn, dno) VALUES 
('Ahmad', 'V', 'Jabbr',987987987 , '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, 987654321,4 ) ;

--DEPARTAMENTO

INSERT INTO departamento (dnome, dnumero, gerssn, gerdatainicio) 
VALUES ('Pesquisa', 5, 333445555, '1988-05-22') ;

INSERT INTO departamento (dnome, dnumero, gerssn, gerdatainicio) 
VALUES ('Sede adminsitrativa',1 ,888665555 , '1981-06-19') ;

INSERT INTO departamento (dnome, dnumero, gerssn, gerdatainicio) 
VALUES ('Administração', 4, 987654321, '1995-01-01') ;

--DEPTO LOCALIZACAO

INSERT INTO depto_localizacoes (dnumero, dlocalizacao) VALUES (1, 'Houston') ;

INSERT INTO depto_localizacoes (dnumero, dlocalizacao) VALUES (4, 'Stafford') ;

INSERT INTO depto_localizacoes (dnumero, dlocalizacao) VALUES (5, 'Bellaire') ;

INSERT INTO depto_localizacoes (dnumero, dlocalizacao) VALUES (5, 'Sugarland') ;

INSERT INTO depto_localizacoes (dnumero, dlocalizacao) VALUES (5, 'Houston') ;


-- PROJETO

INSERT INTO projeto (pjnome, pnumero, plocalizacao, dnum) 
VALUES ('ProdutoX',1 , 'Bellaire',5 ) ;

INSERT INTO projeto (pjnome, pnumero, plocalizacao, dnum) 
VALUES ('ProdutoY',2 , 'Sugarland',5 ) ;

INSERT INTO projeto (pjnome, pnumero, plocalizacao, dnum) 
VALUES ('ProdutoZ',3 , 'Houston', 5) ;

INSERT INTO projeto (pjnome, pnumero, plocalizacao, dnum)
VALUES ('Automatizacao', 10, 'Stafford',4 ) ;

INSERT INTO projeto (pjnome, pnumero, plocalizacao, dnum)
VALUES ('Reorganização', 20, 'Houston',1 ) ;

INSERT INTO projeto (pjnome, pnumero, plocalizacao, dnum)
VALUES ('Novos Benfícios',30 , 'Sttaford',4 ) ;

--TRABALHA EM 

INSERT INTO trabalha_em (essn, pno, horas) VALUES (123456789, 1, 32.5) ;

INSERT INTO trabalha_em (essn, pno, horas) VALUES (123456789,2 ,7.5 ) ;

INSERT INTO trabalha_em (essn, pno, horas) VALUES (666884444, 3, 40.0) ;

INSERT INTO trabalha_em (essn, pno, horas) VALUES (453453453, 1,20.0 ) ;

INSERT INTO trabalha_em (essn, pno, horas) VALUES (453453453, 2, 20.0) ;

INSERT INTO trabalha_em (essn, pno, horas) VALUES (333445555,2 ,10.0 ) ;

INSERT INTO trabalha_em (essn, pno, horas) VALUES (333445555, 3,10.0 ) ;

INSERT INTO trabalha_em (essn, pno, horas) VALUES (333445555, 10, 10.0) ;

INSERT INTO trabalha_em (essn, pno, horas) VALUES (333445555, 20, 10.0) ;

INSERT INTO trabalha_em (essn, pno, horas) VALUES (999887777, 30, 30.0) ;

INSERT INTO trabalha_em (essn, pno, horas) VALUES (999887777,10 ,10.0 ) ;

INSERT INTO trabalha_em (essn, pno, horas) VALUES (987987987, 10, 35.0) ;

INSERT INTO trabalha_em (essn, pno, horas) VALUES (987987987, 30, 5.0) ;

INSERT INTO trabalha_em (essn, pno, horas) VALUES (987654321,30 ,20.0 ) ;

INSERT INTO trabalha_em (essn, pno, horas) VALUES (987654321,20 ,15.0 ) ;

INSERT INTO trabalha_em (essn, pno, horas) VALUES (888665555, 20,null ) ;


-- DEPENDENTE

INSERT INTO dependente (essn, nome_dependente, sexo, datanasc, parentesco) 
VALUES (333445555, 'Alice', 'F', '1986-04-05', 'Filha') ;

INSERT INTO dependente (essn, nome_dependente, sexo, datanasc, parentesco) 
VALUES (3334455555, 'Theodore', 'M', '1983-10-25', 'Filho') ;

INSERT INTO dependente (essn, nome_dependente, sexo, datanasc, parentesco) 
VALUES (333445555, 'Joy', 'F', '1958-05-03', 'Cônjugue') ;

INSERT INTO dependente (essn, nome_dependente, sexo, datanasc, parentesco) 
VALUES (987654321, 'Abner', 'M', '1942-02-28', 'Cônjugue') ;


INSERT INTO dependente (essn, nome_dependente, sexo, datanasc, parentesco) 
VALUES (123456789, 'Michael', 'M', '1988-01-04', 'Filho') ;

INSERT INTO dependente (essn, nome_dependente, sexo, datanasc, parentesco) 
VALUES (123456789, 'Alice', 'F', '1988-12-30', 'Filha') ;

INSERT INTO dependente (essn, nome_dependente, sexo, datanasc, parentesco) 
VALUES (123456789, 'Elizabeth', 'F', '1967-05-05', 'Cônjuge') ;

