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


INSERT INTO cliente_usuario(id_pessoa) VALUES ('41383062854');
INSERT INTO cliente_usuario(id_pessoa) VALUES ('96325874125');
INSERT INTO cliente_usuario(id_pessoa) VALUES ('66984412365');
INSERT INTO cliente_usuario(id_pessoa) VALUES ('32165478943');
INSERT INTO cliente_usuario(id_pessoa) VALUES ('36985214795');
INSERT INTO cliente_usuario(id_pessoa) VALUES ('12345678910');
INSERT INTO cliente_usuario(id_pessoa) VALUES ('98765432101');
INSERT INTO cliente_usuario(id_pessoa) VALUES ('75315982462');
INSERT INTO cliente_usuario(id_pessoa) VALUES ('96325874102');
INSERT INTO cliente_usuario(id_pessoa) VALUES ('78965412358');


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

INSERT INTO telefone(id_cliente_usuario, telefone, telefone_tipo) VALUES ('41383062854','67991322148', 'Casa' );
INSERT INTO telefone(id_cliente_usuario, telefone, telefone_tipo) VALUES ('41383062854','67999998888', 'Trabalho' );
INSERT INTO telefone(id_cliente_usuario, telefone, telefone_tipo) VALUES ('41383062854','67999998777', 'Conjê' );
INSERT INTO telefone(id_cliente_usuario, telefone, telefone_tipo) VALUES ('96325874125','67999211888', 'Trabalho' );
INSERT INTO telefone(id_cliente_usuario, telefone, telefone_tipo) VALUES ('96325874125','67999978855', 'Casa' );
INSERT INTO telefone(id_cliente_usuario, telefone, telefone_tipo) VALUES ('66984412365','67991322148', 'Casa' );
INSERT INTO telefone(id_cliente_usuario, telefone, telefone_tipo) VALUES ('66984412365','67944498638', 'Trabalho' );
INSERT INTO telefone(id_cliente_usuario, telefone, telefone_tipo) VALUES ('66984412365','67999998777', 'Conjê' );
INSERT INTO telefone(id_cliente_usuario, telefone, telefone_tipo) VALUES ('32165478943','67999211888', 'Trabalho' );
INSERT INTO telefone(id_cliente_usuario, telefone, telefone_tipo) VALUES ('36985214795','67996658888', 'Casa' );

INSERT INTO indicacao(id_cliente, id_pessoa) VALUES ('96325874125', '11298765326');
INSERT INTO indicacao(id_cliente, id_pessoa) VALUES ('96325874125', '74125896333');
INSERT INTO indicacao(id_cliente, id_pessoa) VALUES ('66984412365', '96325874125');
INSERT INTO indicacao(id_cliente, id_pessoa) VALUES ('66984412365', '32165478943');
INSERT INTO indicacao(id_cliente, id_pessoa) VALUES ('36985214795', '75315982462');
INSERT INTO indicacao(id_cliente, id_pessoa) VALUES ('36985214795', '78965412358');

