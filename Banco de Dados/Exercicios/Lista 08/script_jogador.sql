-- Criando o Banco de Dados PraticaJogador
CREATE DATABASE PraticaJogador;

-- Selecionando o Banco de Dados PraticaJogador
USE PraticaJogador;

-- Criando a Tabela TimeF
CREATE TABLE TimeF (
	idTimeF INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (40),
    tecnico VARCHAR (75),
    dataFormacao DATE
);

-- Criando a Tabela Jogador
CREATE TABLE Jogador (
	idJogador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (75),
    posicao VARCHAR (20),
    salario DECIMAL (8,2),
    fkConselheiro INT,
    fkTimeF INT,
    FOREIGN KEY (fkConselheiro) REFERENCES Jogador (idJogador),
    FOREIGN KEY (fkTimeF) REFERENCES TimeF (idTimeF)
);

-- Criando a Tabela Seguidor
CREATE TABLE Seguidor (
	fkJogador INT,
    idSeguidor INT,
    nome VARCHAR (75),
    nickName VARCHAR (45),
    sexo CHAR (1) CHECK (sexo = 'M' OR sexo = 'F' OR sexo = 'N'),
    FOREIGN KEY (fkJogador) REFERENCES Jogador (idJogador),
    PRIMARY KEY (fkJogador, idSeguidor)
);

-- Inserindo Valores na Tabela Time
INSERT INTO TimeF (nome, tecnico, dataFormacao)
	VALUES ('Corinthians', 'Vitor Pereira', '1910-08-21'),
			('São Paulo', 'Rogério Ceni', '1935-06-14'),
			('Palmeiras', 'Abel Braga', '1906-04-01');
            
-- Inserindo Valores na Tabela Jogador
INSERT INTO Jogador (nome, posicao, salario, fkConselheiro, fkTimeF)
	VALUES ('Cássio', 'Goleiro', 65000.00, NULL, 1),
			('Roger Guedes', 'Atacante', 90000.00, 1 , 1),
            ('Dudu', 'Atacante', 78000.60, NULL, 2),
            ('Calleri', 'Atacante', 40000.00, NULL, 3);
            
-- Inserindo Valores na Tabela Seguidor
INSERT INTO Seguidor (fkJogador, idSeguidor, nome, nickName, sexo)
	VALUES (1, 1, 'Eduardo Batista', 'Duuh1910', 'M'),
			(1, 2, 'Matheus Silva', 'Th4us', 'M'),
            (3, 1, 'Amanda Nunes', 'Mandaah', 'F'),
            (4, 1, 'Carlos Eduardo', 'CarTricolor', 'M');
            
-- Exibindo os dados de todas as tabelas criadas, separadamente
SELECT * FROM TimeF;
SELECT * FROM Jogador;
SELECT * FROM Seguidor;

-- Exibindo os nomes dos times e dos tecnicos cujo time comece com determinada letra
SELECT nome, tecnico FROM TimeF WHERE nome LIKE 'C%';

-- Exibindo os jogadores em ordem decrescente pela posição
SELECT * FROM Jogador ORDER BY posicao DESC;

-- Exibindo os dados dos jogadores que joguem em uma determinada posição
SELECT * FROM Jogador WHERE posicao = 'Atacante';

-- Exibindo os dados dos times que tenham o tecnico com determinada penultima letra
SELECT * FROM TimeF WHERE tecnico LIKE '%g_';

-- Exibindo os dados dos times em ordem crescente pelo nome do técnico
SELECT * FROM TimeF ORDER BY tecnico;

-- Exibindo os dados dos times em ordem decrescente pela data de fundação do time
SELECT * FROM TimeF ORDER BY dataFormacao DESC;

-- Alterando posição de um jogador
UPDATE Jogador SET Posicao = 'Meia' WHERE idJogador = 3;

-- Exibindo os dados dos times e dos seus respectivos jogadores
SELECT * FROM TimeF, Jogador WHERE fkTimeF = idTimeF;

-- Exibindo os dados de um determinado time e dos seus respectivos jogadores
SELECT * FROM TimeF, Jogador WHERE fkTimeF = idTimeF AND TimeF.nome = 'Corinthians';

-- Exibir os dados dos jogadores e dos seu conselheiros
SELECT * FROM Jogador, Jogador AS Conselheiro WHERE Jogador.fkConselheiro = Conselheiro.idJogador;

-- Exibir os dados dos jogadores, dos seus conselheiros e dos seus times
SELECT * FROM Jogador, Jogador AS Conselheiro, TimeF WHERE Jogador.fkConselheiro = Conselheiro.idJogador AND Jogador.fkTimeF = idTimeF;

-- Exibir os dados de um jogador, usando o nome, do seu conselheiro e do seu time
SELECT * FROM Jogador, Jogador AS Conselheiro, TimeF WHERE Jogador.fkConselheiro = Conselheiro.idJogador AND Jogador.fkTimeF = idTimeF AND Jogador.nome = 'Roger Guedes';

-- Exibindo os dados dos jogadores e dos seus seguidores
SELECT * FROM Jogador, Seguidor WHERE idJogador = fkJogador;

-- Exibindo os dados de apenas um jogador e de seus seguidores (selecionar pelo nome)
SELECT * FROM Jogador, Seguidor WHERE idJogador = fkJogador AND Jogador.nome = 'Cássio';

-- Excluindo 1 jogador
DELETE FROM Jogador WHERE idJogador = 2;

-- Excluindo as Tabelas
DROP TABLE Seguidor;
DROP TABLE Jogador;
DROP TABLE TimeF;