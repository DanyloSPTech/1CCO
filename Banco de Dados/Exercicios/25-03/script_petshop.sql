-- Criando o banco de dados PetShop
CREATE DATABASE PetShop;

-- Selecionando o banco de dados PetShop
USE PetShop;

-- Criando a tabela Cliente
CREATE TABLE Cliente (
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (45),
    telefoneFixo VARCHAR (12),
    telefoneCelular VARCHAR (13)
);

-- Criando a tabela EnderecoCliente
CREATE TABLE EnderecoCliente (
	idEnderecoCliente INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR (45),
    numero INT,
    bairro VARCHAR (45),
    cep CHAR (9),
    cidade VARCHAR (45),
    estado VARCHAR (45),
    fkCliente INT,
    FOREIGN KEY (fkCliente) REFERENCES Cliente (idCliente)
);

-- Criando a tabela Pet
CREATE TABLE Pet(
	idPet INT PRIMARY KEY AUTO_INCREMENT,
    tipoPet VARCHAR (45),
    nome VARCHAR (45),
    raca VARCHAR (45),
    peso DECIMAL (4,2) CHECK (peso > 0),
    fkCliente INT,
    FOREIGN KEY (fkCliente) REFERENCES Cliente (idCliente)
)AUTO_INCREMENT = 101;

-- Inserindo dados na tabela cliente
INSERT INTO Cliente (nome, telefoneFixo, telefoneCelular)
	VALUES ('Thales da Silva', '11 2763-0397', '11 98862-9755'),
			('Débora Moraes de Assis', '11 2910-3214', '11 99492-3440'),
            ('Francisco Antonio de Souza', '11 3884-0415', '11 98218-0121');
            
-- Inserindo dados na tabela de endereço dos clientes
INSERT INTO EnderecoCliente (logradouro, numero, bairro, cep, cidade, estado, fkCliente)
	VALUES ('Rua Vicente Batista Neto', 514, 'Jardim Angélica', '06365-580', 'Carapicuíba', 'São Paulo', 1),
			('Rua Jacques Legrand', 657, 'Jardim Esmeralda', '04828-030', 'São Paulo', 'São Paulo', 2),
            ('Rua Trindade', 625, 'Jardim São João', '02365-011', 'São Paulo', 'São Paulo', 3);
            
-- Inserindo dados na tabela Pet
INSERT INTO Pet (tipoPet, nome, raca, peso, fkCliente)
	VALUES ('Gato', 'Norman', 'Siamês', 4.30, 1),
			('Cachorro', 'Hachiko', 'Akita Inu', 48.50, 1),
            ('Hamster', 'Hamtaro', 'Dourado', 0.15, 2),
            ('Gato', 'Shamisen', 'Himalaio', 4.35, 3);
            
-- Exibindo os dados de todas as tabelas
SELECT * FROM Pet;
SELECT * FROM Cliente;
SELECT * FROM EnderecoCliente;

-- Alterando o tamanho da coluna nome do cliente
ALTER TABLE Cliente MODIFY COLUMN nome VARCHAR (75);

-- Exibindo os dados dos pets que são de um determinado tipo
SELECT * FROM Pet WHERE tipoPet = 'Gato';

-- Exibindo apenas os nomes e os pesos dos pets
SELECT nome, peso FROM Pet;

-- Exibindo os dados dos pets ordenados em ordem crescente pelo nome
SELECT * FROM Pet ORDER BY nome;

-- Exibindo os dados dos clientes ordenados em ordem decrescente pelo bairro
SELECT * FROM Cliente, EnderecoCliente WHERE idCliente = fkCliente ORDER BY bairro DESC;

-- Exibindo os dados dos pets cujo o nome comecem com determinada letra
SELECT * FROM Pet WHERE nome LIKE 'S%';

-- Exibindo os dados dos clientes que tenham determinado sobrenome
SELECT * FROM Cliente WHERE nome LIKE '%Souza%';

-- Alterando o telefone de um determinado cliente
UPDATE Cliente SET telefoneFixo = '11 2558-6792' WHERE idCliente = 2;

-- Exibindo os dados dos clientes para verificar se alterou
SELECT * FROM Cliente;

