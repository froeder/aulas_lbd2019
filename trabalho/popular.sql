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

INSERT INTO fiador(id_cliente, id_pessoa) VALUES ('41383062854', '78965412358');
INSERT INTO fiador(id_cliente, id_pessoa) VALUES ('41383062854', '66984412365');
INSERT INTO fiador(id_cliente, id_pessoa) VALUES ('96325874125', '11298765326');
INSERT INTO fiador(id_cliente, id_pessoa) VALUES ('96325874125', '74125896333');
INSERT INTO fiador(id_cliente, id_pessoa) VALUES ('66984412365', '96325874125');
INSERT INTO fiador(id_cliente, id_pessoa) VALUES ('66984412365', '32165478943');
INSERT INTO fiador(id_cliente, id_pessoa) VALUES ('36985214795', '75315982462');
INSERT INTO fiador(id_cliente, id_pessoa) VALUES ('36985214795', '78965412358');

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

INSERT INTO imovel(id_endereco, disponivel, disponivel_tipo, valor_sugerido, valor_real, valor_repassse_imobiliaria, descricao, area, imovel_tipo) VALUES (1, true, 'VENDA',40000000,35000000, 35000, 'Casa de luxo', 200, 'CASA') ;
INSERT INTO imovel(id_endereco, disponivel, disponivel_tipo, valor_sugerido, valor_real, valor_repassse_imobiliaria, descricao, area, imovel_tipo) VALUES (2, false,'ALUGUEL', 1000.00, 900.00, 200.00, 'Kitnet Simples', 45, 'CASA') ;
INSERT INTO imovel(id_endereco, disponivel, disponivel_tipo, valor_sugerido, valor_real, valor_repassse_imobiliaria, descricao, area, imovel_tipo) VALUES (3, false,'ALUGUEL', 2000.00, 2000.00, 400.00, 'Apartamento no centro', 60, 'APARTAMENTO') ;
INSERT INTO imovel(id_endereco, disponivel, disponivel_tipo, valor_sugerido, valor_real, valor_repassse_imobiliaria, descricao, area, imovel_tipo) VALUES (4, true, 'VENDA',400000.00, 350000.00, 3500.00, 'Casa em vila', 94, 'CASA') ;
INSERT INTO imovel(id_endereco, disponivel, disponivel_tipo, valor_sugerido, valor_real, valor_repassse_imobiliaria, descricao, area, imovel_tipo) VALUES (5, true, 'VENDA',1000000.00, 1200000.00, 10000.00, 'Casa no dhama vilage',87, 'CASA') ;
INSERT INTO imovel(id_endereco, disponivel, disponivel_tipo, valor_sugerido, valor_real, valor_repassse_imobiliaria, descricao, area, imovel_tipo) VALUES (6, true, 'VENDA',500000.00, 600000.00, 90000.00, 'Apartamento no centro',45, 'APARTAMENTO') ;
INSERT INTO imovel(id_endereco, disponivel, disponivel_tipo, valor_sugerido, valor_real, valor_repassse_imobiliaria, descricao, area, imovel_tipo) VALUES (7, true, 'VENDA',50000.00, 90000.00, 20000.00, 'Terreno plano', 60, 'TERRENO') ;
INSERT INTO imovel(id_endereco, disponivel, disponivel_tipo, valor_sugerido, valor_real, valor_repassse_imobiliaria, descricao, area, imovel_tipo) VALUES (8, false, 'VENDA',198000.00, 250000.00, 60000.00, 'Casa simples', 78, 'CASA') ;
INSERT INTO imovel(id_endereco, disponivel, disponivel_tipo, valor_sugerido, valor_real, valor_repassse_imobiliaria, descricao, area, imovel_tipo) VALUES (9, true, 'ALUGUEL',6000.00, 5500.00, 550.00, 'Sala comercial', 25, 'COMERCIAL') ;
INSERT INTO imovel(id_endereco, disponivel, disponivel_tipo, valor_sugerido, valor_real, valor_repassse_imobiliaria, descricao, area, imovel_tipo) VALUES (10, false, 'VENDA',2500000.00, 3000000.00, 1000000.00, 'Apartamento beiramar', 85, 'APARTAMENTO') ;
INSERT INTO imovel(id_endereco, disponivel, disponivel_tipo, valor_sugerido, valor_real, valor_repassse_imobiliaria, descricao, area, imovel_tipo) VALUES (15, true, 'VENDA', 450000.00, 400000.00, 10000.00, 'Casa no centro', 75, 'CASA') ;
INSERT INTO imovel(id_endereco, disponivel, disponivel_tipo, valor_sugerido, valor_real, valor_repassse_imobiliaria, descricao, area, imovel_tipo) VALUES (16, true, 'ALUGUEL',2500.00, 2000.00, 400.00, 'Salão Comercial', 30, 'COMERCIAL') ;
INSERT INTO imovel(id_endereco, disponivel, disponivel_tipo, valor_sugerido, valor_real, valor_repassse_imobiliaria, descricao, area, imovel_tipo) VALUES (17, true, 'ALUGUEL',650.00, 750.00, 200.00, 'Kitnet', 40, 'CASA') ;
INSERT INTO imovel(id_endereco, disponivel, disponivel_tipo, valor_sugerido, valor_real, valor_repassse_imobiliaria, descricao, area, imovel_tipo) VALUES (18, true, 'ALUGUEL',10000.00, 8000.00, 1600.00, 'Galpão', 60, 'COMERCIAL') ;
INSERT INTO imovel(id_endereco, disponivel, disponivel_tipo, valor_sugerido, valor_real, valor_repassse_imobiliaria, descricao, area, imovel_tipo) VALUES (19, true, 'VENDA',45000.00, 56000.00, 13000.00, 'Terreno com declive', 45, 'TERRENO') ;

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

