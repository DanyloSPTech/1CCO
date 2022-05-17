-- Criando o banco de dados
CREATE DATABASE Exercicio13;

-- Selecionando o banco de dados
USE Exercicio13;

-- Criando a tabela Departamento
CREATE TABLE Departamento(
	idDepto INT PRIMARY KEY,
    nomeDepto VARCHAR (25),
    dataInicioGer DATE,
    fkGerente INT
);

-- Criando a tabela Funcionario
CREATE TABLE Funcionario(
	idFunc INT PRIMARY KEY,
    nomeFunc VARCHAR (30),
    salario DECIMAL (7, 2),
    sexo CHAR (1) CHECK (sexo = 'M' OR sexo = 'F' OR sexo = 'N'),
    dataNasc DATE,
    fkDepto INT,
    fkSupervisor INT,
    FOREIGN KEY (fkDepto) REFERENCES Departamento (idDepto)
);

-- Criando a tabela Projeto
CREATE TABLE Projeto(
	idProj INT PRIMARY KEY,
    nomeProj VARCHAR (50),
    localProj VARCHAR (50),
    fkDepto INT,
    FOREIGN KEY (fkDepto) REFERENCES Departamento (idDepto)
);

-- Criando a tabela FuncProj
CREATE TABLE FuncProj(
	fkFunc INT,
    fkProj INT,
    horas DECIMAL (3,1),
    FOREIGN KEY (fkFunc) REFERENCES Funcionario (idFunc),
    FOREIGN KEY (fkProj) REFERENCES Projeto (idProj),
    PRIMARY KEY (fkFunc, fkProj)
);

-- ______________________________________________________________________________________

-- Inserindo dados base na tabela Departamento
INSERT INTO Departamento (idDepto, nomeDepto, fkGerente, dataInicioGer)
	VALUES (105, 'Pesquisa', 2, '2008-05-22'),
			(104, 'Administração', 7, '2015-01-01'),
            (101, 'Matriz', 8, '2001-06-19');
            
-- Inserindo dados base na tabela Funcionário
INSERT INTO Funcionario (idFunc, nomeFunc, salario, sexo, fkSupervisor, dataNasc, fkDepto)
	VALUES (1, 'Joao Silva', 3500.00, 'm', 2, '1985-01-09', 105),
			(2, 'Fernando Wong', 4500.00, 'm', 8, '1975-12-08', 105),
            (3, 'Alice Sousa', 2500.00, 'f', 7, '1988-01-19', 104),
            (4, 'Janice Morais', 4300.00, 'f', 8, '1970-06-20', 104),
            (5, 'Ronaldo Lima', 3800.00, 'm', 1, '1982-09-15', 105),
            (6, 'Joice Leite', 2500.00, 'f', 1, '1992-07-31', 105),
            (7, 'Antonio Pereira', 2500.00, 'm', 4, '1989-03-29', 104),
            (8, 'Juliano Brito', 5500.00, 'm', null, '1957-11-10', 101);
            
-- -- Inserindo dados base na tabela Projeto
INSERT INTO Projeto (idProj, nomeProj, localProj, fkDepto)
	VALUES (1, 'Produto X', 'Santo André', 105),
			(2, 'Produto Y', 'Itu', 105),
            (3, 'Produto Z', 'São Paulo', 105),
            (10, 'Informatização', 'Mauá', 104),
            (20, 'Reorganização', 'São Paulo', 101),
            (30, 'Benefícios', 'Mauá', 104);
            
-- Inserindo dados base na tabela FuncProj
INSERT INTO FuncProj (fkFunc, fkProj, horas)
	VALUES (1, 1, 32.5),
			(1, 2, 7.5),
            (5, 3, 40.0),
            (6, 1, 20.0),
            (6, 2, 20.0),
            (2, 2, 10.0),
            (2, 3, 10.0),
            (2, 10, 10.0),
            (2, 20, 10.0),
            (3, 30, 30.0),
            (3, 10, 10.0),
            (7, 10, 35.0),
            (7, 30, 5.0),
            (4, 30, 20.0),
            (4, 20, 15.0),
            (8, 20, NULL);
            
select * from Departamento;
select * from Funcionario;
select * from Projeto;
select * from FuncProj;