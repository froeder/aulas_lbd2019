-- TRIGGER

-- BEFORE, AFTER / INSERT - UPDATE - DELETE

-- Tipo 

-- ROW - A cada linha nova

--STATEMENT - 

-- NEW - INSER , UPDATE
-- OLD UPDATE, REMOVE

-- Criar trigger depois da função.  

-- SINTAXE

CREATE TRIGGER tr_example
BEFORE
INSERT ON tabela 

-- TG_OP é o evento que está ocorendo

RAISE EXCEPTION ;

-- Exemplo conferir salario inserido superior a 10k, se sim reduzir para 9.999,99

CREATE OR REPLACE FUNCTION fn_reduz_salario() RETURN TRIGGER AS $$

BEGIN 
    IF (NEW*. >= 10000) THEN
        INSERT INTO funcionario (salario) VALUES (9999);
        RETURN NULL
    END IF ;
END

$$ language 'plpgsql' ;

CREATE TRIGGER tr_atualiza_salario
BEFORE INSERT   ON funcionario
FOR EACH ROW
EXECUTE PROCEDURE fn_reduz_salario() ;