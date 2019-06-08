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
