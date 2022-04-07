-- Criando o Banco de Dados AlunoProjeto
CREATE DATABASE AlunoProjeto;

-- Seleciondando o Banco de Dados AlunoProjeto
USE AlunoProjeto;

-- Criando a Tabela Projeto
CREATE TABLE Projeto (
	idProjeto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (45),
    descricao VARCHAR (90)
);

-- Criando a Tabela Aluno
CREATE TABLE Aluno (
	ra INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (75),
    telefone CHAR (13),
    fkRepresentante INT,
    fkProjeto INT,
    FOREIGN KEY (fkRepresentante) REFERENCES Aluno (ra),
    FOREIGN KEY (fkProjeto) REFERENCES Projeto (idProjeto)
);

-- Criando a Tabela Acompanhante
CREATE TABLE Acompanhante (
	fkRa INT,
    idAcompanhante INT,
    nome VARCHAR (75),
    relacaoAluno VARCHAR (45),
    FOREIGN KEY (fkRa) REFERENCES Aluno (ra),
    PRIMARY KEY (fkRa, idAcompanhante)
);

--

