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
