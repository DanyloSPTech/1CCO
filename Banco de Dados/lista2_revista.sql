-- Nome: Danylo Dias Gomes | RA: 02221004

-- Criando o Banco de Dados
CREATE DATABASE Revista;

-- Selecionando o banco Revista
USE Revista;

-- Criando a tabela Revista
CREATE TABLE Revista (
	idRevista INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (40),
    categoria VARCHAR (30)
);

-- Inserindo 4 valores na tabela
INSERT INTO Revista (nome)
	VALUES ('Veja'),
			('Isto é'),
            ('Quatro Rodas'),
			('Época');
            
-- Selecionando os dados na tabela
SELECT * FROM Revista;

-- Atualizando os dados de 3 registros da tabela revistas e selecionando novamente
UPDATE Revista SET categoria = 'Política' WHERE idRevista = 1;
UPDATE Revista SET categoria = 'Notícias' WHERE idRevista IN (2,4);

SELECT * FROM Revista;

-- Inserindo mais 3 registros
INSERT INTO Revista (nome, categoria)
	VALUES ('Placar', 'Esportes'), 
			('Superinteressante', 'Científica'),
            ('Nature', 'Científica');
            
-- Exibindo os dados da tabela novamente
SELECT * FROM Revista;

-- Exibindo a descrição da estrutura da tabela
DESCRIBE Revista;

-- Alterando a tabela para que a coluna categoria tenha 40 caracteres
ALTER TABLE Revista MODIFY COLUMN categoria VARCHAR(40);

-- Exibindo a descrição da tabela novamente para verificar se a alteração deu certo
DESCRIBE Revista;

-- Alterando o nome da coluna nome para nomeRevista
ALTER TABLE Revista RENAME COLUMN nome TO nomeRevista;

-- Exibindo os dados da tabela para verificar se a alteração deu certo
SELECT * FROM Revista;

-- Adicionando a coluna periodicamente a tabela revista
ALTER TABLE Revista ADD COLUMN periodicamente VARCHAR(15);

-- Selecionando os dados na tabela
SELECT * FROM Revista;

-- Atualizando a tabela para preencher a coluna periodicamente e exibindo novamente os dados da tabela
UPDATE Revista SET periodicamente = 'Mensal' WHERE idRevista IN (3, 5, 6);
UPDATE Revista SET periodicamente = 'Semanal' WHERE idRevista IN (1, 2, 4, 7);

SELECT * FROM Revista;

-- Inserindo os dados de uma nova revista e exibindo os dados da tabela novamente
INSERT INTO Revista (nomeRevista, categoria, periodicamente)
	VALUES ('Guia do Estudante', 'Guia', 'Mensal');
    
SELECT * FROM Revista;

-- Excluir o campo periodicamente da tabela
ALTER TABLE Revista DROP COLUMN periodicamente;

SELECT * FROM Revista;

-- Criando a tabela editora
CREATE TABLE Editora (
	idEditora INT PRIMARY KEY AUTO_INCREMENT,
    nomeEditora VARCHAR(40),
    dataFund DATE
) AUTO_INCREMENT = 1000 ;

-- Inserindo dados na tabela editora
INSERT INTO Editora (nomeEditora, dataFund)
	VALUES ('Editora Abril', '1950-01-01'),
			('Editora Três', '1972-01-01'),
            ('Editora Globo', '1986-01-01');