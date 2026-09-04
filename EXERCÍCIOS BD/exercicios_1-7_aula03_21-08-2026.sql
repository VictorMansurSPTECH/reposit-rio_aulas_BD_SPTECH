/*
EXERCICIO 01
CREATE DATABASE game_store;
USE game_store;

CREATE TABLE jogo(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(30) DEFAULT 'NOME NÃO INSERIDO',
diretor VARCHAR(30) NOT NULL,
genero VARCHAR(30) NOT NULL,
data_lancamento DATE,
nota INT,
CONSTRAINT CHKnota CHECK(NOTA > 0 AND NOTA <= 10)
);
INSERT INTO jogo (nome, diretor, genero, data_lancamento, nota) VALUES
('The Legend of Zelda', 'Eiji Aonuma', 'Aventura', '2017-03-03', 10),
('God of War', 'Cory Barlog', 'Ação', '2018-04-20', 10),
('Hollow Knight', 'Ari Gibson', 'Metroidvania', '2017-02-24', 9),
('Elden Ring', 'Hidetaka Miyazaki', 'RPG', '2022-02-25', 10),
('Stardew Valley', 'Eric Barone', 'Simulação', '2016-02-26', 9);


ALTER TABLE jogo ADD COLUMN tipo_midia VARCHAR(40), ADD CONSTRAINT CHK_tipo_midea CHECK( tipo_midia in ('fisica', 'digital'));

UPDATE JOGO SET tipo_midia = 'fisica' WHERE ID = 1;
UPDATE JOGO SET tipo_midia = 'fisica' WHERE ID = 2;
UPDATE JOGO SET tipo_midia = 'digital' WHERE ID = 3;
UPDATE JOGO SET tipo_midia = 'digital' WHERE ID = 4;
UPDATE JOGO SET tipo_midia = 'digital' WHERE ID = 5;

SELECT * FROM JOGO;

SELECT * FROM JOGO WHERE data_lancamento > "2015-01-01";

SELECT * FROM JOGO WHERE NOME LIKE "%a%" and tipo_midia ='fisica';

SELECT * FROM JOGO WHERE NOME NOT LIKE "%e%";

ALTER TABLE JOGO ADD CONSTRAINT CHK_NOTAS CHECK( NOTA between 0 AND 10);

SELECT * FROM JOGO WHERE qtd_estoque > 0;

DELETE FROM JOGO WHERE QTD_ESTOQUE = 0;

ALTER TABLE JOGO RENAME COLUMN DIRETOR TO CRIADOR;

SELECT * FROM JOGO

*/
/*
-- EXERCICIO 02

CREATE DATABASE olimpiadas;
USE olimpiadas;

CREATE TABLE esportes (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40),
categoria VARCHAR(40), CONSTRAINT CHK_categoria CHECK(CATEGORIA IN ('Individual','Coletivo')),
num_jogadores INT , CONSTRAINT CHK_num_jogadore CHECK (num_jogadores BETWEEN 0 AND 6),
estreia DATETIME DEFAULT CURRENT_TIMESTAMP,
pais_origem VARCHAR(30)
);
INSERT INTO esportes (nome, categoria, num_jogadores, pais_origem) VALUES
('Judô', 'Individual', 1, 'Japão'),
('Vôlei de Praia', 'Coletivo', 2, 'Brasil'),
('Basquete 3x3', 'Coletivo', 3, 'Estados Unidos'),
('Natação', 'Individual', 1, 'Austrália'),
('Handebol', 'Coletivo', 6, 'Dinamarca');

ALTER TABLE esportes ADD COLUMN popularidade DECIMAL(3,1),ADD CONSTRAINT CHK_popularidade CHECK (popularidade BETWEEN 0 AND 10);

UPDATE esportes SET popularidade = 8.5 WHERE id = 1;
UPDATE esportes SET popularidade = 7.8 WHERE id = 2;
UPDATE esportes SET popularidade = 8.2 WHERE id = 3;
UPDATE esportes SET popularidade = 9.3 WHERE id = 4;
UPDATE esportes SET popularidade = 7.0 WHERE id = 5;

SELECT * FROM ESPORTES ;
SELECT * FROM ESPORTES ORDER BY POPULARIDADE  ASC;

SELECT * FROM ESPORTES WHERE ESTREIA > '2000-01-01';

ALTER TABLE esportes ADD CONSTRAINT CHK_estreia CHECK (estreia >= '1896-04-06 00:00:00' AND estreia <= CURRENT_TIMESTAMP);

ALTER TABLE ESPORTES DROP CONSTRAINT CHK_categoria;

SELECT * FROM ESPORTES WHERE NOME LIKE "_A%";

SELECT * FROM ESPORTES WHERE num_jogadores >=4 AND num_jogadores <=11;

DELETE FROM ESPORTES WHERE ID IN (1,2,3);

*/

