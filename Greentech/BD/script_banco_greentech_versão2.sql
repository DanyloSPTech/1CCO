-- Banco de dados Greentech | Modelagem e Script por: Danylo Dias Gomes

-- Criando o banco de dados
CREATE DATABASE Greentech;

-- Selecionando o banco de dados
USE Greentech;

-- Criando a tabela Empresa
CREATE TABLE Empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nomeEmpresa VARCHAR (80) NOT NULL,
    CNPJ CHAR (14) NOT NULL
) AUTO_INCREMENT = 100;

-- Criando a tabela Controle
CREATE TABLE Controle (
	idControle INT PRIMARY KEY AUTO_INCREMENT,
    minTemperatura DECIMAL (5,2) NOT NULL,
    maxTemperatura DECIMAL (5,2) NOT NULL,
    minUmidade DECIMAL (5,2) NOT NULL,
    maxUmidade DECIMAL (5,2) NOT NULL
);

-- Criando a tabela Gestor
CREATE TABLE Gestor (
	idGestor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (75) NOT NULL,
    email VARCHAR (45) NOT NULL,
    telefone CHAR (11),
    Senha VARCHAR (45) NOT NULL,
    fkEmpresa INT,
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);

-- Criando a tabela Estufa
CREATE TABLE Estufa (
	idEstufa INT PRIMARY KEY AUTO_INCREMENT,
    nomeEstufa VARCHAR (75) NOT NULL,
    tamanho VARCHAR (20) NOT NULL,
    tipo VARCHAR (45),
    fkEmpresa INT NOT NULL,
    fkControle INT NOT NULL,
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
    FOREIGN KEY (fkControle) REFERENCES Controle(idControle)
);

-- Criando a tabela ControleTemperatura
CREATE TABLE ControleTemperatura (
	fkEstufa INT NOT NULL,
    idControleTemperatura INT NOT NULL,
    localizacao VARCHAR(45),
    FOREIGN KEY (fkEstufa) REFERENCES Estufa(idEstufa),
    PRIMARY KEY (fkEstufa, idControleTemperatura)
);

-- Criando a tabela Endereco
CREATE TABLE Endereco (
	fkEstufa INT NOT NULL,
    idEndereco INT NOT NULL,
    rua VARCHAR (75) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(75) NOT NULL,
    cep CHAR(9) NOT NULL,
    cidade VARCHAR(75) NOT NULL,
    estado VARCHAR(55) NOT NULL,
    FOREIGN KEY (fkEstufa) REFERENCES Estufa(idEstufa),
    PRIMARY KEY (fkEstufa, idEndereco)
);

-- Criando a tabela Irrigador
CREATE TABLE Irrigador (
	fkEstufa INT NOT NULL,
    idIrrigador INT NOT NULL,
    localizacao VARCHAR(45),
    FOREIGN KEY (fkEstufa) REFERENCES Estufa(idEstufa),
    PRIMARY KEY (fkEstufa, idIrrigador)
);

-- Criando a tabela Monitoramento
CREATE TABLE Monitoramento (
	fkEstufa INT NOT NULL,
	idMonitoramento INT NOT NULL,
    temperatura DECIMAL (5,2),
    umidade DECIMAL (5,2),
    hora TIME,
    dataMonitoramento DATE,
    FOREIGN KEY (fkEstufa) REFERENCES Estufa(idEstufa),
    PRIMARY KEY (fkEstufa, idMonitoramento)
);

-- Criando a tabela Alerta
CREATE TABLE Alerta (
	idAlerta INT PRIMARY KEY AUTO_INCREMENT,
    tipoAlerta VARCHAR (45) NOT NULL,
    fkMonitoramento INT NOT NULL,
    fkControle INT NOT NULL,
    FOREIGN KEY (fkMonitoramento) REFERENCES Monitoramento(fkEstufa, idMonitoramento) -- ???
);