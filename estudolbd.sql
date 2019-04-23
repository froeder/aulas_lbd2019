-- Q1

SELECT empregado.pnome AS "Nome do empregado" , projeto.pjnome AS "Nome do projeto"
FROM empregado, trabalha_em, projeto
WHERE empregado.ssn = trabalha_em.essn AND projeto.pnumero = trabalha_em.pno
ORDER BY projeto.pjnome ASC;

-- Q2

SELECT empregado.pnome AS "Nome do empregado" , projeto.pjnome AS "Nome do projeto"
FROM empregado, trabalha_em
    JOIN projeto ON projeto.pnumero = trabalha_em.pno
WHERE empregado.ssn = trabalha_em.essn;

-- Q3

SELECT departamento.dnome AS "Nome do Departamento", projeto.pjnome AS "Nome do Projeto"
FROM departamento, projeto
WHERE departamento.dnumero = projeto.dnum
ORDER BY departamento.dnome ASC;

-- Q4

SELECT departamento.dnome AS "Nome do Departamento", projeto.pjnome AS "Nome do Projeto"
FROM projeto
    JOIN departamento ON departamento.dnumero = projeto.dnum
ORDER BY departamento.dnome ASC;

--Q5

SELECT departamento.dnome AS dnome
FROM departamento, projeto
WHERE projeto.dnum IN (departamento.dnumero)
;

--Q6
SELECT pnome
FROM empregado
WHERE salario >= 40000 AND salario <= 50000
;

--Q7

SELECT pnome
FROM empregado
WHERE salario BETWEEN 40000 AND 50000
;

-- Q8

    SELECT pnome
    FROM empregado , dependente
INTERSECT
    SELECT nome_dependente
    FROM dependente, empregado
    WHERE empregado.ssn = dependente.essn
;

-- Q9

SELECT pnome
FROM empregado , dependente
WHERE dependente.essn IN (empregado.ssn);


-- Q10

SELECT empregado.pnome
FROM empregado, dependente
WHERE EXISTS (SELECT NULL
FROM empregado, dependente
WHERE dependente.essn = empregado.ssn)
;

-- Q11

SELECT count(ssn) AS "Quantidade Empregados"
FROM empregado
;

--Q12

SELECT count(ssn) , superssn
FROM empregado
GROUP BY superssn
;

--Q13 
SELECT count(ssn) AS qtde, superssn
FROM empregado
GROUP BY superssn
HAVING count(ssn) > 2;

--Q14

SELECT departamento.dnumero , SUM(empregado.salario)
FROM departamento, empregado
WHERE departamento.dnumero = empregado.dno
GROUP BY departamento.dnumero
HAVING SUM(empregado.salario) > avg(empregado.salario) ;



