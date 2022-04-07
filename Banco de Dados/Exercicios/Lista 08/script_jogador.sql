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