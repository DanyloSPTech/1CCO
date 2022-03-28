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

-- Exibindo os dados dos clientes ordenados em ordem decrescente pelo bairro || MANDAR EMAIL
SELECT * FROM Cliente ORDER BY bairro DESC;

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