INSERT INTO endereco(rua, numero, bairro, cidade, estado, cep) VALUES ('Rua Pereira Estéfano', 2110, 'Vila da Saúde', 'São Paulo', 'SP', '04144-070');
INSERT INTO endereco(rua, numero, bairro, cidade, estado, cep) VALUES ('Rua Cândido Portinari', 654, 'Real Parque', 'São José', 'SC', '78945-621');
INSERT INTO endereco(rua, numero, bairro, cidade, estado, cep) VALUES ('Rua da Imprensa', 404, 'Monte Castelo', 'Campo Grande', 'MS', '79002-290');
INSERT INTO endereco(rua, numero, bairro, cidade, estado, cep, complemento) VALUES ('Avenida Esbertalina Barbosa Damiani', 250, 'Guriri Norte', 'São Mateus', 'ES', '29946-490', 'Casa 01');
INSERT INTO endereco(rua, numero, bairro, cidade, estado, cep) VALUES ('Rua Cristiano Olsen', 123, 'Jardim Sumaré', 'Araçatuba', 'SP', '16015-244');
INSERT INTO endereco(rua, numero, bairro, cidade, estado, cep, complemento) VALUES ('Rua das Fiandeiras',125, 'Vila Olímpia', 'São Paulo','SP','78965-654', 'Casa');
INSERT INTO endereco(rua, numero, bairro, cidade, estado, cep) VALUES ('Rua dos Carijós', 369, 'Centro', 'Belo Horizonte', 'MG', '30120-060');
INSERT INTO endereco(rua, numero, bairro, cidade, estado, cep, complemento) VALUES ('Avenida Afonso Pena',636,'Boa Viagem','Belo Horizonte', 'MG','78965-520','Casa');
INSERT INTO endereco(rua, numero, bairro, cidade, estado, cep) VALUES ('Avenida Governador José Malcher', 784, 'Nazaré', 'Belém', 'PA', '66055-260');
INSERT INTO endereco(rua, numero, bairro, cidade, estado, cep, complemento) VALUES ('Rua Cândido Portinari',787, 'Real Parque','São José', 'SC','88113-350','Fundos');
INSERT INTO endereco(rua, numero, bairro, cidade, estado, cep, complemento) VALUES ('Avenida Esbertalina Barbosa Damiani', 621, 'Guriri Norte', 'São Mateus', 'ES','29946-490','Sala 23');
INSERT INTO endereco(rua, numero, bairro, cidade, estado, cep ) VALUES ('Rua Arlindo Nogueira', 333, 'Centro', 'Teresina','PI', '64000-290');
INSERT INTO endereco(rua, numero, bairro, cidade, estado, cep) VALUES ('Rua dos Carijós', 369, 'Centro', 'Belo Horizonte', 'MG', '30120-060');
INSERT INTO endereco(rua, numero, bairro, cidade, estado, cep, complemento) VALUES ('Avenida Afonso Pena',636,'Boa Viagem','Belo Horizonte', 'MG','78965-520','Casa');
INSERT INTO endereco(rua, numero, bairro, cidade, estado, cep) VALUES ('Avenida Governador José Malcher', 784, 'Nazaré', 'Belém', 'PA', '66055-260');
INSERT INTO endereco(rua, numero, bairro, cidade, estado, cep, complemento) VALUES ('Rua Cândido Portinari',787, 'Real Parque','São José', 'SC','88113-350','Fundos');
INSERT INTO endereco(rua, numero, bairro, cidade, estado, cep, complemento) VALUES ('Avenida Esbertalina Barbosa Damiani', 621, 'Guriri Norte', 'São Mateus', 'ES','29946-490','Sala 23');
INSERT INTO endereco(rua, numero, bairro, cidade, estado, cep ) VALUES ('Rua Arlindo Nogueira', 333, 'Centro', 'Teresina','PI', '64000-290');
INSERT INTO endereco(rua, numero, bairro, cidade, estado, cep) VALUES ('Rua dos Carijós', 369, 'Centro', 'Belo Horizonte', 'MG', '30120-060');
INSERT INTO endereco(rua, numero, bairro, cidade, estado, cep, complemento) VALUES ('Avenida Afonso Pena',636,'Boa Viagem','Belo Horizonte', 'MG','78965-520','Casa');
INSERT INTO endereco(rua, numero, bairro, cidade, estado, cep) VALUES ('Avenida Governador José Malcher', 784, 'Nazaré', 'Belém', 'PA', '66055-260');
INSERT INTO endereco(rua, numero, bairro, cidade, estado, cep, complemento) VALUES ('Rua Cândido Portinari',787, 'Real Parque','São José', 'SC','88113-350','Fundos');
INSERT INTO endereco(rua, numero, bairro, cidade, estado, cep, complemento) VALUES ('Avenida Esbertalina Barbosa Damiani', 621, 'Guriri Norte', 'São Mateus', 'ES','29946-490','Sala 23');
INSERT INTO endereco(rua, numero, bairro, cidade, estado, cep ) VALUES ('Rua Arlindo Nogueira', 333, 'Centro', 'Teresina','PI', '64000-290');



INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (1, 40000000, 35, 'Casa de luxo', 200, 'CASA') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (2, 1000.00, 20, 'Kitnet Simples', 45, 'CASA') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (3, 2000.00, 40, 'Apartamento no centro', 60, 'APARTAMENTO') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (4, 400000.00, 35, 'Casa em vila', 94, 'CASA') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (5, 1000000.00, 10, 'Casa no dhama vilage',87, 'CASA') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (6, 500000.00, 9, 'Apartamento no centro',45, 'APARTAMENTO') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (7, 50000.00, 20, 'Terreno plano', 60, 'TERRENO') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (8, 198000.00, 60, 'Casa simples', 78, 'CASA') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (9, 6000.00, 55, 'Sala comercial', 25, 'COMERCIAL') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (10,2500000.00, 10, 'Apartamento beiramar', 85, 'APARTAMENTO') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (15,450000.00, 10, 'Casa no centro', 75, 'CASA') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (16,2500.00, 40, 'Salão Comercial', 30, 'COMERCIAL') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (17,650.00, 20, 'Kitnet', 40, 'CASA') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (18,10000.00, 16, 'Galpão', 60, 'COMERCIAL') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (19,45000.00, 13, 'Terreno com declive', 45, 'TERRENO') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (1, 40000000, 35, 'Casa de luxo', 200, 'CASA') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (2, 1000.00, 20, 'Kitnet Simples', 45, 'CASA') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (3, 2000.00, 40, 'Apartamento no centro', 60, 'APARTAMENTO') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (4, 400000.00, 35, 'Casa em vila', 94, 'CASA') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (5, 1000000.00, 10, 'Casa no dhama vilage',87, 'CASA') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (6, 500000.00, 90, 'Apartamento no centro',45, 'APARTAMENTO') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (7, 50000.00, 20, 'Terreno plano', 60, 'TERRENO') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (8, 198000.00, 60, 'Casa simples', 78, 'CASA') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (9, 6000.00, 55, 'Sala comercial', 25, 'COMERCIAL') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (10,2500000.00, 10, 'Apartamento beiramar', 85, 'APARTAMENTO') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (15,450000.00, 10, 'Casa no centro', 75, 'CASA') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (16,2500.00, 40, 'Salão Comercial', 30, 'COMERCIAL') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (17,650.00, 20, 'Kitnet', 40, 'CASA') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (18,10000.00, 16, 'Galpão', 60, 'COMERCIAL') ;
INSERT INTO imovel(id_endereco, valor_sugerido, valor_repasse_imobiliaria, descricao, area, imovel_tipo) VALUES (19,45000.00, 13, 'Terreno com declive', 45, 'TERRENO') ;


INSERT INTO quartos(quantidade_quarto, quantidade_suite, quantidade_sala_estar, quantidade_sala_jantar, numero_vagas_garagem, armario_embutido) VALUES (3,1,1,1,1,false) ;
INSERT INTO quartos(quantidade_quarto, quantidade_suite, quantidade_sala_estar, quantidade_sala_jantar, numero_vagas_garagem, armario_embutido) VALUES (2,1,1,1,2,true) ;
INSERT INTO quartos(quantidade_quarto, quantidade_suite, quantidade_sala_estar, quantidade_sala_jantar, numero_vagas_garagem, armario_embutido) VALUES (4,2,2,2,5,true) ;
INSERT INTO quartos(quantidade_quarto, quantidade_suite, quantidade_sala_estar, quantidade_sala_jantar, numero_vagas_garagem, armario_embutido) VALUES (2,1,1,1,1,false) ;