-- Exibindo os dados dos pets e seus respectivos donos
SELECT * FROM Pet, Cliente WHERE fkCliente = idCliente;

-- Exibindo os dados dos pets e seus respectivos donos, porém somente de um dono usando o nome
SELECT * FROM Pet, Cliente WHERE fkCliente = idCliente AND Cliente.nome = 'Francisco Antonio de Souza';

-- Exibindo os dados dos pets e seus respectivos donos, porém somente de um dono usando o telefone
SELECT * FROM Pet, Cliente WHERE fkCliente = idCliente AND telefoneFixo = '11 2763-0397';

-- Excluindo algum pet
DELETE FROM Pet WHERE idPet = 103;

-- Exibindo os dados para verificar se excluiu
SELECT * FROM Pet;

-- Excluindo as tabelas
DROP TABLE EnderecoCliente;
DROP TABLE Pet;
DROP TABLE Cliente;

-- _____________________________________________________________________________________________________________________________________

-- Criando o banco de dados Gastos
CREATE DATABASE Gastos;

-- Selecionando o banco de dados Gastos
USE Gastos;

-- Criando a tabela Pessoa
CREATE TABLE Pessoa(
	idPessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (75),
    dataNasc DATE,
    profissao VARCHAR (45),
    segundoIdioma VARCHAR (20),
    terceiroIdioma VARCHAR (20)
);

-- Criando a tabela Gasto
CREATE TABLE Gasto(
	idGasto INT PRIMARY KEY AUTO_INCREMENT,
    dataGasto DATE,
    valor DECIMAL (6,2) CHECK (valor > 0),
    descricao VARCHAR (45),
    fkPessoa INT,
    FOREIGN KEY (fkPessoa) REFERENCES Pessoa (idPessoa)
);

-- Inserindo dados na tabela Pessoa
INSERT INTO Pessoa (nome, dataNasc, profissao, segundoIdioma, terceiroIdioma)
	VALUES ('Pedro Otávio', '1989-07-21', 'Designer', 'Inglês', 'Mandarim'),
			('Heloisa Porto', '1997-04-03', 'Engenheira Ambiental', 'Espanhol', NULL),
            ('Sandra Carolina', '1994-09-05', 'Contadora', NULL, NULL);
            
INSERT INTO Gasto (dataGasto, valor, descricao, fkPessoa)
	VALUES ('2022-03-15', 2.00, 'Casquinha de Sorvete', 3),
			('2022-03-18', 32.00, 'Conta Restaurante BS', 2),
            ('2022-03-02', 58.00, 'Camiseta Preta', 1),
            ('2022-02-27', 158.50, 'Moletom Branco', 1),
            ('2022-03-25', 1250.80, 'Tênis Air Jordan 1 Retro High', 2);

-- Exiba os dados de cada tabela individualmente
SELECT * FROM Pessoa;
SELECT * FROM Gasto;

-- Exiba os dados da tabela pessoa, filtrando por algum dado
SELECT * FROM Pessoa WHERE profissao = 'Designer';

-- Exiba os dados da tabela gastos de forma que os gastos mais recentes apareçam primeiro
SELECT * FROM Gasto ORDER BY dataGasto DESC;

-- Exiba as pessoas e os gastos correspondentes
SELECT * FROM Pessoa, Gasto WHERE idPessoa = fkPessoa;

-- Exiba os dados de uma pessoa e seus gastos
SELECT * FROM Pessoa, Gasto WHERE idPessoa = fkPessoa AND nome = 'Pedro Otávio';

-- Exiba os dados das pessoas e os gastos correspondentes, mas apenas de uma determinada data
SELECT * FROM Pessoa, Gasto WHERE idPessoa = fkPessoa AND dataGasto = '2022-03-25';

-- Atualize valores já inseridos na tabela
UPDATE Pessoa SET terceiroIdioma = 'Inglês' WHERE idPessoa = 2;
UPDATE Gasto SET valor = 2.50 WHERE idGasto = 1;

SELECT * FROM Pessoa;
SELECT * FROM Gasto;

-- Exclua um ou mais registros de alguma tabela
DELETE FROM Gasto WHERE idGasto IN (3, 5);
SELECT * FROM Gasto;