INSERT INTO forma_pagamento(descricao) VALUES ('Cartão de crédito');
INSERT INTO forma_pagamento(descricao) VALUES ('Dinheiro');
INSERT INTO forma_pagamento(descricao) VALUES ('Débito em conta');
INSERT INTO forma_pagamento(descricao) VALUES ('Financiamento');

INSERT INTO transacao(id_cliente_funcionario,id_imovel, id_cliente_proprietario, id_cliente_usuario, id_forma_pagamento, valor_comissao, data_transacao) VALUES( '41383062854' , 1, '96325874125','41383062854' ,1 , ,);
INSERT INTO transacao(id_cliente_funcionario,id_imovel, id_cliente_proprietario, id_cliente_usuario, id_forma_pagamento, valor_comissao, data_transacao) VALUES( '78965412358' , 2, '41383062854','96325874125' ,2 , ,);
INSERT INTO transacao(id_cliente_funcionario,id_imovel, id_cliente_proprietario, id_cliente_usuario, id_forma_pagamento, valor_comissao, data_transacao) VALUES( '11298765326' , 3, '96325874102','66984412365',3 , ,);
INSERT INTO transacao(id_cliente_funcionario,id_imovel, id_cliente_proprietario, id_cliente_usuario, id_forma_pagamento, valor_comissao, data_transacao) VALUES( '96325874125' , 4, '11298765326','32165478943', 4, ,);
INSERT INTO transacao(id_cliente_funcionario,id_imovel, id_cliente_proprietario, id_cliente_usuario, id_forma_pagamento, valor_comissao, data_transacao) VALUES( '96325874102' , 5, '11298765326','36985214795', 4, ,);
INSERT INTO transacao(id_cliente_funcionario,id_imovel, id_cliente_proprietario, id_cliente_usuario, id_forma_pagamento, valor_comissao, data_transacao) VALUES( '11298765326' , 6, '96325874125','32165478943' ,3 , ,);
INSERT INTO transacao(id_cliente_funcionario,id_imovel, id_cliente_proprietario, id_cliente_usuario, id_forma_pagamento, valor_comissao, data_transacao) VALUES( '74125896333' , 7, '41383062854','36985214795' , 2, ,);
INSERT INTO transacao(id_cliente_funcionario,id_imovel, id_cliente_proprietario, id_cliente_usuario, id_forma_pagamento, valor_comissao, data_transacao) VALUES( '96325874125' , 8, '96325874102','41383062854' , 1, ,);