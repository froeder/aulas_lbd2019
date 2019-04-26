-- Q2

CREATE VIEW gerente AS
SELECT count(ssn) FROM empregado e 
JOIN departamento d ON e.ssn = d.gerssn
UNION
SELECT COUNT(ssn) FROM empregado ;
 ;

 -- Q4
CREATE VIEW MAISTRABALHA AS SELECT pnome , t.horas FROM empregado e
JOIN trabalha_em t ON e.ssn = t.essn 
WHERE horas > 1
ORDER BY horas DESC
LIMIT 2;


 --Q5

 CREATE VIEW funcionarios AS
 SELECT * FROM empregador ORDER BY dno ;

 -- Q6

CREATE VIEW horas AS
SELECT ssn , pnome , t.horas FROM empregado e
JOIN trabalha_em t ON e.ssn = t.essn 
ORDER BY t.horas DESC;

--Q8

CREATE VIEW empregado_departamento AS
SELECT count(ssn), dno FROM empregado GROUP BY dno ;

-- Q9 




