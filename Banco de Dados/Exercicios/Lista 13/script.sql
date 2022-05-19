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

-- 17-) Exibir os dados dos funcionários que tenham salario entre 2000 e 4000
SELECT * FROM Funcionario WHERE salario >= 2000 AND salario <= 4000;

-- 18-) Exibindo os nomes e os salários dos funcionários cujo o nome começam com J
SELECT nomeFunc, salario FROM Funcionario WHERE nomeFunc LIKE 'J%';

-- 19-) Exibindo os nomes e os salários dos funcionários cujo o nome terminam com a letra a
SELECT nomeFunc, salario FROM Funcionario WHERE nomeFunc LIKE '%a';

-- 20-) Exibir o nome dos funcionários cujo a terceira letra do nome seja N
SELECT nomeFunc FROM Funcionario WHERE nomeFunc LIKE '__N%';

-- 21-) Exibindo os nomes e as datas de nascimento dos funcionários cujos nomes tenham a letra S como a 5 letra de tras pra frente
SELECT nomeFunc, dataNasc FROM Funcionario WHERE nomeFunc LIKE '%S____';

-- 22-) Exibindo os dados dos funcionarios que trabalham no departamento de pesquisa
SELECT * FROM Funcionario WHERE fkDepto = 105;

-- 23-) Exibindo os dados dos funcionários que trabalham no departamento de pesquisa e que tenham salário acima de 3500
SELECT * FROM Funcionario WHERE fkDepto = 105 AND salario > 3500;

-- 24-) Exibindo os dados dos funcionários que trabalham no departamento de pesquisa e que tenham o nome inicial com J
SELECT * FROM Funcionario WHERE fkDepto = 105 AND nomeFunc LIKE 'J%';

-- 25-) Exibindo o idFunc e nome dos funcionarios com o idFunc e nome dos supervisores correspondentes
SELECT Funcionario.idFunc, Funcionario.nomeFunc, Supervisor.idFunc AS idSupervisor, Supervisor.nomeFunc AS nomeSupervisor FROM Funcionario, Funcionario AS Supervisor WHERE Supervisor.idFunc = Funcionario.fkSupervisor;

-- 26-) Exibir para cada projeto localizado em São Paulo, o idProj do projeto, o número do departamento que o controla, o nome e a data de nascimento do gerente do departamento
SELECT idProj, Projeto.fkDepto, nomeFunc, dataNasc FROM Projeto, Departamento, Funcionario, FuncProj WHERE FuncProj.fkProj = Projeto.idProj AND FuncProj.fkFunc = Funcionario.idFunc AND Departamento.idDepto = Projeto.fkDepto AND Departamento.fkGerente = Funcionario.idFunc AND Projeto.localProj = 'São Paulo';

-- 27-) Exibir o idFunc e o nome do funcionário, o projeto e o nome do projeto em que trabalha, e a quantidade de horas que trabalha nesse projeto.
SELECT idFunc, nomeFunc, idProj, nomeProj, horas FROM Projeto, Funcionario, FuncProj WHERE idFunc = FuncProj.fkFunc AND idProj = FuncProj.fkProj;

-- 28-) Exibir os nomes dos funcionários que nasceram antes de 1980
SELECT nomeFunc FROM Funcionario WHERE dataNasc < '1980-01-01';

-- 29-) Exibir a quantidade de salários diferentes que existem na empresa
SELECT COUNT(DISTINCT salario) AS 'Qtde Salários Diferentes' FROM Funcionario;

-- 30-) Exibir a quantidade de locais diferentes de projeto
SELECT COUNT(DISTINCT localProj) AS 'Qtde Locais Diferentes' FROM Projeto;

-- 31-) Exibir o salário médio da empresa e a soma dos salários
SELECT AVG(salario) AS 'Média dos Salários', SUM(salario) AS 'Soma dos Salários' FROM Funcionario;

-- 32-) Exibir o menor e o maior salário da empresa
SELECT MAX(salario) AS 'Maior Salário', MIN(salario) AS 'Menor Salário' FROM Funcionario;

-- 33-) Exibir o idDepto, o salário médio e a soma do salário de cada departamento (agrupado por departamento)
SELECT idDepto, AVG(salario) AS 'Salário Médio', SUM(salario) AS 'Soma dos Salários' FROM Departamento, Funcionario WHERE fkDepto = idDepto GROUP BY idDepto;

-- 34-) Exibir o idDepto, o menor e o maior salário de cada departamento (agrupado por departamento)
SELECT idDepto, MIN(salario) AS 'Menor Salário', MAX(salario) AS 'Maior Salário' FROM Departamento, Funcionario WHERE fkDepto = idDepto GROUP BY idDepto;

-- 35-) Inserindo funcionarios exigidos na questão
INSERT INTO Funcionario (idFunc, nomeFunc, salario, sexo, fkSupervisor, dataNasc, fkDepto)
	VALUES (10, 'José da Silva', 1800, 'm', 3, '2000-10-12', NULL),
			(11, 'Benedito Almeida', 1200, 'm', 5, '2001-09-01', NULL);
            
-- 36-) Inserindo departamento exigido na questão
INSERT INTO Departamento (idDepto, nomeDepto, fkGerente, dataInicioGer)
	VALUES (110, 'RH', 3, '2018-11-10');
    
-- 37-) Exibir os funcionários e seus departamentos correspondentes, inclusive os que não estão alocados em nenhum departamento
SELECT * FROM Funcionario LEFT JOIN Departamento ON fkDepto = idDepto;

-- 38-) Exibir os funcionários e seus departamentos correspondentes, inclusive os departamentos que não tem funcionários alocados
SELECT * FROM Funcionario RIGHT JOIN Departamento ON fkDepto = idDepto;