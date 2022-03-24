-- Nome: Danylo Dias Gomes | RA: 02221004 | Lista de Exercício 04

-- Selecionando o Banco de Dados das Revistas
USE Revista;

-- Criando a Chave Estrangeira fkEditora na tabela Revista
ALTER TABLE Revista ADD COLUMN fkEditora INT;
ALTER TABLE Revista ADD FOREIGN KEY (fkEditora) REFERENCES Editora(idEditora);

-- Atualizando os dados da coluna fkEditora
UPDATE Revista SET fkEditora = 1000 WHERE idRevista IN (1, 3, 5, 6, 8);
UPDATE Revista SET fkEditora = 1001 WHERE idRevista IN (2, 7);
UPDATE Revista SET fkEditora = 1002 WHERE idRevista = 4;

-- Exibindo os dados da tabela Revista
SELECT * FROM Revista;

-- Exibindo os dados da tabela Revista e Editora
SELECT * FROM Revista, Editora WHERE idEditora = fkEditora;

-- Exibindo os dados da tabela Revista e Editora, porém somente de 1 Editora
SELECT * FROM Revista, Editora WHERE idEditora = fkEditora AND idEditora = 1000;

-- ______________________________________________________________________________________________________

-- Selecionando o banco Atleta
USE Atleta;

-- Criando a tabela Pais
CREATE TABLE Pais (
	idPais INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (100),
    capital VARCHAR (100)
);

-- Inserindo dados na tabela pais
INSERT INTO Pais (nome, capital)
	VALUES ('Brasil', 'Brasilia'),
			('Ucrania', 'Kiev'),
            ('Filipinas', 'Manila'),
            ('Suécia', 'Estocolmo'),
            ('Estados Unidos', 'Washington'),
            ('China', 'Pequim'),
            ('Rússia', 'Moscou'),
            ('Suiça', 'Berna'),
            ('Japão', 'Tóquio'),
            ('França', 'Paris');
            
-- Adicionando o campo fkPais na tabela atleta
ALTER TABLE atleta ADD COLUMN fkPais INT;
ALTER TABLE atleta ADD FOREIGN KEY (fkPais) REFERENCES Pais(idPais);

-- Linkando o pais ao atleta pela chave estrangeira
select * from pais, atleta;

UPDATE Atleta SET fkPais = 1 WHERE idAtleta IN (1, 6, 12);
UPDATE Atleta SET fkPais = 2 WHERE idAtleta = 2;
UPDATE Atleta SET fkPais = 3 WHERE idAtleta = 3;
UPDATE Atleta SET fkPais = 4 WHERE idAtleta = 4;
UPDATE Atleta SET fkPais = 5 WHERE idAtleta = 5;
UPDATE Atleta SET fkPais = 6 WHERE idAtleta = 7;
UPDATE Atleta SET fkPais = 7 WHERE idAtleta = 8;
UPDATE Atleta SET fkPais = 8 WHERE idAtleta = 9;
UPDATE Atleta SET fkPais = 9 WHERE idAtleta = 10;
UPDATE Atleta SET fkPais = 10 WHERE idAtleta = 11;

-- Selecionando os dados das tabelas Atleta e Pais que são correspondentes
SELECT * FROM Atleta, Pais WHERE idPais = fkPais;

-- Selecionando os dados das tabelas Atletas e Pais que são correspondentes, porém de somente 1 país
SELECT * FROM Atleta, Pais WHERE idPais = fkPais AND Pais.nome = 'Brasil';

-- ______________________________________________________________________________________________________

-- Selecionando o Banco Musica
USE Musica;

-- Criando a tabela Album
CREATE TABLE Album(
	idAlbum INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (70),
    gravadora VARCHAR (60)
);

-- Inserindo dados na tabela Album
INSERT INTO Album (nome, gravadora)
	VALUES ('8 Mile', 'Shady Records'),
			('The Eminem Show', 'Aftermath'),
            ('O Glorioso Retorno de Quem Nunca Esteve Aqui', 'Laboratório Fantasma'),
            ('Rise', 'Capitol'),
            ('Mylo Xyloto', 'Parlophone'),
            ('Dont Kill the Magic', 'RCA Records'),
            ('The Rise and Fall of Ziggy', 'Trident Studios'),
            ('Jazz', 'EMI'),
            ('#3', 'Epic');

-- Criando a fkAlbum
ALTER TABLE Musica ADD COLUMN fkAlbum INT;
ALTER TABLE Musica ADD FOREIGN KEY (fkAlbum) REFERENCES Album(idAlbum);

