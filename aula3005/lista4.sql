--Q1

CREATE OR REPLACE FUNCTION fn_ex1 (in_ssn character(9)) returns int as $$
DECLARE idade integer := 0 ;
begin
  SELECT INTO idade EXTRACT (YEAR FROM age(bdate)) FROM employee WHERE ssm = in_ssn ;
  RETURN idade ;
end;
$$ LANGUAGE plpgsql ;


SELECT sss, fn_ex1(ssn) FROM employee ;

--Q2

--Quando precisar de criar coluna, cria antes da função

ALTER TABLE department ADD COLUMN qty_employee INTEGER ;

CREATE OR REPLACE FUNCTION  fn_ex2(dnum INTEGER) returns void as $$
DECLARE qty_func := 0 ;
begin
  SELECT INTO qty_func count(*) FROM employee WHERE dno = dnum ; 
  UPDATE department SET qty_employee = qty_func WHERE dnumber = dnum ;
end;
$$ LANGUAGE plpgsql ;

SELECT fn_ex2 (dnumber) FROM department ;

--Q4 converter para dolar

CREATE OR REPLACE FUNCTION  fn_ex4(dolar NUMERIC(10,2) , salary NUMERIC(10,2)) returns NUMERIC(10,2) as $$
DECLARE
begin
  RETURN CAST((salary / dolar) AS NUMERIC(10,2)) ;
end;
$$ LANGUAGE plpgsql ;

SELECT fn_ex2 (4.20 , salary) FROM employee ;


--Q5

CREATE OR REPLACE FUNCTION  fn_ex4(in_ssn character(9)) returns BOOLEAN as $$
DECLARE person record := 0 ;
begin
  SELECT INTO person EXTRACT (MONTH FROM bdate) as mes FROM employee WHERE ssm = in_ssn ;
  RETURN person.mes = 7 ;
end;
$$ LANGUAGE plpgsql ;

SELECT fn_ex5 (ssn) FROM employee ;

--Q6

CREATE OR REPLACE FUNCTION  fn_ex4(in_ssn character(9)) returns BOOLEAN as $$
DECLARE person record := 0 ;
begin
  SELECT INTO person EXTRACT (MONTH FROM CURRENT_DATE) as mes_corrente FROM employee WHERE ssm = in_ssn ;
  RETURN person.mes = person.mes_corrente ;
end;
$$ LANGUAGE plpgsql ;

SELECT ssn, fn_ex6 (ssn) FROM employee ;


--Q7

CREATE OR REPLACE FUNCTION  fn_ex7(in_ssn character(9)) returns INTEGER as $$
DECLARE qty integer := 0 ;
begin
  SELECT INTO qty COUNT(DISTINCT ssn) as qty_func FROM employee WHERE super_ssn = is_ssn ;
  RETURN qty ;
end;
$$ LANGUAGE plpgsql ;

SELECT ssn , fn_ex7 (ssn) FROM employee ;


--Q8 --SIMULA UM SELECT COM INNER JOIN ENTRE EMPLOYE E WORKS ON ---prova


CREATE OR REPLACE FUNCTION  fn_ex8(in_ssn character(9)) returns NUMERIC(10,2) as $$
DECLARE qty_hours numeric(10,2) := 0 ;
begin
  SELECT INTO qty_hours SUM(hours) FROM works_on WHERE essn = in_ssn ;
  RETURN qty_hours ;
end;
$$ LANGUAGE plpgsql ;

SELECT ssn, fn_ex8 (ssn) FROM employee ;


--Q9

ALTER TABLE employee ADD COLUMN valor_hora ;

CREATE OR REPLACE FUNCTION  fn_ex9(in_ssn character(9)) returns void as $$
DECLARE qty_hours numeric(10,2) := 0 ;
begin
  SELECT INTO qty_hours SUM(hours) FROM works_on WHERE essn = in_ssn ;
  UPDATE employee SET valor_hora = salary / qty_hours WHERE ssn = in_ssn;
end;
$$ LANGUAGE plpgsql ;

SELECT fn_ex9 (ssn) FROM employee ;



links
https://medium.com/free-code-camp/how-to-set-up-the-debugger-for-chrome-extension-in-visual-studio-code-c0b3e5937c01
https://blog.logrocket.com/12-tips-for-writing-clean-and-scalable-javascript-3ffe30abfe20
https://medium.com/free-code-camp/these-are-the-best-javascript-chart-libraries-for-2019-29782f5e1dc2

https://medium.mybridge.co/web-development-top-10-articles-for-the-past-month-v-may-2019-4aa4cc5eae73
https://medium.mybridge.co/javascript-open-source-for-the-past-month-v-may-2019-80e6ad3db158
https://medium.mybridge.co/vue-js-open-source-for-the-past-month-v-may-2019-ae0b349bfd9