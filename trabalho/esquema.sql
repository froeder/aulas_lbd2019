CREATE TABLE endereco(
    id SERIAL PRIMARY KEY, 
    rua VARCHAR(255) NOT NULL,
    numero VARCHAR(10) NOT NULL,   
    bairro VARCHAR(30) NOT NULL, 
    cidade VARCHAR(30) NOT NULL, 
    estado VARCHAR(20) NOT NULL, 
    cep VARCHAR(20) NOT NULL, 
    complemento VARCHAR(128)
);

CREATE TABLE pessoa(
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    sexo VARCHAR(1) NOT NULL,
    estado_civil VARCHAR(15) NOT NULL,
    profissao VARCHAR(100) NOT NULL,
    CHECK (sexo IN('M', 'F'))
);

CREATE TABLE cargo(
    id SERIAL PRIMARY KEY, 
    descricao VARCHAR(255) NOT NULL, 
    salario_base NUMERIC(20,2) NOT NULL
);

CREATE TABLE cliente_funcionario(
    id_pessoa VARCHAR(11) PRIMARY KEY,
    id_cargo INTEGER NOT NULL,
    login VARCHAR(255) NOT NULL,
    senha VARCHAR(128) NOT NULL,
    data_ingresso_imobiliaria DATE NOT NULL,
    salario NUMERIC(10,2) ,
    CONSTRAINT fk_cpf FOREIGN KEY (id_pessoa) REFERENCES pessoa (cpf),
    CONSTRAINT fk_cargo FOREIGN KEY (id_cargo) REFERENCES cargo (id)
);


CREATE TABLE imovel(
    id SERIAL PRIMARY KEY,
    id_endereco INTEGER NOT NULL, 
    disponivel BOOLEAN,
    disponivel_tipo VARCHAR(10),
    valor_sugerido NUMERIC(10,2) NOT NULL, 
    valor_real NUMERIC(10,2) ,
    valor_repasse_imobiliaria NUMERIC(10,2),
    descricao VARCHAR(255),
    area NUMERIC(10,2) NOT NULL,
    avaliacao NUMERIC(10,2),
    imovel_tipo VARCHAR(20) NOT NULL,
    CONSTRAINT fk_endereco FOREIGN KEY (id_endereco) REFERENCES endereco(id)
);

CREATE TABLE cliente_proprietario(
    id_pessoa VARCHAR(11)NOT NULL,
    id_imovel INTEGER NOT NULL,
    CONSTRAINT fk_cpf FOREIGN KEY (id_pessoa) REFERENCES pessoa (cpf),
    CONSTRAINT fk_imovel FOREIGN KEY (id_imovel) REFERENCES imovel(id),
    PRIMARY KEY (id_pessoa, id_imovel)
);
-- COMENTAR sobre

CREATE TABLE cliente_usuario(
    id_pessoa VARCHAR(11) PRIMARY KEY,
    CONSTRAINT fk_cpf FOREIGN KEY (id_pessoa) REFERENCES pessoa (cpf)
);

CREATE TABLE telefone(
    id SERIAL PRIMARY KEY, 
    id_cliente_usuario VARCHAR(11) NOT NULL,
    telefone VARCHAR(100) NOT NULL, 
    telefone_tipo VARCHAR(15) NOT NULL,
    CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente_usuario) REFERENCES cliente_usuario (id_pessoa)
);

CREATE TABLE fiador(
    id_cliente VARCHAR(11) NOT NULL, 
    id_pessoa VARCHAR(11) NOT NULL,
    CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente_usuario (id_pessoa),
    CONSTRAINT fk_id_pessoa FOREIGN KEY (id_pessoa) REFERENCES pessoa (cpf),
    PRIMARY KEY (id_pessoa, id_cliente)
);

CREATE TABLE indicacao(
    id_cliente VARCHAR(11) NOT NULL, 
    id_pessoa VARCHAR(11) NOT NULL,
    CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente_usuario (id_pessoa),
    CONSTRAINT fk_id_pessoa FOREIGN KEY (id_pessoa) REFERENCES pessoa (cpf),
    PRIMARY KEY (id_pessoa, id_cliente)
);


CREATE TABLE foto(
    id SERIAL PRIMARY KEY,
    id_imovel INTEGER NOT NULL,
    caminho VARCHAR(255) NOT NULL,
    CONSTRAINT fk_imovel FOREIGN KEY (id_imovel) REFERENCES imovel (id)
);

