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
	ra INT PRIMARY KEY,
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

-- Inserindo Dados na Tabela Projeto
INSERT INTO Projeto (nome, descricao)
	VALUES ('Greentech', 'Estufas Inteligentes para Tomates'),
			('EcoTech', 'Sistema para Controlar Ocupação de Lixeiras'),
            ('Pai Coruja', 'Sistema de Comunicação Escolar');
            
-- Inserindo Dados na Tabela Aluno
INSERT INTO Aluno (ra, nome, telefone, fkRepresentante, fkProjeto)
	VALUES (01222062,'Julio Ryan Ramos', '11 99133-2686', NULL, 2),
			(01222031,'Daiane Beatriz Oliveira', '11 99265-2019', NULL, 1),
            (01222004,'Jéssica Bárbara Lopes', '11 98662-8497', 01222031, 2),
            (01222025,'Tiago Mário Ricardo', '11 98711-3686', 01222062, 1),
			(01222040,'Augusto Heitor Monteiro', '11 98995-3113', 01222062, 3),
            (01222015,'Douglas Adão Nascimento', '11 98951-5561', 01222031, 3);
            
-- Inserindo Dados na Tabela Acompanhante
INSERT INTO Acompanhante (fkRa, idAcompanhante, nome, relacaoAluno)
	VALUES (01222062, 1, 'Thomas Carlos', 'Pai'),
			(01222031, 1, 'Elza Brenda', 'Mâe'),
            (01222031, 2, 'Vitor Edson', 'Pai'),
            (01222004, 1, 'Francisca Josefa', 'Vó'),
            (01222004, 2, 'Anderson Benício', 'Namorado'),
            (01222025, 1, 'Sabrina Nascimento', 'Namorada'),
            (01222040, 1, 'Agatha Nair', 'Tia'),
            (01222015, 1, 'Oliver Leandro', 'Pai'),
            (01222015, 2, 'Maya Nina', 'Namorada'),
            (01222015, 3, 'Miguel Benedito', 'Primo');
            
-- Exibindo os dados de todas as tabelas separadamente
SELECT * FROM Projeto;
SELECT * FROM Aluno;
SELECT * FROM Acompanhante;

-- Exibindo os dados dos alunos e dos projetos correspondentes
SELECT * FROM Aluno, Projeto WHERE fkProjeto = idProjeto;

-- Exibindo os dados dos alunos e dos seus acompanhantes
SELECT * FROM Aluno, Acompanhante WHERE fkRa = ra;

-- Exibindo os dados dos alunos e dos seus representantes
SELECT * FROM Aluno, Aluno AS Representante WHERE Aluno.fkRepresentante = Representante.ra;

-- Exibindo dados dos alunos e do projeto, porém de somente 1 projeto selecionado pelo nome
SELECT * FROM Aluno, Projeto WHERE fkProjeto = idProjeto AND Projeto.nome = 'Pai Coruja';

-- Exibindo os dados dos alunos, dos projetos e dos seus acompanhantes
SELECT * FROM Aluno, Projeto, Acompanhante WHERE fkProjeto = idProjeto AND fkRa = ra;

-- _____________________________________________________________________________________
