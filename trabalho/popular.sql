INSERT INTO pessoa VALUES ('41383062854','Jhonatan Froeder de Oliveira', 'froeder3@gmail.com', 'M', 'Solteiro', 'Desenvolvedor JS') ;
INSERT INTO pessoa VALUES ('12345678910','Marcio Silva', 'marcio.silva@facom.ufms.br', 'M', 'Outro', 'Professor Adjunto A') ;
INSERT INTO pessoa VALUES ('98765432101','Marcelo Augusto Turine', 'marcelo.turine@ufms.br', 'M', 'Casado', 'Reitor') ;
INSERT INTO pessoa VALUES ('75315982462','Neymar Jr', 'reidelas@gmail.com', 'M', 'Solteiro', 'Jogador de futebol') ;
INSERT INTO pessoa VALUES ('96325874102','Roseli Luiza Froeder', 'roseliluiza@gmail.com', 'F', 'Casada', 'Empregada Doméstica') ;
INSERT INTO pessoa VALUES ('36985214795','Jorge Aparecido de Oliveira', 'jorgeoliveira@gmail.com', 'M', 'Casado', 'Fiscal de Empresa de ônibus') ;
INSERT INTO pessoa VALUES ('32165478943','Jair Messias Bolsonaro', 'bolsonaro@gov.br', 'M', 'Casado', 'Presidente Eleito') ;
INSERT INTO pessoa VALUES ('96325874125','Luiz Inácio Lula da Silva', 'lula@lua.com', 'M', 'Solteiro', 'Ex-presidente') ;
INSERT INTO pessoa VALUES ('74125896333','Meghan Fox', 'megan@icloud.com', 'F', 'Divorciada', 'Atriz') ;
INSERT INTO pessoa VALUES ('11298765326','Damares da Silva', 'damares@iurd.com', 'F', 'Casada', 'Ministra da Família e da Criança') ;
INSERT INTO pessoa VALUES ('66984412365','Xuxa Meneguel', 'xuxa@xuxa.com', 'F', 'Casada', 'Apresentadora de TV') ;
INSERT INTO pessoa VALUES ('78965412358', 'Flavio Bolsonaro', 'flavio@gov.br', 'M', 'Outro', 'Deputado Federal') ;

INSERT INTO cliente_proprietario(id_pessoa) VALUES ('96325874125');
INSERT INTO cliente_proprietario(id_pessoa) VALUES ('41383062854');
INSERT INTO cliente_proprietario(id_pessoa) VALUES ('96325874102');
INSERT INTO cliente_proprietario(id_pessoa) VALUES ('11298765326');

INSERT INTO cliente_usuario(id_pessoa) VALUES ('41383062854');
INSERT INTO cliente_usuario(id_pessoa) VALUES ('96325874125');
INSERT INTO cliente_usuario(id_pessoa) VALUES ('66984412365');
INSERT INTO cliente_usuario(id_pessoa) VALUES ('32165478943');
INSERT INTO cliente_usuario(id_pessoa) VALUES ('36985214795');

INSERT INTO fiador(id_pessoa, id_cliente) VALUES ('78965412358', '41383062854');
INSERT INTO fiador(id_pessoa, id_cliente) VALUES ('66984412365', '41383062854');
INSERT INTO fiador(id_pessoa, id_cliente) VALUES ('12345678910', '96325874125');
INSERT INTO fiador(id_pessoa, id_cliente) VALUES ('75315982462', '96325874125');
INSERT INTO fiador(id_pessoa, id_cliente) VALUES ('11298765326', '32165478943');
INSERT INTO fiador(id_pessoa, id_cliente) VALUES ('96325874125', '32165478943');

INSERT INTO cargo(descricao, salario_base) VALUES ('Gerente de Negócios', 10000) ;
INSERT INTO cargo(descricao, salario_base) VALUES ('Corretor', 5000) ;
INSERT INTO cargo(descricao, salario_base) VALUES ('Vendedor', 3000) ;

INSERT INTO cliente_funcionario(id_pessoa,id_cargo, login, senha, data_ingresso_imobiliaria) VALUES('41383062854',1 , 'jhonatan.froeder', '123456', '10-10-2010') ;
INSERT INTO cliente_funcionario(id_pessoa,id_cargo, login, senha, data_ingresso_imobiliaria) VALUES('96325874102',2 , 'roseli.froeder','123456',  '01-02-2011') ;
INSERT INTO cliente_funcionario(id_pessoa,id_cargo, login, senha, data_ingresso_imobiliaria) VALUES('96325874125',2 , 'lula.silva', '123456', '02-05-2015') ;
INSERT INTO cliente_funcionario(id_pessoa,id_cargo, login, senha, data_ingresso_imobiliaria) VALUES('66984412365',2 , 'xuxa.meneguel', '123456','04-09-2018' ) ;
INSERT INTO cliente_funcionario(id_pessoa,id_cargo, login, senha, data_ingresso_imobiliaria) VALUES('11298765326',3 , 'damares.silva','123456', '07-10-2017' ) ;
INSERT INTO cliente_funcionario(id_pessoa,id_cargo, login, senha, data_ingresso_imobiliaria) VALUES('74125896333',3 , 'meghan.fox', '123456', '07-12-2011') ;
INSERT INTO cliente_funcionario(id_pessoa,id_cargo, login, senha, data_ingresso_imobiliaria) VALUES('78965412358',3 , 'flavio.bolsonaro', '123456', '10-11-2012') ;
