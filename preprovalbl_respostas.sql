-- Q4

select pessoa.nomepessoa
from pessoa,
     aluno,
     pessoaresultado
where pessoa.matricula = aluno.matricula
    and pessoaresultado.matricula = pessoa.matricula ;

-- Não retorna pois não há alunos que participaram de resultados de projeto.
 --Q3

SELECT pessoa.nomepessoa
FROM pessoa,
     atividade
WHERE pessoa.matricula = atividade.matricula INTERSECT
    SELECT pessoa.nomepessoa
    FROM pessoa,
         pessoaresultado WHERE pessoa.matricula <> pessoaresultado.matricula ;

-- Q5

SELECT projeto.tituloprojeto
from projeto,
     resultado
WHERE projeto.codprojeto = resultado.codprojeto ;

-- Q6 -incompleta

SELECT pessoa.matricula
FROM dirigente,
     pessoa
WHERE pessoa.matricula = dirigente.matricula
EXCEPT
SELECT unidade.matricula
FROM unidade,
     dirigente
WHERE unidade.matricula = dirigente.matricula;

--Q7 - incorreta

SELECT alunocurriculo.matricula,
       pessoa.nomepessoa,
       curso.codcurso
FROM alunocurriculo,
     curso,
     pessoa
WHERE alunocurriculo.codcurso ILIKE curso.codcurso
    AND pessoa.matricula = alunocurriculo.matricula;

-- Q8

SELECT DISTINCT pessoa.nomepessoa
FROM pessoa,
     aluno,
     curso,
     alunohistorico AS historico,
     disciplinacurriculo
WHERE pessoa.matricula = aluno.matricula
    AND historico.coddisciplina ILIKE disciplinacurriculo .coddisciplina ;

-- Q8  usando intersect

SELECT pessoa.nomepessoa
FROM pessoa,
     aluno
WHERE pessoa.matricula = aluno.matricula INTERSECT
    SELECT pessoa.nomepessoa
    FROM pessoa,
         disciplinacurriculo,
         alunohistorico WHERE disciplinacurriculo.coddisciplina ILIKE alunohistorico.coddisciplina -- Q8 usando WHERE IN

    SELECT DISTINCT pessoa.nomepessoa
    FROM pessoa,
         aluno,
         alunohistorico as historico WHERE pessoa.matricula = aluno.matricula
    AND historico.coddisciplina IN
        (SELECT curriculo.coddisciplina
         FROM disciplinacurriculo AS curriculo,
              curso
         WHERE curriculo.codcurso = curso.codcurso)
    AND historico.situacao LIKE 'A' ;

-- Q10

SELECT DISTINCT disciplina.nomedisciplina AS nome
FROM disciplina,
     disciplinacurriculo AS curriculo,
     curso
WHERE curriculo.codcurso ILIKE curso.codcurso ;

--Q12

SELECT pessoa.nomepessoa AS nome,
       count(projeto.codprojeto) AS qtdprojetos
FROM pessoa,
     funcionario,
     projeto
WHERE pessoa.matricula = funcionario.matricula
    AND projeto.coordenador = funcionario.matricula
GROUP BY pessoa.nomepessoa ;

-- Q2

SELECT atividade.descricaoatividade
FROM atividade
WHERE datafimatividade = dataprevistafimatividade ;

