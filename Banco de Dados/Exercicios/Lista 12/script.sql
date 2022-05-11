-- Criando o banco de dados GruposPI
CREATE DATABASE GruposPI;

-- Selecionando o banco de dados GruposPI
USE GruposPI;

-- Criando a tabela Professor
CREATE TABLE Professor (
	idProfessor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (75),
    disciplina VARCHAR (25)
) AUTO_INCREMENT = 10000;

-- Criando a tabela Grupo
CREATE TABLE Grupo (
	idGrupo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (75),
    descricao VARCHAR (140)
);

-- Criando a tabela Aluno
CREATE TABLE Aluno (
	ra INT PRIMARY KEY,
	nome VARCHAR (75),
    email VARCHAR (75),
    fkGrupo INT,
    FOREIGN KEY (fkGrupo) REFERENCES Grupo (idGrupo)
);

-- Criando a tabela Apresentacao
CREATE TABLE Apresentacao (
	fkGrupo INT,
    fkProfessor INT,
    dataApresentacao DATE,
    horaApresentacao CHAR (5),
    nota DECIMAL (4, 2),
    FOREIGN KEY (fkGrupo) REFERENCES Grupo (idGrupo),
    FOREIGN KEY (fkProfessor) REFERENCES Professor (idProfessor),
    PRIMARY KEY (fkGrupo, fkProfessor)
);

-- Inserindo dados na tabela Professor
INSERT INTO Professor (nome, disciplina)
	VALUES ('Roberto', 'Algoritmo'),
			('Elizete', 'Pesquisa e Inovação'),
            ('José', 'Arquitetura Computacional');
            
-- Inserindo dados na tabela Grupo
INSERT INTO Grupo (nome, descricao)
	VALUES ('Pai Coruja', 'Projeto para criar uma rede de comunicação entre responsáveis e alunos'),
			('Green Conect', 'Projeto para supervisionar áreas de conservação ambiental');

-- Inserindo dados na tabela Aluno
INSERT INTO Aluno (ra, nome, email, fkGrupo)
	VALUES (02231025, 'Douglas Adão', 'douglas.para@gmail.com', 1),
			(02231043, 'Vinicius Amaral', 'vinicius2003@gmail.com', 1),
            (02231023, 'Kauan Souza', 'kauanszz@hotmail.com', 2),
            (02231004, 'Diogo Silva', 'diogo.ssva@gmail.com', 1),
            (02231036, 'Mayahra Silva', 'maahsilva@hotmail.com', 2),
            (02231044, 'Giovanna Barbosa', 'giih.barbosa@gmail.com', 2);
            
-- Inserindo dados na tabela Apresentacao
INSERT INTO Apresentacao (fkGrupo, fkProfessor, dataApresentacao, horaApresentacao, nota)
	VALUES (1, 10000, '2023-10-21', '10:30', 7.60),
			(2, 10000, '2023-10-21', '11:15', 8.40),
            (1, 10001, '2023-10-23', '10:30', 8.70),
            (2, 10001, '2023-10-23', '11:15', 7.20),
            (1, 10002, '2023-10-25', '12:15', 7.50),
            (2, 10002, '2023-10-25', '13:00', 7.20);

-- 3-) Exibir os dados de todas as tabelas separadamente		
SELECT * FROM professor;
SELECT * FROM grupo;
SELECT * FROM aluno;
SELECT * FROM apresentacao;

-- 5-) Exibir os dados dos grupos e seus respectivos alunos
SELECT * FROM Grupo, Aluno WHERE fkGrupo = idGrupo;

-- 6-) Exibir os dados de um determinado grupo e seus respectivos alunos
SELECT * FROM Grupo, Aluno WHERE fkGrupo = idGrupo AND idGrupo = 1;

-- 7-) Exibir a média das notas atribuidas no geral
SELECT AVG(nota) AS MediaNota FROM Apresentacao;

-- 8-) Exibindo a nota minima e a nota maxima atribuida aos grupos no geral
SELECT MAX(nota) AS notaMaxima, MIN(nota) AS notaMinima FROM Apresentacao;

-- 9-) Exibindo a soma das notas dadas aos grupos no geral
SELECT SUM(nota) AS somaNotas FROM Apresentacao;

-- 10-) Exibindo os dados dos professores que avaliaram cada grupo, os dados dos grupos e a data e horario da apresentacao
SELECT professor.nome, disciplina, grupo.nome, descricao, dataApresentacao, horaApresentacao FROM Professor, Grupo, Apresentacao WHERE fkProfessor = idProfessor AND idGrupo = fkGrupo;

-- 11-) Exibir os dados dos professores que avaliaram um determinado grupo, os dados do grupo e a data e horario da apresentacao
SELECT professor.nome, disciplina, grupo.nome, descricao, dataApresentacao, horaApresentacao FROM Professor, Grupo, Apresentacao WHERE fkProfessor = idProfessor AND idGrupo = fkGrupo AND idGrupo = 2;

-- 12-) Exibir os nomes dos grupos que foram avaliados por um determinado professor
SELECT grupo.nome FROM Grupo, Professor, Apresentacao WHERE idProfessor = fkProfessor AND idGrupo = fkGrupo AND professor.nome = 'Roberto';

-- 13-) Exibir os dados dos grupos, dos alunos dos grupos, dos professores e a data e hora da apresentacao
SELECT grupo.nome, descricao, ra, aluno.nome, email, aluno.fkGrupo, professor.nome, disciplina, dataApresentacao, horaApresentacao FROM Grupo, Aluno, Professor, Apresentacao WHERE idGrupo = aluno.fkGrupo AND apresentacao.fkGrupo = idGrupo AND idProfessor = fkProfessor;

-- 14-) Exibir a quantidade de notas distintas
SELECT DISTINCT COUNT(nota) AS notasDistintas FROM Apresentacao;

-- 15-) Exibir nome do professor, média das notas e a soma das notas agrupado por professor
SELECT nome, AVG(nota) AS mediaNotas, SUM(nota) AS somaNotas FROM Professor, Apresentacao WHERE idProfessor = fkProfessor GROUP BY nome;

-- 16-) Exibir o nome do grupo, média das notas e a soma das notas do grupo
SELECT nome, AVG(nota) AS mediaNotas, SUM(nota) AS somaNotas FROM Grupo, Apresentacao WHERE idGrupo = fkGrupo GROUP BY nome;

-- 17-) Exibir o nome do professor, a maior nota e a menor nota agrupado por professor
SELECT nome, MAX(nota) AS maiorNota, MIN(nota) AS menorNota FROM Professor, Apresentacao WHERE idProfessor = fkProfessor GROUP BY nome;

-- 18-) Exibir o nome do grupo, a maior nota e a menor nota agrupado por grupo
SELECT nome, MAX(nota) AS maiorNota, MIN(nota) AS menorNota FROM Grupo, Apresentacao WHERE idGrupo = fkGrupo GROUP BY nome;