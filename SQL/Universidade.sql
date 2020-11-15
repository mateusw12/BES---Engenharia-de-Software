CREATE DATABASE universidade;
USE universidade;

-- tabela aluno
CREATE TABLE aluno 
(
	id INT AUTO_INCREMENT,
	nome  VARCHAR(250) NOT NULL,
	matricula  VARCHAR(50) NOT NULL UNIQUE,
	data_nascimento DATE NULL,
	data_matricula  DATE NOT NULL,
	CONSTRAINT pk_aluno PRIMARY KEY(id)
);

-- tabela professor
CREATE TABLE professor
(
	id INT AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	CONSTRAINT pk_professor PRIMARY KEY(id)
);

-- rabela curso
CREATE TABLE curso 
(
	id INT AUTO_INCREMENT,
	nome VARCHAR(250) NOT NULL,
	media_aprovacao DECIMAL(4,2) NOT NULL,
	CONSTRAINT pk_curso PRIMARY KEY(id)
);

-- tabela disciplina
CREATE TABLE disciplina
(
	id INT AUTO_INCREMENT,
	id_curso INT NOT NULL,
	id_professor INT NOT NULL,
	nome VARCHAR(50) NOT NULL,
	CONSTRAINT pk_disciplina PRIMARY KEY(id),
	CONSTRAINT fk_disciplina_curso FOREIGN KEY (id_curso) REFERENCES curso(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT fk_disciplina_professor FOREIGN KEY (id_professor) REFERENCES professor(id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- tabela nota
CREATE TABLE nota
(
	id INT AUTO_INCREMENT,
	id_aluno INT NOT NULL,
	id_disciplina INT NOT NULL	,
	nota DECIMAL(4,2),
	CONSTRAINT pk_nota PRIMARY KEY(id),
	CONSTRAINT fk_nota_aluno FOREIGN KEY (id_aluno) REFERENCES aluno(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT fk_nota_disciplina FOREIGN KEY (id_disciplina) REFERENCES disciplina(id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- procedure para insert na tabela aluno
DELIMITER $
CREATE PROCEDURE sp_insere_aluno(IN nome VARCHAR(250), IN matricula VARCHAR(50), IN data_nascimento DATE, IN data_matricula DATE)
	BEGIN
		INSERT INTO aluno(nome, matricula, data_nascimento, data_matricula) VALUES(nome, matricula, data_nascimento, data_matricula);
	END $
DELIMITER ;

-- procedure para update na tabela aluno
DELIMITER $
CREATE PROCEDURE sp_atualiza_aluno(IN id_in INT, IN nome VARCHAR(250), IN matricula VARCHAR(50), IN data_nascimento DATE, IN data_matricula DATE)
	BEGIN
		UPDATE aluno SET nome = nome, matricula = matricula, data_nascimento = data_nascimento, data_matricula = data_matricula WHERE id = id_in;
	END $
DELIMITER ;

-- procedure para delete na tabela aluno
DELIMITER $
CREATE PROCEDURE sp_deleta_aluno(IN id_in INT)
	BEGIN
		DELETE FROM aluno WHERE id = id_in;
	END $
DELIMITER ;

-- procedure para insert na tabela professor
DELIMITER $
CREATE PROCEDURE sp_insere_professor(IN nome VARCHAR(250))
	BEGIN
		INSERT INTO professor(nome) VALUES(nome);
	END $
DELIMITER ;

-- procedure para update na tabela professor
DELIMITER $
CREATE PROCEDURE sp_atualiza_professor(IN id_in INT, IN nome VARCHAR(250))
	BEGIN
		UPDATE professor SET nome = nome WHERE id = id_in;
	END $
DELIMITER ;

-- procedure para deletar professor
DELIMITER $
CREATE PROCEDURE sp_deleta_professor(IN id_in INT)
	BEGIN
		DELETE FROM professor WHERE id = id_in;
	END $
DELIMITER ;

-- procedure para inserir curso
DELIMITER $
CREATE PROCEDURE sp_insere_curso(IN nome VARCHAR(250), IN media_aprovacao DECIMAL(4,2))
	BEGIN
		INSERT INTO curso(nome, media_aprovacao) VALUES(nome, media_aprovacao);
	END $
DELIMITER ;

-- procedure para update de curso
DELIMITER $
CREATE PROCEDURE sp_atualiza_curso(IN id_in INT, IN nome VARCHAR(250), media_aprovacao DECIMAL(4,2))
	BEGIN
		UPDATE curso SET nome = nome, media_aprovacao = media_aprovacao WHERE id = id_in;
	END $
DELIMITER ;

-- procedure para deletar curso
DELIMITER $
CREATE PROCEDURE sp_deleta_curso(IN id_in INT)
	BEGIN
		DELETE FROM curso WHERE id = id_in;
	END $
DELIMITER ;

-- procedure para inserir disciplina
DELIMITER $
CREATE PROCEDURE sp_insere_disciplina(IN id_curso INT, IN id_professor INT, IN nome VARCHAR(255))
	BEGIN
		INSERT INTO disciplina(id_curso, id_professor, nome) VALUES(id_curso, id_professor, nome);
	END $
DELIMITER ;

-- procedure para update da disciplina
DELIMITER $
CREATE PROCEDURE sp_atualiza_disciplina(IN id_in INT, IN id_curso INT, IN id_professor INT, IN nome VARCHAR(250))
	BEGIN
		UPDATE disciplina SET id_curso = id_curso, id_professor = id_professor, nome = nome WHERE id = id_in;
	END $
DELIMITER ;

-- procedure para deleta de disciplina
DELIMITER $
CREATE PROCEDURE sp_deleta_disciplina(IN id_in INT)
	BEGIN
		DELETE FROM disciplina WHERE id = id_in;
	END $
DELIMITER ;

-- procedure para inserir nota
DELIMITER $
CREATE PROCEDURE sp_insere_nota(IN id_aluno INT, IN id_disciplina INT, IN nota DECIMAL(4,2))
	BEGIN
		INSERT INTO nota(id_aluno, id_disciplina, nota) VALUES(id_aluno, id_disciplina, nota);
	END $
DELIMITER ;

-- procedure para update de nota
DELIMITER $
CREATE PROCEDURE sp_atualiza_nota(IN id_in INT, IN id_aluno INT, IN id_disciplina INT, IN nota DECIMAL(4,2))
	BEGIN
		UPDATE nota SET id_aluno = id_aluno, id_disciplina = id_disciplina, nota = nota WHERE id = id_in;
	END $
DELIMITER ;

-- procedure para deletar nota
DELIMITER $
CREATE PROCEDURE sp_deleta_nota(IN id_in INT)
	BEGIN
		DELETE FROM nota WHERE id = id_in;
	END $
DELIMITER ;

-- funcao de aprovação do aluno

DELIMITER $
CREATE FUNCTION fn_aluno_aprovado_disciplina(id_aluno_in INT, id_disciplina_in INT) 
	RETURNS CHAR(1)
	BEGIN
	
		DECLARE media DECIMAL(4,2);
		DECLARE media_curso DECIMAL(4,2);
		DECLARE aprovado CHAR(1);
		
		SET aprovado = 'N';
		SET media_curso = (SELECT c.media_aprovacao FROM disciplina d INNER JOIN curso c ON d.id_curso = c.id WHERE d.id = id_disciplina_in);
		SET media = (SELECT AVG(nota) FROM nota WHERE id_aluno = id_aluno_in AND id_disciplina = id_disciplina_in);
			IF (media >= media_curso) THEN
				SET aprovado = 'S';
			END IF;
		RETURN aprovado;
	END $
DELIMITER ;

-- insere os alunos
CALL sp_insere_aluno('Mateus', '1234', '1993-05-03', '2019-10-22');
CALL sp_insere_aluno('Jpse', '9876', '1989-07-04', '2019-10-15');
CALL sp_insere_aluno('Joao', '5412', '1989-07-04', '2019-10-15');

CALL sp_atualiza_aluno(1, 'Mateus Walz', '123456', '1994-05-03', '2019-10-21');
CALL sp_deleta_aluno(3);

-- insere os professores
CALL sp_insere_professor('Rodrigo');
CALL sp_insere_professor('Walter');
CALL sp_insere_professor('Volmir');

CALL sp_atualiza_professor(1, 'Dornel');
CALL sp_deleta_professor(3);

-- insert na tabela nota atraves da procedure
CALL sp_insere_curso('Engenharia de Software', 7.0);
CALL sp_insere_curso('Sistemas de Informação', 7.0);
CALL sp_atualiza_curso(1, 'Bacharelado em Engenharia de Software', 8);
CALL sp_deleta_curso(2);

-- insert na tabela disciplina atraves da procedure
CALL sp_insere_disciplina(1, 1, 'BDA');
CALL sp_insere_disciplina(1, 2, 'POO');
CALL sp_insere_disciplina(1, 3, 'MAST');

CALL sp_atualiza_disciplina(1, 1, 1, 'Banco de Dados');
CALL sp_deleta_disciplina(3);

-- insert na tabela nota atraves da procedure
CALL sp_insere_nota(1, 1, 6.5);
CALL sp_insere_nota(1, 1, 10);
CALL sp_insere_nota(1, 2, 5.0);
CALL sp_insere_nota(1, 2, 8.0);

CALL sp_atualiza_nota(1, 1, 1, 7.5);
CALL sp_deleta_nota(1);

-- VIew mostrando a disciplina juntamente com o curso

CREATE VIEW Vw_DisciplinaCurso
AS SELECT disciplina.nome AS Nome_Disciplina, curso.nome AS Curso
FROM disciplina
INNER JOIN curso
ON disciplina.id_curso = curso.id;

-- altera a view
ALTER  VIEW vw_DisciplinaCurso AS
SELECT disciplina.nome AS Nome_Disciplina, curso.nome AS Curso, curso.media_aprovacao AS Media_Aprovacao
FROM disciplina
INNER JOIN curso
ON disciplina.id_curso = curso.id;


-- chama a view
SELECT disciplina, curso
FROM vw_DisciplinaCurso
ORDER BY curso;

-- selects

SELECT fn_aluno_aprovado_disciplina(1, 1) AS aprovado; -- Nessa disciplina aprovado
SELECT fn_aluno_aprovado_disciplina(1, 2) AS aprovado; -- Nessa disciplina reprovado
SELECT * FROM aluno;
SELECT * FROM professor;
SELECT * FROM curso;
SELECT * FROM disciplina;
SELECT * FROM nota;
SELECT c.media_aprovacao FROM disciplina d INNER JOIN curso c ON d.id_curso = c.id WHERE d.id = 1;
SELECT AVG(nota) FROM nota WHERE id_aluno = 1 AND id_disciplina = 1;
SELECT AVG(nota) FROM nota WHERE id_aluno = 1 AND id_disciplina = 2;