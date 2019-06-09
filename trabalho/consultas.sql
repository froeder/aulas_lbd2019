-- Saber o nome do Funcionário e a quantia que ele recebeu de comissão por mês
SELECT p.nome, SUM(c.valor) AS total FROM pessoa AS p
INNER JOIN comissao AS c ON id_cliente_funcionario = p.cpf GROUP BY p.nome ORDER BY total DESC; 


-- Saber qual tipo de imovel gera mais lucro para a imobiliaria por transacao
SELECT SUM(t.valor_repasse_imobiliaria) AS total, i.imovel_tipo FROM transacao AS t
INNER JOIN imovel AS i ON i.id = t.id_imovel
GROUP BY i.imovel_tipo
ORDER BY total DESC;


-- Saber quem é o proprietário dos imóveis que mais geram lucros para a imobiliaria
SELECT p.nome, SUM(v.valor_repasse_imobiliaria) AS total FROM v_total_repasse AS v
INNER JOIN pessoa AS p ON v.id_cliente_proprietario = p.cpf
GROUP BY p.nome 
ORDER BY total DESC;


-- Saber quais cidades e estado geram mais lucro para a imobiliaria

