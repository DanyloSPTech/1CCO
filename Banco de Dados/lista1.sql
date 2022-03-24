-- Nome: Danylo Dias Gomes | RA: 02221004

-- Criando o Banco de Dados Atleta
CREATE DATABASE Atleta;

USE Atleta;

-- Criando a Tabela Atleta
CREATE TABLE Atleta (
	idAtleta INT PRIMARY KEY,
    nome VARCHAR (40),
    modalidade VARCHAR (40),
    qtdMedalha INT
);

-- Inserindo dados na Tabela Atleta
INSERT INTO Atleta VALUES (1, 'Hebert Conceição', 'Boxe', 4),
							(2, 'Oleksandr Khyzhniak', 'Boxe', 2),
							(3, 'Eumir Marcial', 'Boxe', 1),
                            (4, 'Armand Duplantis', 'Salto com Vara', 6),
                            (5, 'Christopher Nilsen', 'Salto com Vara', 3),
                            (6, 'Thiago Braz', 'Salto com Vara', 2),
                            (7, 'Yang Qian', 'Tiro Esportivo', 8),
                            (8, 'Anastasiia Galashina', 'Tiro Esportivo', 5),
                            (9, 'Nina Christen', 'Tiro Esportivo', 6),
                            (10, 'Shori Hamada', 'Judô', 5),
                            (11, 'Madeleine Malonga', 'Judô', 3),
                            (12, 'Mayra Aguiar', 'Judô', 2);
                            
-- Select de todos os itens da tabela
SELECT * FROM Atleta;

-- Select dos nomes e medalhas dos atletas
SELECT nome, qtdMedalha FROM Atleta;

-- Select das modalidades e nomes dos atletas
SELECT modalidade, nome FROM Atleta;

-- Select dos dados dos atletas de uma determinada modalidade
SELECT * FROM Atleta WHERE modalidade LIKE 'Tiro Esportivo';

-- Select dos atletas com 3 medalhas ou mais
SELECT * FROM Atleta WHERE qtdMedalha >= 3;

-- Select dos atletas cujo o ID seja menor que um determinado valor
SELECT * FROM Atleta WHERE idAtleta < 6;

-- Select dos nomes dos atletas de uma determinada modalidade
SELECT nome FROM Atleta WHERE modalidade LIKE 'Boxe';

-- Select dos atletas que os IDs estão entre um determinado valor
SELECT * FROM Atleta WHERE idAtleta BETWEEN 3 AND 7;

-- Select dos atletas cujo o ID é diferente de um determinado valor
SELECT * FROM Atleta WHERE idAtleta NOT LIKE 6;

-- Select dos atletas ornados pela modalidade
SELECT * FROM Atleta ORDER BY modalidade;

-- Select dos aleteas ordenados pela quantidade de medalhas em ordem decrescente
SELECT * FROM Atleta ORDER BY qtdMedalha DESC;

-- Select dos atletas com certa letra em seus nomes
SELECT * FROM Atleta WHERE nome LIKE '%d%';

-- Select dos atletas que o nome comecem com determinada letra
SELECT * FROM Atleta WHERE nome LIKE 's%';

-- Select dos atletas que o nome terminem com determinada letra
SELECT * FROM Atleta WHERE nome LIKE '%z';

-- Select dos atletas cujo a penultina letra do nome seja uma determinada letra
SELECT * FROM Atleta WHERE nome LIKE '%a_';

-- Alterando a quantidade de medalhas de um atleta
UPDATE Atleta SET qtdMedalha = 12 WHERE idAtleta = 10;
SELECT * FROM Atleta WHERE idAtleta = 10;

-- Alterando o nome e a quantidade de medalhas de um atleta
UPDATE Atleta SET nome = 'Anna-Maria Wagner', qtdMedalha = 1 WHERE idAtleta = 12;
SELECT * FROM Atleta WHERE idAtleta = 12;

-- Excluindo um determinado atleta
DELETE FROM Atleta WHERE idAtleta = 3;
SELECT * FROM Atleta;