CREATE TABLE quartos(
    id SERIAL PRIMARY KEY, 
    quantidade_quarto INTEGER NOT NULL,
    quantidade_suite INTEGER NOT NULL,
    quantidade_sala_estar INTEGER NOT NULL,
    quantidade_sala_jantar INTEGER NOT NULL,
    numero_vagas_garagem INTEGER NOT NULL, 
    armario_embutido BOOLEAN NOT NULL
);

CREATE TABLE casa(
    id SERIAL PRIMARY KEY,
    id_imovel INTEGER NOT NULL,
    id_quartos INTEGER NOT NULL,
    data_construcao DATE NOT NULL,
    CONSTRAINT fk_imovel FOREIGN KEY (id_imovel) REFERENCES imovel (id),
    CONSTRAINT fk_quartos FOREIGN KEY (id_quartos) REFERENCES quartos (id)
);

CREATE TABLE apartamento(
    id SERIAL PRIMARY KEY,
    id_imovel INTEGER NOT NULL,
    id_quartos INTEGER NOT NULL,
    data_construcao DATE NOT NULL,
    andar VARCHAR(10) NOT NULL,
    valor_condominio NUMERIC(10,2) NOT NULL,
    possui_porteiro BOOLEAN NOT NULL, 
    CONSTRAINT fk_imovel FOREIGN KEY (id_imovel) REFERENCES imovel (id),
    CONSTRAINT fk_quartos FOREIGN KEY (id_quartos) REFERENCES quartos (id)
);

CREATE TABLE terreno(
    id SERIAL PRIMARY KEY,
    id_imovel INTEGER NOT NULL,
    largura NUMERIC(10,2) NOT NULL,
    comprimento NUMERIC(10,2) NOT NULL,
    topologia VARCHAR(15) NOT NULL,
    CONSTRAINT fk_imovel FOREIGN KEY (id_imovel) REFERENCES imovel (id)
);

CREATE TABLE comercial(
    id SERIAL PRIMARY KEY,
    id_imovel INTEGER NOT NULL,
    quantidade_banheiro INTEGER NOT NULL,
    quantidade_quartos INTEGER NOT NULL,
    data_construcao DATE NOT NULL,
    CONSTRAINT fk_imovel FOREIGN KEY (id_imovel) REFERENCES imovel (id)
) ;

CREATE TABLE forma_pagamento(
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
) ;

CREATE TABLE transacao(
    id_numero_contrato SERIAL PRIMARY KEY,
    id_cliente_funcionario VARCHAR(11) NOT NULL,
    id_imovel INTEGER NOT NULL,
    id_cliente_proprietario VARCHAR(11) NOT NULL,
    id_cliente_usuario VARCHAR(11) NOT NULL,
    id_forma_pagamento INTEGER NOT NULL,
    valor_comissao NUMERIC(10,2) NOT NULL,
    valor_repasse_imobiliaria NUMERIC(10,2),
    valor NUMERIC(10,2) NOT NULL, 
    data_transacao DATE NOT NULL,
    tipo VARCHAR(10) NOT NULL,
    CHECK (tipo IN('VENDA', 'ALUGUEL')),
    CONSTRAINT fk_id_cliente_funcionario FOREIGN KEY(id_cliente_funcionario) REFERENCES  cliente_funcionario(id_pessoa),
    CONSTRAINT fk_id_imovel FOREIGN KEY(id_imovel) REFERENCES  imovel(id),
    CONSTRAINT fk_id_cliente_proprietario FOREIGN KEY(id_cliente_proprietario, id_imovel) REFERENCES  cliente_proprietario(id_pessoa, id_imovel),
    CONSTRAINT fk_id_cliente_usuario FOREIGN KEY(id_cliente_usuario) REFERENCES  cliente_usuario(id_pessoa),
    CONSTRAINT fk_id_forma_pagamento FOREIGN KEY(id_forma_pagamento) REFERENCES  forma_pagamento(id)
);

CREATE TABLE comissao(
    id SERIAL PRIMARY KEY, 
    id_cliente_funcionario VARCHAR(11) NOT NULL, 
    id_transacao INTEGER NOT NULL,
    mes VARCHAR(15) NOT NULL,
    valor NUMERIC(10,2) NOT NULL,
    CONSTRAINT fk_id_cliente_funcionario FOREIGN KEY (id_cliente_funcionario) references cliente_funcionario(id_pessoa),
    CONSTRAINT fk_id_transacao FOREIGN KEY (id_transacao) references transacao(id_numero_contrato)
);

