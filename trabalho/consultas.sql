-- Saber o nome do Funcionário e a quantia que ele recebeu de comissão por mês

SELECT p.nome, SUM(c.valor) AS total FROM pessoa AS p
INNER JOIN comissao AS c ON id_cliente_funcionario = p.cpf GROUP BY p.nome ORDER BY total DESC; 

-- Saber qual tipo de imovel gera mais lucro para a imobiliaria por transacao

SELECT i.id, SUM(i.valor_repasse_imobiliaria) AS total, i.imovel_tipo FROM imovel AS i 
JOIN transacao AS t ON i.id = t.id_imovel GROUP BY i.id ORDER BY total DESC;

-- Saber quem é o proprietário dos 5 imóveis que mais geram lucros para a imobiliaria



-- Saber quais cidades e estado geram mais lucro para a imobiliaria

SELECT 
e.cidade,
e.estado,
SUM(i.valor_repasse_imobiliaria) AS total
FROM 
endereco AS e , imovel AS i
WHERE
i.id_endereco = e.id 
GROUP BY e.cidade , e.estado
ORDER BY total DESC;
