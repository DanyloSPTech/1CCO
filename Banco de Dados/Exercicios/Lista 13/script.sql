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
            
-- Configurando a chave estrangeira da tabela Departamento
ALTER TABLE Departamento ADD FOREIGN KEY (fkGerente) REFERENCES Funcionario (idFunc);

-- Configurando a chave estrangeira do supervisor na tabela Funcionario
ALTER TABLE Funcionario ADD FOREIGN KEY (fkSupervisor) REFERENCES Funcionario (idFunc);

-- __________________________________________________________________________________________________

-- 1-) Exibindo os dados de cada tabela separadamente
SELECT * FROM Departamento;
SELECT * FROM Funcionario;
SELECT * FROM Projeto;
SELECT * FROM FuncProj;

-- 2-) Inserindo funcionário exigido no exercicio
INSERT INTO Funcionario (idFunc, nomeFunc, salario, sexo, fkSupervisor, dataNasc, fkDepto)
	VALUES (NULL, 'Cecília Ribeiro', 2800, 'f', NULL, '1980-04-05', 104);
    
-- 3-) Inserindo funcionário exigido no exercicio
INSERT INTO Funcionario (idFunc, nomeFunc, salario, sexo, fkSupervisor, dataNasc, fkDepto)
	VALUES (3, 'Alice Sousa', 2800, 'f', 4, '1980-04-05', 104);
    
-- 4-) Inserindo funcionário exigido no exercicio
INSERT INTO Funcionario (idFunc, nomeFunc, salario, sexo, fkSupervisor, dataNasc, fkDepto)
	VALUES (9, 'Cecília Ribeiro', 2800, 'f', 4, '1980-04-05', 107);
    
-- 5-) Inserindo funcionário exigido no exercicio
INSERT INTO Funcionario (idFunc, nomeFunc, salario, sexo, fkSupervisor, dataNasc, fkDepto)
	VALUES (9, 'Cecília Ribeiro', 2800, 'f', 4, '1980-04-05', 104);
    
-- 6-) Excluindo o registro da tabela FuncProj em que o fkProj seja 10 e a fkFunc seja 3
DELETE FROM FuncProj WHERE fkProj = 10 AND fkFunc = 3;

-- 7-) Excluindo o registro da tabela Funcionario de idFunc = 4
DELETE FROM Funcionario WHERE idFunc = 4;

-- 8-) Excluindo o registro da tabela Funcionario de idFunc = 2
DELETE FROM Funcionario WHERE idFunc = 2;

-- 9-) Alterar o salário do funcionário 3 para 2800
UPDATE Funcionario SET salario = 2800 WHERE idFunc = 3;

-- 10-) Alterar o fkDepto do funcionario 3 para 101
UPDATE Funcionario SET fkDepto = 101 WHERE idFunc = 3;

-- 11-) Alterar o fkDepto do funcionario 3 para 107
UPDATE Funcionario SET fkDepto = 107 WHERE idFunc = 3;

-- 12-) Exibir a data de nascimnento e o salario do funcionario
SELECT nomeFunc, salario FROM Funcionario WHERE nomeFunc = 'Joao Silva';

-- 13-) Exiba uma lista dos salários de todos os funcionários
SELECT salario FROM Funcionario;

-- 14-) Exiba uma lista dos salários distintos de todos os funcionários
SELECT DISTINCT salario FROM Funcionario;

-- 15-) Exibir os dados dos funcionários ordenados pelo nome
SELECT * FROM Funcionario ORDER BY nomeFunc;

-- 16-) Exibir os dados dos funcionários ordenados pelo salário de forma decrescente
SELECT * FROM Funcionario ORDER BY salario DESC;