-- Criando o banco de dados AlunoDisciplina
CREATE DATABASE AlunoDisciplina;

-- Selecionando o banco de dados AlunoDisciplina
USE AlunoDisciplina;

-- Criando a tabela aluno
CREATE TABLE Aluno (
	ra INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (75),
    bairro VARCHAR (100)
);

-- Criando a tabela disciplina
CREATE TABLE Disciplina (
	idDisciplina INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (45)
);

-- Criando a tabela AlunoDisciplina
CREATE TABLE AlunoDisciplina (
	semestre CHAR (7),
    fkDisciplina INT,
    fkRa INT,
    media DECIMAL (4,2),
    faltas INT,
    FOREIGN KEY (fkRa) REFERENCES Aluno(ra),
    FOREIGN KEY (fkDisciplina) REFERENCES Disciplina(idDisciplina),
    PRIMARY KEY (semestre, fkDisciplina, fkRa)
);

-- Inserindo dados na tabela aluno
INSERT INTO Aluno (nome, bairro)
	VALUES ('Douglas Adão', 'Guaianases'),
			('Marcos Henrique', 'Mooca'),
            ('Viniciuas Amaral', 'Lapa');
            
-- Inserindo dados na tabela disciplina
INSERT INTO Disciplina (nome)
	VALUES ('Algoritmo'),
			('Cálculo Computacional'),
            ('Tecnologia da Informação');
            
-- Inserindo dados na tabela AlunoDisciplina
INSERT INTO AlunoDisciplina (semestre, fkDisciplina, fkRa, media, faltas)
	VALUES ('01/2023', 1, 3, 7.60, 7),
			('01/2023', 2, 3, 6.10, 11),
            ('01/2023', 3, 3, 6.80, 5),
            ('01/2024', 1, 2, 7.10, 5),
			('01/2024', 2, 2, 8.10, 3),
            ('01/2024', 3, 2, 8.80, 1),
            ('01/2023', 1, 1, 9.60, 4),
			('01/2023', 2, 1, 7.30, 2),
            ('01/2023', 3, 1, 8.50, 6);
            
-- a-) Exibindo os dados de cada tabela separadamente
SELECT * FROM Aluno;
SELECT * FROM Disciplina;
SELECT * FROM AlunoDisciplina;

-- b-) Exibindo os dados dos alunos e das disciplinas correspondentes
SELECT * FROM Aluno, Disciplina, AlunoDisciplina WHERE ra = fkRa AND fkDisciplina = idDisciplina;

-- c-) Exibindo os dados dos alunos e de uma disciplina correspondente
SELECT * FROM Aluno, Disciplina, AlunoDisciplina WHERE ra = fkRa AND fkDisciplina = idDisciplina AND idDisciplina = 1;

-- d-) Exibindo os dados de um aluno e os dados das disciplinas desse aluno
SELECT * FROM Aluno, Disciplina, AlunoDisciplina WHERE ra = fkRa AND fkDisciplina = idDisciplina AND ra = 2;

-- e-) Exibindo a soma das médias e a soma das quantidades de faltas
SELECT SUM(media) AS somaMedias, SUM(faltas) AS somaFaltas FROM AlunoDisciplina;

-- f-) Exibindo a média das médias e a média das quantidades de faltas
SELECT AVG(media) AS mediaMedias, AVG(faltas) AS mediaFaltas FROM AlunoDisciplina;

-- g-) Exibindo a maior e a menor média
SELECT MAX(media) AS maiorMedia, MIN(media) AS menorMedia FROM AlunoDisciplina;

-- h-) Exibindo a maior e a menor quantidade de faltas
SELECT MAX(faltas) AS maiorQtdeFaltas, MIN(faltas) AS menorQtdeFaltas FROM AlunoDisciplina;

-- i-) Exibindo a contagem de quantidade de faltas acima de 20
SELECT COUNT(faltas) AS 'Quantidades de faltas registradas acima de 20' FROM alunodisciplina WHERE faltas > 20;

-- j-) Exibindo a maior e a menor média agrupado por disciplina
SELECT fkDisciplina, MAX(media) AS maiorMedia, MIN(media) AS menorMedia FROM AlunoDisciplina GROUP BY fkDisciplina;

-- k-) Exibindo a maior e a menor média agrupado por aluno
SELECT fkRa, MAX(media) AS maiorMedia, MIN(media) AS menorMedia FROM AlunoDisciplina GROUP BY fkRa;

-- l-) Exibindo a maior e a menor quantidade de faltas agrupado por disciplina
SELECT fkDisciplina, MAX(faltas) AS maiorQtdeFaltas, MIN(faltas) AS menorQtdeFaltas FROM AlunoDisciplina GROUP BY fkDisciplina;

-- m-) Exibindo a maior e a menor quantidade de faltas agrupado por aluno
SELECT fkRa, MAX(faltas) AS maiorQtdeFaltas, MIN(faltas) AS menorQtdeFaltas FROM AlunoDisciplina GROUP BY fkRa;

-- n-) Exibindo apenas as médias da tabela AlunoDisciplina
SELECT Media FROM AlunoDisciplina;

-- o-) Exibindo apenas as médias distintas da tabela AlunoDisciplina
SELECT DISTINCT Media FROM AlunoDisciplina;

-- p-) Exibindo a quantidade de médias na tabela AlunoDisciplina
SELECT COUNT(media) AS qtdeMedias FROM AlunoDisciplina;

-- q-) Exibindo a quantidade de médias distintas na tabela AlunoDisciplina
SELECT DISTINCT COUNT(media) AS qtdeMedias FROM AlunoDisciplina;