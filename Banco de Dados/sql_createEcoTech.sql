-- Criando o banco EcoTech
CREATE DATABASE EcoTech;

-- Selecionando o banco EcoTech
USE EcoTech;

-- Criando a tabela EnderecoEmpresa
CREATE TABLE EnderecoEmpresa (
	idEnderecoEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    cepEnderecoEmpresa CHAR (9),
    ruaEnderecoEmpresa VARCHAR (100),
    numEnderecoEmpresa VARCHAR (8),
    bairroEnderecoEmpresa VARCHAR (80),
    cidadeEnderecoEmpresa VARCHAR (80)
);

-- Criando a tabela Empresa
CREATE TABLE Empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nomeEmpresa VARCHAR (80),
    cnpjEmpresa CHAR (18),
    idEnderecoEmpresa INT -- Será a chave estrangeira que ligará a tabela de enredeço e a tabela empresa
);

-- Criando a tabela Lixeira
CREATE TABLE Lixeira (
	idLixeira INT PRIMARY KEY AUTO_INCREMENT,
    tipoLixeira VARCHAR (8),
    capacidadeLixeira VARCHAR (6),
    nivelLixeira INT,
    localizacaoLixeira VARCHAR (50),
    idEmpresa INT -- Será a chave estrangeria que ligará a tabela empresa e a tabela lixeira
);