CREATE TABLE historico_imovel(
    id SERIAL PRIMARY KEY, 
    id_imovel INTEGER NOT NULL, 
    id_cliente_funcionario VARCHAR(11) NOT  NULL, 
    data_colocado DATE , 
    data_alteracao DATE, 
    CONSTRAINT fk_id_imovel FOREIGN KEY (id_imovel) REFERENCES imovel(id),
    CONSTRAINT fk_id_cliente_funcionario FOREIGN KEY (id_cliente_funcionario) REFERENCES cliente_funcionario(id_pessoa)
);

CREATE TABLE avaliacao(
    id SERIAL PRIMARY KEY,
    id_cliente_usuario VARCHAR(11) NOT NULL,
    id_imovel INTEGER NOT NULL,
    nota_questao_1 NUMERIC(10,2) NOT NULL CHECK(nota_questao_1 >= 1 AND nota_questao_1 <= 5),
    nota_questao_2 NUMERIC(10,2) NOT NULL CHECK(nota_questao_2 >= 1 AND nota_questao_2 <= 5),
    nota_questao_3 NUMERIC(10,2) NOT NULL CHECK(nota_questao_3 >= 1 AND nota_questao_3 <= 5),
    nota_questao_4 NUMERIC(10,2) NOT NULL CHECK(nota_questao_4 >= 1 AND nota_questao_4 <= 5),
    nota_questao_5 NUMERIC(10,2) NOT NULL CHECK(nota_questao_5 >= 1 AND nota_questao_5 <= 5),
    media NUMERIC(10, 2) ,
    CONSTRAINT fk_id_cliente_usuario FOREIGN KEY (id_cliente_usuario) REFERENCES cliente_usuario(id_pessoa),
    CONSTRAINT fk_id_imovel FOREIGN KEY (id_imovel) REFERENCES imovel(id)
);


-- Triggers para atender alguns requisitos

-- Para atribuir o salario do funcionario pelo id
CREATE OR REPLACE FUNCTION fn_atribui_salario() RETURNS TRIGGER AS $$
DECLARE salario_temp REAL := 0.0 ;
BEGIN 
    SELECT INTO salario_temp salario_base FROM cargo where id = new.id_cargo ;
 	UPDATE cliente_funcionario SET salario = salario_temp WHERE id_pessoa = NEW.id_pessoa ;
    RETURN NEW ;
END ;

$$ language 'plpgsql' ;

CREATE TRIGGER tr_atribui_salario
AFTER INSERT ON cliente_funcionario
FOR EACH ROW
EXECUTE PROCEDURE fn_atribui_salario() ;


-- Para atualizar o salario para cada transacao do funcionario
CREATE OR REPLACE FUNCTION fn_atualiza_salario() RETURNS TRIGGER AS $$
BEGIN 
    UPDATE cliente_funcionario SET salario = salario + NEW.valor_comissao WHERE id_pessoa = NEW.id_cliente_funcionario;
    RETURN NEW ;
END ;
$$ language 'plpgsql';

CREATE TRIGGER tr_atualiza_salario 
AFTER INSERT OR UPDATE ON transacao 
FOR EACH ROW
EXECUTE PROCEDURE fn_atualiza_salario() ;


-- Para atualizar o valor real do imovel

CREATE OR REPLACE FUNCTION fn_atualizar_valor_imovel() RETURNS TRIGGER AS $$
BEGIN 
    UPDATE imovel SET valor_real = new.valor WHERE id = new.id_imovel ;
    RETURN NEW ;
END;

$$language 'plpgsql' ;

CREATE TRIGGER tr_atualiza_valor_imovel
AFTER INSERT OR UPDATE ON transacao
FOR EACH ROW
EXECUTE PROCEDURE fn_atualizar_valor_imovel() ;

-- PARA CRIAR TABELA HISTORICO TRANSACAO
CREATE OR REPLACE FUNCTION fn_tabela_historico_imovel() RETURNS TRIGGER AS $$
BEGIN
    IF( TG_OP = 'INSERT') THEN
        INSERT INTO historico_imovel(id_cliente_funcionario, id_imovel, data_colocado) VALUES (new.id_cliente_funcionario, new.id_imovel, now()) ;
    END IF ;
    IF (TG_OP = 'UPDATE') THEN
        INSERT INTO historico_imovel(id_cliente_funcionario, id_imovel, data_alteracao) VALUES (new.id_cliente_funcionario, new.id_imovel, now()) ;
    END IF ;
    RETURN NEW ;
