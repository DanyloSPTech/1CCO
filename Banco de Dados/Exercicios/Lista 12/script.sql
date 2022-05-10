-- Criando o banco de dados GruposPI
CREATE DATABASE GruposPI;

-- Selecionando o banco de dados GruposPI
USE GruposPI;

-- Criando a tabela Aluno
CREATE TABLE Aluno (
	ra INT PRIMARY KEY,
	nome VARCHAR (75),
    email VARCHAR (75)
);

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
    descricao VARCHAR (140),
    fkRa INT,
    FOREIGN KEY (fkRa) REFERENCES Aluno(ra)
);

-- Criando a tabela Apresentacao
CREATE TABLE Apresentacao (
	fkGrupo INT,
    fkProfessor INT,
    dataHora DATETIME,
    nota DECIMAL (4, 2),
    FOREIGN KEY (fkGrupo) REFERENCES Grupo (idGrupo),
    FOREIGN KEY (fkProfessor) REFERENCES Professor (idProfessor),
    PRIMARY KEY (fkGrupo, fkProfessor)
);