CREATE DATABASE Exemplo_tipo_relacionamento;

USE Exemplo_tipo_relacionamento;

CREATE TABLE Funcionario (
	idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nomeFuncionario VARCHAR(45),
    salario DECIMAL (7,2) CHECK (salario > 0),
    sexo CHAR (1) CHECK (sexo = 'M' OR sexo = 'F' OR sexo = 'N'),
    fkSupervisor INT,
    FOREIGN KEY (fkSupervisor) REFERENCES Funcionario(idFuncionario)
) AUTO_INCREMENT = 1000;

CREATE TABLE Dependente (
	fkFuncionario INT,
	idDependente INT,
    nomeDependente VARCHAR (45),
    dataNascimento DATE,
    tipo VARCHAR (45),
    PRIMARY KEY (fkFuncionario, idDependente),
    FOREIGN KEY (fkFuncionario) REFERENCES Funcionario(idFuncionario)
);

INSERT INTO Funcionario (nomeFuncionario, salario, sexo, fkSupervisor)
	VALUES ('João Nunes', 30000, 'M', NULL),
			('Cláudio Sousa', 20000, 'M', 1000),
            ('Ana Teixeira', 18000, 'F', 1000),
            ('Paulo Silva', 10000, 'M', 1001),
            ('Carol Rangel', 8000, 'F', 1002);
            
SELECT * FROM Funcionario;

INSERT INTO Dependente (fkFuncionario, idDependente, nomeDependente, dataNascimento, tipo)
	VALUES (1000, 1, 'Joana Nunes', '1990-03-04', 'Conjuge'),
			(1000, 2, 'Joaquim Nunes', '2020-07-01', 'Filho'),
            (1001, 1, 'Cláudia Sousa', '1997-08-10', 'Conjuge'),
            (1001, 2, 'Claudete Sousa', '2015-10-09', 'Filha'),
            (1002, 1, 'José Teixeira', '2000-05-03', 'Conjuge');
            
SELECT * FROM Dependente;

SELECT * FROM Funcionario, Dependente WHERE idFuncionario = fkFuncionario;
SELECT * FROM Funcionario, Dependente WHERE idFuncionario = fkFuncionario AND nomeFuncionario = 'João Nunes';

SELECT * FROM Funcionario AS Funcionario, Funcionario AS Supervisor WHERE Funcionario.fkSupervisor = Supervisor.idFuncionario;
SELECT * FROM Funcionario AS Funcionario, Funcionario AS Supervisor, Dependente WHERE Funcionario.fkSupervisor = Supervisor.idFuncionario AND Dependente.fkFuncionario = Funcionario.idFuncionario;