/*
-- EXERCICIO 03

CREATE DATABASE DESENHO;
USE DESENHO;

CREATE TABLE DESENHOS_ANIMADOS(
ID INT PRIMARY KEY AUTO_INCREMENT,
TITULO VARCHAR(50) NOT NULL,
DATA_LANÇAMENTO DATE,
EMISSORA_ORIGINAL VARCHAR(50),
CLASSIFICACAO_INDICATIVA VARCHAR(2),
STATUS_DESENHO VARCHAR(15),
NOTA INT , CONSTRAINT CHK_NOTA CHECK(NOTA BETWEEN 1 AND 5)
) AUTO_INCREMENT = 10; -- FAZ COM QUE O ID COMEÇE APARTIR DO NÚMERO 10

ALTER TABLE DESENHOS_ANIMADOS RENAME COLUMN DATA_LANÇAMENTO  TO DATA_LANCAMENTO;
INSERT INTO DESENHOS_ANIMADOS 
(TITULO, DATA_LANCAMENTO, EMISSORA_ORIGINAL, CLASSIFICACAO_INDICATIVA, STATUS_DESENHO, NOTA) 
VALUES
('Bob Esponja', '1999-05-01', 'Nickelodeon', 'L', 'Em exibição', 5),
('Naruto', '2002-10-03', 'TV Tokyo', '12', 'Finalizado', 5),
('Rick and Morty', '2013-12-02', 'Adult Swim', '16', 'Em exibição', 4),
('Steven Universe', '2013-11-04', 'Cartoon Network', '10', 'Finalizado', 4),
('Dragon Ball Z', '1989-04-26', 'Fuji TV', '14', 'Finalizado', 5);


SELECT * FROM DESENHOS_ANIMADOS;

SELECT * FROM DESENHOS_ANIMADOS WHERE CLASSIFICACAO_INDICATIVA <= 14;

INSERT INTO DESENHOS_ANIMADOS (TITULO, DATA_LANCAMENTO, EMISSORA_ORIGINAL, CLASSIFICACAO_INDICATIVA, STATUS_DESENHO, NOTA) 
VALUES
('Gravity Falls', '2012-06-15', 'Adult Swim', '10', 'Finalizado', 5),
('O Incrível Mundo de Gumball', '2011-05-03', 'Cartoon Network', 'L', 'Finalizado', 4),
('Boruto', '2017-04-05', 'TV Tokyo', '12', 'Em exibição', 3),
('One Piece', '1999-10-20', 'Fuji TV', '12', 'Em exibição', 5),
('SpongeBob: Squarepants', '2005-01-19', 'Nickelodeon', 'L', 'Finalizado', 4);

SELECT * FROM DESENHOS_ANIMADOS WHERE EMISSORA_ORIGINAL = "TV Tokyo";



SET SQL_SAFE_UPDATES = 0;

UPDATE DESENHOS_ANIMADOS SET STATUS_DESENHO = 'finalizado' WHERE STATUS_DESENHO = 'Finalizado';
UPDATE DESENHOS_ANIMADOS SET STATUS_DESENHO = 'exibindo' WHERE STATUS_DESENHO = 'EM EXIBIÇÃO';


SET SQL_SAFE_UPDATES = 1;-- DESATIVANDO MODO DE PROTEÇÃO CONTRA UPDATES E POSTERIORMENTE REATIVANDO ELE 



ALTER TABLE DESENHOS_ANIMADOS MODIFY COLUMN STATUS_DESENHO VARCHAR(15), ADD CONSTRAINT CHK_STATUS CHECK (STATUS_DESENHO IN ('exibindo', 'finalizado', 'cancelado'));


UPDATE DESENHOS_ANIMADOS SET STATUS_DESENHO = 'finalizado' WHERE ID IN (10, 19);

DELETE FROM DESENHOS_ANIMADOS WHERE ID=12;

SELECT * FROM DESENHOS_ANIMADOS WHERE TITULO LIKE 'D%';

ALTER TABLE DESENHOS_ANIMADOS RENAME COLUMN CLASSIFICACAO_INDICATIVA TO classificacaoIndicativa;

UPDATE DESENHOS_ANIMADOS SET DATA_LANCAMENTO ='2022-09-08' WHERE ID = 11;

TRUNCATE DESENHOS_ANIMADOS;

ALTER TABLE DESENHOS_ANIMADOS DROP CONSTRAINT CHK_STATUS;
*/
/*
-- exercicio 04

CREATE DATABASE ESTOQUE;
USE ESTOQUE;

CREATE TABLE MisteriosSA(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
data_compra DATE,
preco DECIMAL (6,2),
peso DECIMAL (5,2),
data_retirada DATETIME DEFAULT CURRENT_TIMESTAMP -- REGISTRA DATA E HORA 
);

INSERT INTO MisteriosSA (nome, data_compra, preco, peso, data_retirada) VALUES
('Arroz 5kg', '2024-01-10', 25.90, 5.00, NULL),
('Feijão 1kg', '2024-02-14', 8.50, 1.00, NULL),
('Açúcar 1kg', '2024-03-22', 4.75, 1.00, NULL),
('Óleo de Soja 900ml', '2024-04-05', 7.20, 0.90, NULL),
('Café 500g', '2024-05-18', 15.30, 0.50, NULL);

SELECT * FROM MISTERIOSSA;

SELECT NOME,DATA_COMPRA,DATA_RETIRADA FROM MISTERIOSSA ORDER BY DATA_RETIRADA DESC;
INSERT INTO MisteriosSA (nome, data_compra, preco, peso, data_retirada) VALUES
('Biscoitos Scooby', '2024-03-22', 4.75, 1.00, NULL);

SET SQL_SAFE_UPDATES = 0;
UPDATE MISTERIOSSA SET data_retirada = '2024-04-15 09:30:00' WHERE NOME = 'Biscoitos Scooby';
SET SQL_SAFE_UPDATES = 1;

ALTER TABLE MISTERIOSSA RENAME COLUMN ID TO id_compra;

SET SQL_SAFE_UPDATES = 0;

UPDATE MisteriosSA SET nome = 'Cachorro-quente' WHERE nome != 'Biscoitos Scooby';

SET SQL_SAFE_UPDATES = 1;

ALTER TABLE MisteriosSA 
ADD CONSTRAINT CHK_NOME CHECK (nome IN ('Biscoitos Scooby', 'Cachorro-quente'));

SELECT NOME, DATA_COMPRA AS `DATA DA COMPRA`, DATA_RETIRADA AS `DATA DA RETIRADA` FROM MISTERIOSSA WHERE NOME = 'Biscoitos Scooby';

SELECT * FROM MISTERIOSSA WHERE DATA_COMPRA < '2024-07-25';

SELECT * FROM MISTERIOSSA WHERE PRECO >= 30.50;

TRUNCATE MISTERIOSSA;

*/
/*
-- exercicio 05

CREATE DATABASE vingadores;

USE vingadores;

CREATE TABLE heroi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    versao VARCHAR(45),
    habilidade VARCHAR(45) NOT NULL,
    altura INT NOT NULL
);

INSERT INTO heroi (nome, versao, habilidade, altura) VALUES
('Homem de Ferro', 'Vingadores', 'Genio tecnologico', 178),
('Capitao America', 'Guerra Civil', 'Forca sobre-humana', 188),
('Thor', 'Ragnarok', 'Controle dos raios', 195),
('Hulk', 'Vingadores', 'Forca descomunal', 240),
('Homem-Aranha', 'Sem Volta para Casa', 'Sentido aranha', 178);

SELECT * FROM heroi;

ALTER TABLE heroi ADD COLUMN regeneracao BOOLEAN;

ALTER TABLE heroi MODIFY COLUMN versao VARCHAR(100);

DELETE FROM heroi WHERE id = 3;

INSERT INTO heroi (nome, versao, habilidade, altura) VALUES
('Doutor Estranho', 'Multiverso da Loucura', 'Magia mistica', 180);

SELECT * FROM heroi WHERE nome LIKE 'C%' OR nome LIKE 'H%';

SELECT * FROM heroi WHERE nome NOT LIKE '%A%' AND nome NOT LIKE '%a%';

SELECT nome FROM heroi WHERE altura > 190;

SELECT * FROM heroi WHERE altura > 180 ORDER BY nome DESC;

TRUNCATE TABLE heroi;
*/
-- exercicio 06
/*
USE sprint1;

CREATE TABLE Revista (
    idRevista INT  PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    categoria VARCHAR(30)
);

INSERT INTO Revista (nome) VALUES
('Turma da Monica'),
('Veja'),
('National Geographic'),
('Superinteressante');

SELECT * FROM Revista;

UPDATE Revista SET categoria = 'Infantil' WHERE idRevista = 1;
UPDATE Revista SET categoria = 'Jornalismo' WHERE idRevista = 2;
UPDATE Revista SET categoria = 'Ciencia' WHERE idRevista = 3;

SELECT * FROM Revista;

INSERT INTO Revista (nome, categoria) VALUES
('Quatro Rodas', 'Automotivo'),
('Casa e Jardim', 'Decoracao'),
('Placar', 'Esportes');

SELECT * FROM Revista;

DESCRIBE Revista;

ALTER TABLE Revista
MODIFY COLUMN categoria VARCHAR(40);

DESCRIBE Revista;

ALTER TABLE Revista
ADD COLUMN periodicidade VARCHAR(15);

SELECT * FROM Revista;

ALTER TABLE Revista
DROP COLUMN periodicidade;
*/
-- exercicio 07


USE sprint1;

CREATE TABLE Carro (
    idCarro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    placa CHAR(7)
) AUTO_INCREMENT = 1000;

INSERT INTO Carro (nome, placa) VALUES
('Gol', 'ABC1234'),
('Civic', 'DEF5678'),
('Corolla', 'GHI9012'),
('Onix', 'JKL3456');

SELECT * FROM Carro;

INSERT INTO Carro (nome) VALUES
('Palio'),
('HB20'),
('Fiesta');

SELECT * FROM Carro;

DESCRIBE Carro;

ALTER TABLE Carro
MODIFY COLUMN nome VARCHAR(28);

DESCRIBE Carro;

ALTER TABLE Carro
ADD COLUMN ano CHAR(4);

UPDATE Carro
SET placa = '0000000'
WHERE placa IS NULL;
