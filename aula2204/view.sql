CREATE VIEW nomedepartamento(nome)
AS SELECT pnome , 
pjnome FROM 
empregado e, projeto p, trabalha_em t 
WHERE e.ssn = t.essn AND t.pno = p.pnumero 
ORDER BY p.pjnome;