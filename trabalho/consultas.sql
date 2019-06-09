-- Saber quantidade de comissão por mês de cada funcionario
SELECT p.nome, c.mes,  SUM(c.valor) AS total 
FROM pessoa AS p
JOIN comissao AS c ON id_cliente_funcionario = p.cpf 
GROUP BY p.nome , c.mes
ORDER BY mes ; 


-- Saber qual tipo de imovel gera mais lucro para a imobiliaria por transacao
SELECT 
SUM(t.valor_repasse_imobiliaria) AS total, i.imovel_tipo 
FROM transacao AS t
JOIN imovel AS i ON i.id = t.id_imovel
GROUP BY i.imovel_tipo
ORDER BY total DESC;


-- Saber quem é o proprietário dos imóveis que mais geram lucros para a imobiliaria
SELECT p.nome AS proprietario, SUM(v.valor_repasse_imobiliaria) AS total 
FROM v_total_repasse AS v
INNER JOIN pessoa AS p ON v.id_cliente_proprietario = p.cpf
GROUP BY proprietario 
ORDER BY total DESC;


-- Saber quais cidades e estado geram mais lucro para a imobiliaria
SELECT e.cidade, e.estado,  SUM(t.valor_repasse_imobiliaria) AS total 
FROM endereco AS e , imovel AS i 
JOIN transacao AS t ON i.id = t.id_imovel 
GROUP BY e.cidade , e.estado
ORDER BY total;


-- Saber a quantia de retorno para a imobiliaria por aluguel e por venda ;
SELECT tipo, SUM(valor) AS total FROM transacao 
GROUP BY tipo
ORDER BY total DESC;


-- Saber quais os clientes usuários que mais geram lucro para a imobiliaria
SELECT p.nome, SUM(t.valor_repasse_imobiliaria) AS total 
FROM pessoa AS p
JOIN transacao AS t ON  p.cpf = t.id_cliente_usuario
GROUP BY p.nome
ORDER BY total DESC;


-- Saber quem são os funcionário mais antigos na imobiliaria
SELECT p.nome AS nome ,  EXTRACT(YEAR FROM  age(cf.data_ingresso_imobiliaria)) AS anos 
FROM pessoa AS p 
JOIN cliente_funcionario AS cf ON p.cpf = cf.id_pessoa 
ORDER BY anos desc; 


--Saber onde está localizado os imóveis que recebem avaliações maiores que 3
SELECT e.estado , e.cidade 
FROM endereco AS e , imovel AS i 
WHERE i.id_endereco = e.id AND i.avaliacao > 3
GROUP BY e.estado , e.cidade ;


-- Saber quem são os proprietários dos imóveis que tem média de avaliação menores que 3 ;
SELECT p.nome AS nome 
FROM pessoa AS p , imovel AS i  , cliente_proprietario AS cp
WHERE p.cpf = cp.id_pessoa AND i.avaliacao < 3 AND i.avaliacao > 0
GROUP BY nome   ;


-- Saber lucro gerado por forma de pagamento
SELECT fp.descricao , SUM(t.valor_repasse_imobiliaria) AS repasse 
FROM forma_pagamento AS fp
INNER JOIN transacao AS t ON fp.id = t.id_forma_pagamento
GROUP BY fp.descricao 
ORDER BY repasse DESC;