SELECT * FROM Musica, Album;

-- Inserindo valores a chave estrangeira
UPDATE Musica SET fkAlbum = 1 WHERE idMusica = 1;
UPDATE Musica SET fkAlbum = 2 WHERE idMusica = 2;
UPDATE Musica SET fkAlbum = 3 WHERE IdMusica = 3;
UPDATE Musica SET fkAlbum = 4 WHERE idMusica = 4;
UPDATE Musica SET fkAlbum = 5 WHERE idMusica = 5;
UPDATE Musica SET fkAlbum = 6 WHERE idMusica = 6;
UPDATE Musica SET fkAlbum = 7 WHERE idMusica = 7;
UPDATE Musica SET fkAlbum = 8 WHERE idMusica = 8;
UPDATE Musica SET fkAlbum = 9 WHERE idMusica = 9;

-- Exibindo os dados das músicas e albuns correspondetes
SELECT * FROM Musica, Album WHERE idAlbum = fkAlbum;

-- Exibindo os dados de uma musica e um album correspondete
SELECT * FROM Musica, Album WHERE idAlbum = fkAlbum AND Album.nome LIKE 'O Glorioso Retorno de Quem Nunca Esteve Aqui';

-- Exibindo os dados de musicas e albuns correspondetes de uma determinada gravadora
SELECT * FROM Musica, Album WHERE idAlbum = fkAlbum AND gravadora LIKE 'Capitol';

-- ______________________________________________________________________________________________________

-- Criando o banco Planilha
CREATE DATABASE Planilha;

-- Selecionando o banco Planilha
USE Planilha;

-- Criando a tabela Empresa
CREATE TABLE Empresa (
	cnpj CHAR(18) PRIMARY KEY,
    nomeEmpresa VARCHAR(15),
    representanteEmpresa VARCHAR(25)
);

-- Criando a tabela Instituição de Ensino
CREATE TABLE InstituicaoEnsino (
	idInstituicaoEnsino INT PRIMARY KEY,
    nomeInstituicaoEnsino VARCHAR(45),
    bairroInstituicaoEnsino VARCHAR(55)
);

-- Criando a tabela Aluno
CREATE TABLE Aluno (
	ra INT PRIMARY KEY,
    nome VARCHAR (80),
    hobby VARCHAR (50),
    fkCnpj CHAR(18),
    fkIdInstituicaoEnsino INT,
    FOREIGN KEY (fkCnpj) REFERENCES Empresa(cnpj),
    FOREIGN KEY (fkIdInstituicaoEnsino) REFERENCES InstituicaoEnsino(idInstituicaoEnsino)
);

-- Insert das empreas
INSERT INTO Empresa
	VALUES ('61.459.467/0001-99', 'C6 Bank', 'Ana'),
			('01.917.383/0001-20', 'Accenture', 'Claudio'),
            ('20.145.000/0001-97', 'Valemobi', 'Eduardo');

-- Insert das Instituições de Ensino            
INSERT INTO InstituicaoEnsino
	VALUES (045967, 'EE JD Pedra Branca', 'Cidade Tiradentes'),
			(147583, 'ETEC Guaianazes', 'Guaianases'),
            (756438, 'ETEC Cidade Tiradentes', 'Cidade Tiradentes'),
            (234869, 'EE Zalina', 'Penha');

-- Insert dos Alunos
INSERT INTO Aluno
	VALUES (02231056, 'Guilherme Santos de Souza', 'Video Game', '61.459.467/0001-99', 045967),
			(02231007, 'Ana Maria dos Santos', 'Trico', '01.917.383/0001-20', 147583),
            (02231033, 'Bernardo Gomes Dias', 'Futebol', '20.145.000/0001-97', 756438),
            (02231087, 'Eduardo Barbosa Gomes', 'Skate', '61.459.467/0001-99', 234869),
            (02231021, 'Pamela Dias Gomes', 'Cinema',  '61.459.467/0001-99', 234869);
            
-- Exibindo os dados dos alunos e instituições correspondentes
SELECT * FROM Aluno, InstituicaoEnsino WHERE fkIdInstituicaoEnsino = idInstituicaoEnsino;

-- Exibindo os dados dos alunos e das empresas correspondetes
SELECT * FROM Aluno, Empresa WHERE fkCnpj = cnpj;

-- Exibindo os dados dos alunos, das instituições de ensino e empresas correspondentes
SELECT * FROM Aluno, InstituicaoEnsino, Empresa WHERE fkIdInstituicaoEnsino = idInstituicaoEnsino AND fkCnpj = cnpj;
            
            