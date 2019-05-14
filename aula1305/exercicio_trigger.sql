--Q1
CREATE OR REPLACE FUNCTION fn_confere_dependente() RETURNS TRIGGER AS $$
DECLARE qtde_dependente int ;
BEGIN
    SELECT INTO qtde_dependente COUNT(ssn) FROM empregado 
        JOIN dependente d ON d.essn = new.ssn ;
    IF qtde_dependente > 3
        RAISE EXCPTION 'Limite excedido';
    THEN 
        RETURN NEW ;
    END IF ;
END;
$$ language 'plpgsql'; 

CREATE TRIGGER tr_dependente
BEFORE INSERT OR UPDATE ON dependente
FOR EACH ROW 
EXECUTE PROCEDURE fn_confere_dependente() ;


--Q2
CREATE OR REPLACE FUNCTION fn_confere_supervisor() RETURNS TRIGGER AS $$
DECLARE qtde_funcionario int ;
BEGIN
     SELECT INTO qtde_funcionario count(ssn) FROM empregado e
            JOIN departamento d ON e.ssn = d.gerssn
    UNION
        SELECT COUNT(ssn) FROM empregado WHERE empegado.ssn = new.superssn;
    IF qtde_funcionario > 2
        RAISE EXCPTION 'Limite excedido';
    THEN 
        RETURN NEW
    END IF ;
END;
$$ language 'plpgsql'; 

CREATE TRIGGER tr_supervisor 
BEFORE INSERT OR UPDATE ON empregado
FOR EACH ROW
EXECUTE PROCEDURE fn_confere_supervisor();


--Q3
CREATE OR REPLACE FUNCTION fn_confere_hora() RETURNS TRIGGER AS $$
DECLARE qtde_hora int ;
BEGIN
    SELECT INTO qtde_hora count(t.horas)
    FROM empregado
        JOIN trabalha_em t ON new.ssn = t.essn
    WHERE horas > 1
    IF qtde_funcionario > 2
        RAISE EXCPTION 'Limite excedido';
    THEN 
        RETURN NEW
    END IF ;
END;
$$ language 'plpgsql'; 


CREATE TRIGGER tr_hora
BEFORE INSERT OR UPDATE ON trabalha_em
FOR EACH ROW
EXECUTE PROCEDURE fn_confere_hora();


--Q4
CREATE OR REPLACE FUNCTION fn_confere_hora() RETURNS TRIGGER AS $$
DECLARE qtde_projeto int ;
BEGIN
    SELECT INTO qtde_projeto COUNT(pnumero) FROM projeto 
        JOIN departamento d ON d.ero = new.dnum
    IF qtde_funcionario > 2
        RAISE EXCPTION 'Limite excedido';
    THEN 
        RETURN NEW
    END IF ;
END;
$$ language 'plpgsql'; 


CREATE TRIGGER tr_projeto
BEFORE INSERT OR UPDATE ON pojeto
FOR EACH ROW
EXECUTE PROCEDURE fn_confere_projeto();