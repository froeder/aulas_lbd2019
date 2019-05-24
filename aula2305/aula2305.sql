-- 1 Modelagem Banco Eleicao

1 pra N  no cria tabel nova, somente n pra no

--Q5    

SELECT ssn FROM e.empregado INNER JOIN dependentes d on d.essn = e.ssn GROUP BY ssn HVING COUNT(d.essn) > 3 ;

--q6

CREATE VIEW horas
AS
    SELECT ssn , pnome , t.horas
    FROM empregado e
        JOIN trabalha_em t ON e.ssn = t.essn
    ORDER BY sum(t.horas) DESC;