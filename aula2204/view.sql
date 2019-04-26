CREATE VIEW nomedepartamento
AS SELECT pnome as "Nome do Empregado", 
pjnome as "Nome do Projeto" FROM 
empregado e, projeto p, trabalha_em t 
WHERE e.ssn = t.essn AND t.pno = p.pnumero 
ORDER BY p.pjnome;