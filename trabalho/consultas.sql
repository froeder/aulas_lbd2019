-- Para atualizar o salario para cada transacao do funcionario
CREATE OR REPLACE FUNCTION fn_atualiza_salario RETURN TRIGGER AS $$
BEGIN 
    UPDATE TABLE cliente_funcionario SET salario = old.salario + seilaoq.valor_comissao WHERE id_pessoa = seilaoque.id_cliente_funcionario;
END ;
$$ language 'plpgsql';

CREATE TRIGGER tr_atualiza_salario 
AFTER INSERT ON transacao 
FOR EACH ROW
EXECUTE PROCEDURE fn_atualiza_salario() ;



-- Para atribuir o salario do funcionario pelo id
CREATE OR REPLACE FUNCTION fn_atribui_salario RETURN TRIGGER ASS $$
BEGIN
    UPDATE TABLE funcionario as f SET f.salario = new.salario_base WHERE cargo = id ;
END ;
$$ language 'plpgsql' ;

CREATE TRIGGER tr_atribui_salario
AFTER INSERT ON funcionario
FOR EACH ROW
EXECUTE PROCEDURE fn_atribui_salario ;