INSERT INTO casa(id_imoveL, id_quartos, data_construcao) VALUES(27,3, '01-05-1999') ;
INSERT INTO casa(id_imoveL, id_quartos, data_construcao) VALUES(1,1, '01-10-2001') ;
INSERT INTO casa(id_imoveL, id_quartos, data_construcao) VALUES(2,2, '05-10-2015') ;
INSERT INTO casa(id_imoveL, id_quartos, data_construcao) VALUES(4,4, '11-12-2014') ;
INSERT INTO casa(id_imoveL, id_quartos, data_construcao) VALUES(5,2, '03-11-2011') ;
INSERT INTO casa(id_imoveL, id_quartos, data_construcao) VALUES(8,1, '01-12-2018') ;
INSERT INTO casa(id_imoveL, id_quartos, data_construcao) VALUES(11,1, '01-05-2019') ;


INSERT INTO apartamento(id_imovel, id_quartos, andar, valor_condominio, possui_porteiro) VALUES (3,1,'1', 300.00,true);
INSERT INTO apartamento(id_imovel, id_quartos, andar, valor_condominio, possui_porteiro) VALUES (6,2,'Terreo',200.00,false);
INSERT INTO apartamento(id_imovel, id_quartos, andar, valor_condominio, possui_porteiro) VALUES (10,3,'Cobertura',500.00,false);


INSERT INTO terreno(id_imovel,largura,comprimento,topologia) VALUES (7,10,20,'Nenhum');
INSERT INTO terreno(id_imovel,largura,comprimento,topologia) VALUES (15,20,30, 'Aclive');


INSERT INTO comercial(id_imovel, quantidade_banheiro, quantidade_quartos, data_construcao) VALUES (9,1,2,'05-12-2015') ;
INSERT INTO comercial(id_imovel, quantidade_banheiro, quantidade_quartos, data_construcao) VALUES (12,2,3, '06-05-2018') ;
INSERT INTO comercial(id_imovel, quantidade_banheiro, quantidade_quartos, data_construcao) VALUES (14,1,1,'11-12-2013') ;


INSERT INTO cliente_proprietario(id_pessoa, id_imovel) VALUES ('96325874125', 1);
INSERT INTO cliente_proprietario(id_pessoa, id_imovel) VALUES ('41383062854', 2);
INSERT INTO cliente_proprietario(id_pessoa, id_imovel) VALUES ('96325874102',3);
INSERT INTO cliente_proprietario(id_pessoa, id_imovel) VALUES ('11298765326',4);
INSERT INTO cliente_proprietario(id_pessoa, id_imovel) VALUES ('11298765326',5);
INSERT INTO cliente_proprietario(id_pessoa, id_imovel) VALUES ('96325874125',6);
INSERT INTO cliente_proprietario(id_pessoa, id_imovel) VALUES ('41383062854', 7);
INSERT INTO cliente_proprietario(id_pessoa, id_imovel) VALUES ('96325874102', 8);
INSERT INTO cliente_proprietario(id_pessoa, id_imovel) VALUES ('11298765326',9);
INSERT INTO cliente_proprietario(id_pessoa, id_imovel) VALUES ('96325874125',10);
INSERT INTO cliente_proprietario(id_pessoa, id_imovel) VALUES ('41383062854', 12);
INSERT INTO cliente_proprietario(id_pessoa, id_imovel) VALUES ('96325874102', 13);
INSERT INTO cliente_proprietario(id_pessoa, id_imovel) VALUES ('11298765326',14);
INSERT INTO cliente_proprietario(id_pessoa, id_imovel) VALUES ('41383062854',15);
INSERT INTO cliente_proprietario(id_pessoa, id_imovel) VALUES ('41383062854', 16);
INSERT INTO cliente_proprietario(id_pessoa, id_imovel) VALUES ('96325874125', 17);
INSERT INTO cliente_proprietario(id_pessoa, id_imovel) VALUES ('66984412365',18);
INSERT INTO cliente_proprietario(id_pessoa, id_imovel) VALUES ('78965412358',19);
INSERT INTO cliente_proprietario(id_pessoa, id_imovel) VALUES ('41383062854', 20);
INSERT INTO cliente_proprietario(id_pessoa, id_imovel) VALUES ('96325874102', 21);