END ;
$$ language 'plpgsql' ;

CREATE TRIGGER tr_cria_historico_imovel
AFTER INSERT OR UPDATE ON transacao
FOR EACH ROW
EXECUTE PROCEDURE fn_tabela_historico_imovel() ;

-- Para atualizar o tipo e a disponibilidade

CREATE OR REPLACE FUNCTION fn_atualiza_tipo() RETURNS TRIGGER AS $$
BEGIN 
    UPDATE imovel SET disponivel = false WHERE id = NEW.id_imovel ;
    UPDATE imovel SET disponivel_tipo = NEW.tipo WHERE id = NEW.id_imovel ;
    RETURN NEW ;
END ;
$$ language 'plpgsql' ;


CREATE TRIGGER tr_atualiza_tipo
AFTER INSERT OR UPDATE ON transacao
FOR EACH ROW
EXECUTE PROCEDURE fn_atualiza_tipo() ; 

-- Para atualizar a tabela comissao

CREATE OR REPLACE FUNCTION fn_atualiza_comissao() RETURNS TRIGGER AS $$
BEGIN 
     INSERT INTO comissao(id_cliente_funcionario, id_transacao, mes, valor) VALUES(NEW.id_cliente_funcionario, new.id_numero_contrato, EXTRACT(MONTH FROM new.data_transacao), new.valor_comissao) ;
     RETURN NEW ;
END ;

$$ language 'plpgsql' ;

CREATE TRIGGER tr_atualiza_tabela_comissao
AFTER INSERT OR UPDATE ON transacao
FOR EACH ROW
EXECUTE PROCEDURE fn_atualiza_comissao() ;


-- Para atualizar repasse imobiliaria
CREATE OR REPLACE FUNCTION fn_atualiza_repasse() RETURNS TRIGGER AS $$
    DECLARE repasse real := 0.0 ;
    BEGIN 
        SELECT INTO repasse valor_repasse_imobiliaria FROM imovel WHERE id = NEW.id_imovel ;
        UPDATE transacao SET valor_repasse_imobiliaria = (new.valor / 100) * repasse WHERE id_imovel = NEW.id_imovel;
    RETURN NEW ;
    END ;
$$ language 'plpgsql' ;

CREATE TRIGGER tr_atualiza_repasse
AFTER INSERT ON transacao 
FOR EACH ROW
EXECUTE PROCEDURE fn_atualiza_repasse() ;


-- Criar View para passar total real do repasse 
CREATE OR REPLACE VIEW v_total_repasse AS
SELECT valor_repasse_imobiliaria, id_cliente_proprietario FROM transacao GROUP BY valor_repasse_imobiliaria, id_cliente_proprietario ORDER BY valor_repasse_imobiliaria DESC;

-- View para fazer a media das avaliacoes
CREATE OR REPLACE VIEW v_media_avaliacao AS
SELECT ((nota_questao_1 + nota_questao_2 + nota_questao_3 + nota_questao_4 + nota_questao_5) / 5 ) AS media_parcial, id_imovel FROM avaliacao ;

SELECT * FROM v_media_avaliacao ;


-- Trigger para atualizar média das avaliações
CREATE OR REPLACE FUNCTION fn_atualiza_media_avaliacao() RETURNS TRIGGER AS $$
    DECLARE media_view real := 0.0 ;
    DECLARE media_imovel real := 0.0 ;
    DECLARE media_total real := 0.0 ;
    BEGIN
        SELECT INTO media_view v.media_parcial FROM v_media_avaliacao AS v WHERE v.id_imovel = NEW.id_imovel ;
        SELECT INTO media_imovel i.avaliacao FROM imovel AS i WHERE i.id = NEW.id_imovel ;
        IF(media_imovel = 0.0) THEN
            UPDATE imovel SET avaliacao = media_view WHERE id = NEW.id_imovel ;
        END IF;
        IF(media_imovel > 0.0) THEN
            media_total = (media_view + media_imovel) / 2 ;
            UPDATE imovel SET avaliacao = media_total WHERE id = NEW.id_imovel ;
        END IF;
        RETURN NEW ;
    END ;
$$ language 'plpgsql' ;

CREATE TRIGGER tr_atualiza_media
AFTER INSERT ON avaliacao
FOR EACH ROW
EXECUTE PROCEDURE fn_atualiza_media_avaliacao() ;