-- Excluindo a tabela
DROP TABLE Atleta;

-- Criando o Banco de Dados Musica
CREATE DATABASE Musica;

-- Usando o banco de dados Musica
USE Musica;

-- Criando a tabela Musica
CREATE TABLE Musica (
	idMusica INT PRIMARY KEY,
    titulo VARCHAR (40),
    artista VARCHAR (40),
	genero VARCHAR (40)
);

-- Inserindo os dados na tabela musica
INSERT INTO Musica VALUES (1, 'Lose Yourself', 'Eminem', 'Rap'),
							(2, 'Without Me', 'Eminem', 'Rap'),
                            (3, 'Levanta e Anda', 'Emicida', 'Rap'),
                            (4, 'Rise', 'Katy Perry', 'POP'),
                            (5, 'Paradise', 'Coldplay', 'POP'),
                            (6, 'Rude', 'Magic!', 'POP'),
                            (7, 'Starman', 'David Bowie', 'Rock'),
                            (8, 'Dont Stop me Now', 'Queen', 'Rock'),
                            (9, 'Hall of Fame', 'The Script', 'Rock');
                            
-- Exibindo todos os dados da tabela
SELECT * FROM Musica;

-- Exibindo os titulos e os nomes dos artistas
SELECT titulo, artista FROM Musica;

-- Exibindo os generos e os artistas
SELECT genero, artista FROM Musica;

-- Exibindo os dados das musicas de um determinado genero
SELECT * FROM Musica WHERE genero LIKE 'Rap';

-- Exibindo os dados das musicas de um determinado artista
SELECT * FROM Musica WHERE artista LIKE 'Eminem';

-- Exibindo os titulos das musicas de um determinado genero
SELECT titulo FROM Musica WHERE genero LIKE 'Rock';

-- Exibindo os titulos das musicas e o genero de um determinado artista
SELECT titulo, genero FROM Musica WHERE artista LIKE 'Eminem';

-- Exibindo os dados das musicas cujo ID esteja entre um determinado valor
SELECT * FROM Musica WHERE idMusica BETWEEN 3 AND 8;

-- Exibir os dados das musicas cujo ID seja menor ou igual a um valor
SELECT * FROM Musica WHERE idMusica <= 6;

-- Exibir os dados das musicas cujo ID seja maior que um valor
SELECT * FROM Musica WHERE idMusica > 4;

-- Exibir os dados das musicas cujo ID sejam diferentes de 2 valores
SELECT * FROM Musica WHERE idMusica <> 6 AND idMusica <> 7;

-- Exibir os dados da tabela ordenados pelo título da música
SELECT * FROM Musica ORDER BY titulo;

-- Exibir os dados da tabela ordenados pelo artista em ordem decrescente
SELECT * FROM Musica ORDER BY artista DESC;

-- Exibir os dados da tabela cujo o titulo comece com uma determinada letra
SELECT * FROM Musica WHERE titulo LIKE 'S%';

-- Exibir os dados da tabela cujo nome do artista termine com uma determinada letra
SELECT * FROM Musica WHERE artista LIKE '%Y';

-- Exibir os dados da tabela cujo gênero tenha uma segunda letra como determinada letra
SELECT * FROM Musica WHERE genero LIKE '_A%';

-- Exibir os dados da tabela cujo titulo da musica tenha a penultima letra como determinada letra
SELECT * FROM Musica WHERE titulo LIKE '%S_';

-- Altere o gênero de uma música
UPDATE Musica SET genero = 'POP' WHERE idMusica = 9;
SELECT * FROM Musica;

-- Altere o nome do artista e o gênero de uma música
UPDATE Musica SET artista = 'Magic', titulo = 'RUDE' WHERE idMusica = 6;
SELECT * FROM Musica;

-- Exclua uma música da tabela
DELETE FROM Musica WHERE idMusica = 5;
SELECT * FROM Musica;

-- Elimine a tabela
DROP TABLE Musica;