INSERT INTO forma_pagamento(descricao) VALUES ('Cartão de crédito');
INSERT INTO forma_pagamento(descricao) VALUES ('Dinheiro');
INSERT INTO forma_pagamento(descricao) VALUES ('Débito em conta');
INSERT INTO forma_pagamento(descricao) VALUES ('Financiamento');

INSERT INTO transacao(id_cliente_funcionario,id_imovel, id_cliente_proprietario, id_cliente_usuario, id_forma_pagamento, valor_comissao,valor, data_transacao, tipo) VALUES('41383062854', 1, '96325874125', '36985214795', 2, 10000.00, 20000000.00 , now(), 'VENDA');
INSERT INTO transacao(id_cliente_funcionario,id_imovel, id_cliente_proprietario, id_cliente_usuario, id_forma_pagamento, valor_comissao,valor, data_transacao, tipo) VALUES('96325874102', 2 , '41383062854', '41383062854', 3 , 1230.00 , 100000.00 ,  '01-01-2011', 'VENDA');
INSERT INTO transacao(id_cliente_funcionario,id_imovel, id_cliente_proprietario, id_cliente_usuario, id_forma_pagamento, valor_comissao,valor, data_transacao, tipo) VALUES('96325874125', 3 , '96325874102', '96325874125', 4 , 342.00 , 4900.00 ,  '01-02-2011', 'VENDA');
INSERT INTO transacao(id_cliente_funcionario,id_imovel, id_cliente_proprietario, id_cliente_usuario, id_forma_pagamento, valor_comissao,valor, data_transacao, tipo) VALUES('66984412365', 4 , '11298765326', '66984412365', 1 , 489.00 , 2212000.00 ,  '02-03-2012', 'VENDA');
INSERT INTO transacao(id_cliente_funcionario,id_imovel, id_cliente_proprietario, id_cliente_usuario, id_forma_pagamento, valor_comissao,valor, data_transacao, tipo) VALUES('74125896333', 5 , '11298765326', '32165478943', 3 , 291.00 , 750000.00 ,  '03-04-2019', 'ALUGUEL');
INSERT INTO transacao(id_cliente_funcionario,id_imovel, id_cliente_proprietario, id_cliente_usuario, id_forma_pagamento, valor_comissao,valor, data_transacao, tipo) VALUES('11298765326', 6 , '96325874125', '36985214795', 2 , 381.00 , 12330.00 ,  '04-05-2019', 'ALUGUEL');
INSERT INTO transacao(id_cliente_funcionario,id_imovel, id_cliente_proprietario, id_cliente_usuario, id_forma_pagamento, valor_comissao,valor, data_transacao, tipo) VALUES('74125896333', 7 , '41383062854', '12345678910', 1 , 442.65 , 291930.00 ,  '11-11-2018', 'VENDA');
INSERT INTO transacao(id_cliente_funcionario,id_imovel, id_cliente_proprietario, id_cliente_usuario, id_forma_pagamento, valor_comissao,valor, data_transacao, tipo) VALUES('78965412358', 8 , '96325874102', '98765432101', 1 , 340.23 , 21233210.00 ,  '01-02-2003', 'ALUGUEL');
INSERT INTO transacao(id_cliente_funcionario,id_imovel, id_cliente_proprietario, id_cliente_usuario, id_forma_pagamento, valor_comissao,valor, data_transacao, tipo) VALUES('96325874102', 9 , '11298765326', '75315982462', 1 , 2340.29 , 9000000.00 ,  '02-01-2003', 'VENDA');
INSERT INTO transacao(id_cliente_funcionario,id_imovel, id_cliente_proprietario, id_cliente_usuario, id_forma_pagamento, valor_comissao,valor, data_transacao, tipo) VALUES('96325874125', 10 , '96325874125', '96325874102', 4 , 9213.00 , 777640.00 ,  '12-09-2018', 'VENDA');
INSERT INTO transacao(id_cliente_funcionario,id_imovel, id_cliente_proprietario, id_cliente_usuario, id_forma_pagamento, valor_comissao,valor, data_transacao, tipo) VALUES('66984412365', 19 , '78965412358', '78965412358', 4 , 10231.00 , 9089820.00 ,  '11-06-2017', 'ALUGUEL');
INSERT INTO transacao(id_cliente_funcionario,id_imovel, id_cliente_proprietario, id_cliente_usuario, id_forma_pagamento, valor_comissao,valor, data_transacao, tipo) VALUES('74125896333', 12 , '41383062854', '98765432101', 4 , 23410.12 , 9304201.00 ,  '12-02-2019', 'ALUGUEL');
INSERT INTO transacao(id_cliente_funcionario,id_imovel, id_cliente_proprietario, id_cliente_usuario, id_forma_pagamento, valor_comissao,valor, data_transacao, tipo) VALUES('11298765326', 13 , '96325874102', '32165478943', 2 , 9853.00 , 232910.00 ,  '09-08-2018', 'VENDA');
INSERT INTO transacao(id_cliente_funcionario,id_imovel, id_cliente_proprietario, id_cliente_usuario, id_forma_pagamento, valor_comissao,valor, data_transacao, tipo) VALUES('74125896333', 14 , '11298765326', '66984412365', 3 , 20030.00 , 9943020.00 ,  '04-05-2016', 'ALUGUEL');
INSERT INTO transacao(id_cliente_funcionario,id_imovel, id_cliente_proprietario, id_cliente_usuario, id_forma_pagamento, valor_comissao,valor, data_transacao, tipo) VALUES('78965412358', 15 , '41383062854', '96325874125', 3 , 20123.21 , 4000000.00 ,  '05-04-2016', 'VENDA');

