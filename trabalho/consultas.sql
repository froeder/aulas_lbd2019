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



