SELECT disciplina.nomedisciplina , unidade.nomeunidade FROM   unidade , professor, disciplina , turma WHERE nomedisciplina ILIKE '%computacao%' AND turma.ano = '2004' ;


SELECT pessoa.nomepessoa , professor.matricula FROM pessoa , professor WHERE pessoa.matricula = professor.matricula ;

SELECT disciplina.nomedisciplina , unidade.nomeunidade , professor.matricula FROM   unidade , professor, disciplina , turma WHERE nomedisciplina ILIKE '%computacao%' AND turma.ano = '2004' 
AND professor.matricula IN (SELECT matricula FROM pessoa) ;

SELECT disciplina.nomedisciplina , unidade.nomeunidade , pessoa.nomepessoa FROM   unidade , professor, disciplina , turma , pessoa WHERE nomedisciplina ILIKE '%computacao%' AND turma.ano = '2004'  ;