INSERT INTO avaliacao(id_cliente_usuario, id_imovel, nota_questao_1, nota_questao_2, nota_questao_3, nota_questao_4, nota_questao_5) VALUES ('96325874125', 1, 3, 1, 2, 1, 2) ;
INSERT INTO avaliacao(id_cliente_usuario, id_imovel, nota_questao_1, nota_questao_2, nota_questao_3, nota_questao_4, nota_questao_5) VALUES ('96325874125', 2, 1, 1, 2, 5, 3) ;
INSERT INTO avaliacao(id_cliente_usuario, id_imovel, nota_questao_1, nota_questao_2, nota_questao_3, nota_questao_4, nota_questao_5) VALUES ('96325874125', 3, 2, 1, 2, 4, 4) ;
INSERT INTO avaliacao(id_cliente_usuario, id_imovel, nota_questao_1, nota_questao_2, nota_questao_3, nota_questao_4, nota_questao_5) VALUES ('96325874125', 4, 3, 5, 3, 3, 5) ;
INSERT INTO avaliacao(id_cliente_usuario, id_imovel, nota_questao_1, nota_questao_2, nota_questao_3, nota_questao_4, nota_questao_5) VALUES ('96325874125', 5, 4, 5, 3, 2, 4) ;
INSERT INTO avaliacao(id_cliente_usuario, id_imovel, nota_questao_1, nota_questao_2, nota_questao_3, nota_questao_4, nota_questao_5) VALUES ('96325874125', 6, 5, 5, 3, 1, 2) ;
INSERT INTO avaliacao(id_cliente_usuario, id_imovel, nota_questao_1, nota_questao_2, nota_questao_3, nota_questao_4, nota_questao_5) VALUES ('96325874125', 7, 4, 4, 4, 5, 3) ;
INSERT INTO avaliacao(id_cliente_usuario, id_imovel, nota_questao_1, nota_questao_2, nota_questao_3, nota_questao_4, nota_questao_5) VALUES ('96325874125', 8, 3, 4, 5, 4, 4) ;
INSERT INTO avaliacao(id_cliente_usuario, id_imovel, nota_questao_1, nota_questao_2, nota_questao_3, nota_questao_4, nota_questao_5) VALUES ('96325874125', 9, 2, 3, 4, 3, 5) ;
INSERT INTO avaliacao(id_cliente_usuario, id_imovel, nota_questao_1, nota_questao_2, nota_questao_3, nota_questao_4, nota_questao_5) VALUES ('96325874125', 10, 1, 2, 5, 2, 2) ;
INSERT INTO avaliacao(id_cliente_usuario, id_imovel, nota_questao_1, nota_questao_2, nota_questao_3, nota_questao_4, nota_questao_5) VALUES ('96325874125', 12, 1, 2, 5, 1, 1) ;
INSERT INTO avaliacao(id_cliente_usuario, id_imovel, nota_questao_1, nota_questao_2, nota_questao_3, nota_questao_4, nota_questao_5) VALUES ('96325874125', 13, 3, 1, 2, 1, 2) ;
INSERT INTO avaliacao(id_cliente_usuario, id_imovel, nota_questao_1, nota_questao_2, nota_questao_3, nota_questao_4, nota_questao_5) VALUES ('96325874125', 2, 1, 1, 2, 5, 3) ;
INSERT INTO avaliacao(id_cliente_usuario, id_imovel, nota_questao_1, nota_questao_2, nota_questao_3, nota_questao_4, nota_questao_5) VALUES ('96325874125', 2, 2, 1, 2, 4, 4) ;
INSERT INTO avaliacao(id_cliente_usuario, id_imovel, nota_questao_1, nota_questao_2, nota_questao_3, nota_questao_4, nota_questao_5) VALUES ('96325874125', 3, 3, 5, 3, 3, 5) ;
INSERT INTO avaliacao(id_cliente_usuario, id_imovel, nota_questao_1, nota_questao_2, nota_questao_3, nota_questao_4, nota_questao_5) VALUES ('96325874125', 4, 4, 5, 3, 2, 4) ;
INSERT INTO avaliacao(id_cliente_usuario, id_imovel, nota_questao_1, nota_questao_2, nota_questao_3, nota_questao_4, nota_questao_5) VALUES ('96325874125', 5, 5, 5, 3, 1, 2) ;
INSERT INTO avaliacao(id_cliente_usuario, id_imovel, nota_questao_1, nota_questao_2, nota_questao_3, nota_questao_4, nota_questao_5) VALUES ('96325874125', 1, 4, 4, 4, 5, 3) ;
INSERT INTO avaliacao(id_cliente_usuario, id_imovel, nota_questao_1, nota_questao_2, nota_questao_3, nota_questao_4, nota_questao_5) VALUES ('96325874125', 15, 3, 4, 5, 4, 4) ;
INSERT INTO avaliacao(id_cliente_usuario, id_imovel, nota_questao_1, nota_questao_2, nota_questao_3, nota_questao_4, nota_questao_5) VALUES ('96325874125', 19, 2, 3, 4, 3, 5) ;
INSERT INTO avaliacao(id_cliente_usuario, id_imovel, nota_questao_1, nota_questao_2, nota_questao_3, nota_questao_4, nota_questao_5) VALUES ('96325874125', 2, 1, 2, 5, 2, 2) ;
INSERT INTO avaliacao(id_cliente_usuario, id_imovel, nota_questao_1, nota_questao_2, nota_questao_3, nota_questao_4, nota_questao_5) VALUES ('96325874125', 1, 1, 2, 1, 1, 1) ;

