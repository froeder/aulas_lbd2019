-- Saber o nome do Funcionário e a quantia que ele recebeu de comissão por mês

SELECT p.nome, SUM(c.valor) AS total FROM pessoa AS p
INNER JOIN comissao AS c ON id_cliente_funcionario = p.cpf GROUP BY p.nome ORDER BY total DESC; 

-- Saber qual tipo de imovel gera mais lucro para a imobiliaria por transacao

SELECT i.id, SUM(i.valor_repassse_imobiliaria) AS total, i.imovel_tipo FROM imovel AS i 
JOIN transacao AS t ON i.id = t.id_imovel GROUP BY i.id ORDER BY total DESC;

-- Saber quem é o proprietário dos 5 imóveis que mais geram lucros para a imobiliaria

SELECT 
p.nome ,
SUM(i.valor_repassse_imobiliaria) AS total
FROM 
pessoa AS p , 
cliente_proprietario AS cp ,
imovel AS i
WHERE p.cpf = cp.id_pessoa
GROUP BY p.nome

