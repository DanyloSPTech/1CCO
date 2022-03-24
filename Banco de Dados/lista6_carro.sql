-- Criando o Banco de Dados Carro
CREATE DATABASE Carro;

-- Selecionando o Banco de Dados Carro
USE Carro;

-- Criando as tabelas equivalentes à modelagem
CREATE TABLE Dono(
	idDono INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (75),
    dataNasc DATE,
    salario DOUBLE
);

CREATE TABLE Carro(
	idCarro INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR (45),
    marca VARCHAR (45),
	placa CHAR (8),
    anoFabricacao DATE,
    idDono INT,
    FOREIGN KEY (idDono) REFERENCES Dono(idDono)
) AUTO_INCREMENT = 101;

-- Inserindo dados nas tabelas Dono e Carro
INSERT INTO Dono (nome, dataNasc, salario)
	VALUES ('Fárbio Martin', '1983-03-09', 3650.00),
			('Lorena Silva', '1998-03-21', 2250.50),
            ('Henrique Cardoso', '1981-03-13', 1750.00);
            
INSERT INTO Carro (modelo, marca, placa, anoFabricacao, idDono)
	VALUES ('Gol', 'Volkswagen', 'SJF-5846', '2012-01-01', 2),
			('Uno', 'Fiat', 'GKF-4865', '2015-01-01', 3),
            ('Fox', 'Volkswagen', 'QIF-1367', '2010-01-01', 1),
            ('HB20', 'Hyundai', 'ABP-4563', '2013-01-01', 1),
            ('Uno', 'Fiat', 'SUG-4253', '2014-01-01', 2);
            
-- Exibindo os dados cadastrados separadamente
SELECT * FROM Dono;
SELECT * FROM Carro;

-- Exibindo os dados dos donos ordenados pela data de nascimento
SELECT * FROM Dono ORDER BY dataNasc;

-- Exibindo os dados dos carros ordenados pelo ano de fabricação em ordem decrescente
SELECT * FROM Carro ORDER BY anoFabricacao DESC;

-- Exibindo os dados dos carros cuja placa termine com determinado número
SELECT * FROM Carro WHERE placa LIKE '%6';

-- Exibindo os carros que são de uma determinada marca
SELECT * FROM Carro WHERE marca = 'Volkswagen';

-- Exibindo a descrição da tabela carro
DESCRIBE Carro;

-- Aumentado a coluna modelo da tabela carro
ALTER TABLE Carro MODIFY COLUMN modelo VARCHAR(75);

-- Exibindo novamente a descrição da tabela carro para verificar alteração
DESCRIBE Carro;

-- Alterando o salário de algum dono e exibindo a tabela novamente
UPDATE Dono SET salario = 2780.00 WHERE idDono = 2;
SELECT * FROM Dono;

-- Exibindo os dados dos carros e seus respectivos donos
SELECT * FROM Carro, Dono WHERE Dono.idDono = Carro.idDono;

-- Exibindo os dados dos carro e de um respectivo dono especifico
SELECT * FROM Carro, Dono WHERE Dono.idDono = Carro.idDono AND nome = 'Lorena Silva';

-- Exibindo os dados dos carros e seus respectivos donos, mas de uma determinada marca de carro
SELECT * FROM Carro, Dono WHERE Dono.idDono = Carro.idDono AND marca = 'Volkswagen';

-- Exibindo os dados dos carros e seus respectivos donos, mas que a placa comece com uma determinada letra
SELECT * FROM Carro, Dono WHERE Dono.idDono = Carro.idDono AND placa LIKE 'A%';

-- Excluindo as tabelas
DROP TABLE Carro;
DROP TABLE Dono;