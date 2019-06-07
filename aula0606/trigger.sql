-- QUESTAO 1

CREATE OR REPLACE FUNCTION fn_limit_dep() RETURNS TRIGGER AS $$
DECLARE deps int := 0 ;
BEGIN
    SELECT INTO deps COUNT(*) FROM dependente D
    WHERE d.essn = NEW.ssn ;

    IF deps >= 3 THEN
        RAISE EXCPTION 'Já tem 3 dependentes' ;
    END IF ;

    RETURN NEW ;
END ;
$$ language 'plpgsql' ;

CREATE TRIGGER tr_limit_dep
BEFORE INSERT OR UPADTE ON dependente
FOR EACH ROW
EXECUTE PROCEDURE fn_limit_dep() ;


-- questao 2

CREATE OR REPLACE FUNCTION fn_limit_emp() RETURNS TRIGGER AS $$
DECLARE emps int := 0 ;
BEGIN
    SELECT INTO emps COUNT(DISTINCT()) FROM empregado e 
    WHERE e.superssn = NEW.superssn ;

    IF deps >= 2 THEN
        RAISE EXCPTION 'Já tem 2 odenados' ;
    END IF ;

    RETURN NEW ;
END ;
$$ language 'plpgsql' ;

CREATE TRIGGER tr_limit_emp
BEFORE INSERT OR UPADTE ON empregado
FOR EACH ROW
EXECUTE PROCEDURE fn_limit_emp() ;

--QUESTAO 3 

CREATE OR REPLACE FUNCTION fn_limit_horas() RETURNS TRIGGER AS $$
DECLARE horas real := 0.0 ;
BEGIN
    SELECT INTO horas COUNT(SUM(horas)) FROM trablha_em t 
    WHERE t.essn = NEW.essn ;

    IF (horas + NEW.horas) > 40 THEN
        RAISE EXCPTION 'Já trampou muito' ;
    END IF ;

    RETURN NEW ;
END ;
$$ language 'plpgsql' ;

CREATE TRIGGER tr_limit_horas
BEFORE INSERT OR UPADTE ON trabalha_em
FOR EACH ROW
EXECUTE PROCEDURE fn_limit_horas() ;


-- UQESTAO 4

CREATE OR REPLACE FUNCTION fn_limit_projetos() RETURN TRIGGER AS $$
DECLARE projs integer:= 0;
BEGIN
  SELECT INTO projs COUNT(*) FROM projeto 
  WHERE dnum = NEW.dnum;

  IF projs >= 4
    RAISE EXCEPTION 'Não pode' ;
  END IF ;
END;
$$ language 'plpgsql' ;

CREATE TRIGGER tr_limit_projetos
BEFORE INSERT OR UPADTE ON trabalha_em
FOR EACH ROW
EXECUTE PROCEDURE fn_limit_projetos() ;