/*
USE sprint1;

CREATE TABLE atleta(
idatleta INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40) DEFAULT 'nome vazio',
modalidae VARCHAR(40) DEFAULT 'NENHUMA MODALIDADE',
qtd_medalha INT DEFAULT 0 
);
ALTER TABLE atleta RENAME COLUMN idatleta to id_atleta;
ALTER TABLE atleta RENAME COLUMN modalidae to modalidade;
ALTER TABLE atleta RENAME COLUMN qtd_medalha to qtd_medalhas;


INSERT INTO atleta (nome,modalidade,qtd_medalhas) VALUES 
('joão','futebol',8),
('pedro','corrida',9),
('algusto','roquei',9),
('gabriel','patinação',10),
('vinicios','jogador de fps',12);

SELECT * FROM atleta;

UPDATE atleta SET qtd_medalhas=1 WHERE id_atleta =1;

UPDATE atleta SET  qtd_medalhas = 2 WHERE id_atleta IN (1,2);

UPDATE atleta SET nome = 'batata' WHERE id_atleta = 4;

ALTER TABLE atleta ADD COLUMN dt_nasc DATE;

UPDATE atleta SET dt_nasc = '1995-02-09' WHERE id_atleta = 1;

UPDATE atleta SET dt_nasc = '1587-03-08' WHERE id_atleta = 2;

UPDATE atleta SET dt_nasc = '1998-05-19' WHERE id_atleta = 3;

UPDATE atleta SET dt_nasc = '1998-07-25' WHERE id_atleta = 4;

UPDATE atleta SET dt_nasc = '1999-09-17' WHERE id_atleta = 5;
 
DELETE FROM atleta WHERE id_atleta = 5;

SELECT * FROM atleta WHERE modalidade <> 'natação'; -- mostrando as informações de todos os atletas que não sejam natação

SELECT * FROM atleta WHERE qtd_medalhas >= 3;

ALTER TABLE atleta MODIFY COLUMN modalidade VARCHAR(60);

DESC atleta;

TRUNCATE atleta;


EXERCICIO 01
*/
/*
EXERCICIO 02
USE sprint1;

CREATE TABLE Musica(
id_musica INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(40),
artista VARCHAR(40),
genero VARCHAR(40)
);

INSERT INTO Musica(titulo,artista,genero) VALUES ('BILLIEN JEAN','Michael Jackson
','POP'),('Off the wall','Michael Jackson','pop'),
('Thiller','Michael Jackson','pop'),
('My Own Summer','Deftones','rock'),
('Lonely Day','System of a Down','rock'),
('liberate','slipknot','rock');

RENAME TABLE Musica TO musicas;

SELECT * FROM musicas;
ALTER TABLE musicas ADD COLUMN curtidas INT;
UPDATE musicas SET curtidas = 120 WHERE id_musica IN (3);
ALTER TABLE musicas MODIFY COLUMN artista VARCHAR(80);
DESC MUSICAS;
UPDATE MUSICAS SET CURTIDAS = 1230 WHERE ID_MUSICA = 1;
UPDATE MUSICAS SET CURTIDAS = 3450 WHERE ID_MUSICA IN (2,3);
UPDATE MUSICAS SET TITULO ='banana' WHERE ID_MUSICA = 5;
DELETE FROM MUSICAS WHERE ID_MUSICA = 4;
SELECT * FROM MUSICAS WHERE GENERO <> 'FUNK';
SELECT * FROM MUSICAS WHERE CURTIDAS > 20;
DESCRIBE MUSICAS;
TRUNCATE MUSICAS;
*/
/*
EXERCICIO 03
USE sprint1;
CREATE TABLE FILME(
id_filmes INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(50) UNIQUE,
genero VARCHAR(40),
diretor VARCHAR(40)
);
INSERT INTO Filme (titulo, genero, diretor) VALUES
('A Origem', 'Ficção Científica', 'Christopher Nolan'),
('Interestelar', 'Ficção Científica', 'Christopher Nolan'),
('Oppenheimer', 'Drama', 'Christopher Nolan'),
('Duna', 'Ficção Científica', 'Denis Villeneuve'),
('Coringa', 'Drama', 'Todd Phillips'),
('Parasita', 'Drama', 'Bong Joon-ho'),
('Toy Story', 'Animação', 'John Lasseter');

SELECT * FROM FILME;
ALTER TABLE FILME ADD COLUMN protagonista VARCHAR(50)  UNIQUE;
ALTER TABLE FILME MODIFY COLUMN diretor VARCHAR(150);
UPDATE FILME SET diretor='serjão do Pneu' WHERE ID_FILMES = 5;
UPDATE FILME SET DIRETOR = 'Doja cat' WHERE ID_FILMES IN (2,7);
UPDATE FILME SET TITULO = 'jornada nas estrelas' WHERE ID_FILMES = 6;
DELETE FROM FILME WHERE ID_FILMES =3;
SELECT * FROM Filme WHERE GENERO <> 'drama';
SELECT * FROM FILME WHERE GENERO = 'suspense';
DESC FILME;
TRUNCATE FILME;
*/
/*
EXERCICIO 04
USE SPRINT1;

CREATE TABLE professor (
id_professor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL UNIQUE,
especialidade VARCHAR(40) NOT NULL,
dt_nasc DATE NOT NULL
);
INSERT INTO Professor (nome, especialidade, dt_Nasc) VALUES
('Carlos Mendes', 'Matemática', '1975-03-12'),
('Ana Beatriz Souza', 'Matemática', '1982-07-25'),
('João Pedro Lima', 'Português', '1978-11-03'),
('Fernanda Alves', 'Português', '1985-09-18'),
('Ricardo Santos', 'Física', '1980-01-30'),
('Juliana Costa', 'Matemática', '1990-05-14');

SELECT * FROM PROFESSOR;
DESC PROFESSOR;
ALTER TABLE PROFESSOR DROP COLUMN funcao;
ALTER TABLE PROFESSOR ADD COLUMN funcao VARCHAR(50) CHECK (funcao IN('munitor','assistente','titular'));

UPDATE professor SET funcao = 'titular' WHERE id_professor = 1;
UPDATE professor SET funcao = 'assistente' WHERE id_professor = 2;
UPDATE professor SET funcao = 'munitor' WHERE id_professor = 3;
UPDATE professor SET funcao = 'titular' WHERE id_professor = 4;
UPDATE professor SET funcao = 'assistente' WHERE id_professor = 5;
UPDATE professor SET funcao = 'munitor' WHERE id_professor = 6;

INSERT INTO professor (nome,especialidade,dt_nasc,funcao) VALUES ('Jerson Silva','Filosofia','1983-09-20','munitor');

DELETE FROM PROFESSOR WHERE ID_PROFESSOR = 5;

SELECT nome FROM PROFESSOR WHERE FUNCAO ='titular';

SELECT especialidade,dt_nasc FROM PROFESSOR WHERE funcao ='munitor'; 

UPDATE PROFESSOR SET dt_nasc = '1993-07-02' WHERE ID_PROFESSOR =3;

TRUNCATE PROFESSOR;
*/

USE SPRINT1;

CREATE TABLE curso(
id_curso INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL UNIQUE,
sigla CHAR(3) NOT NULL,
coordenador VARCHAR(50) NOT NULL
);
INSERT INTO curso (nome, sigla, coordenador) VALUES
('Técnico em Informática', 'INF', 'Marcos Ribeiro'),
('Técnico em Administração', 'ADM', 'Patrícia Nogueira'),
('Técnico em Enfermagem', 'ENF', 'Rodrigo Almeida'),
('BANANA','ALA','SERJÃO');
INSERT INTO curso (nome, sigla, coordenador) VALUES
('BANANA','ALA','SERJÃO');

SELECT * FROM CURSO;
SELECT COORDENADOR FROM CURSO;
SELECT * FROM CURSO WHERE SIGLA='INF';
SELECT * FROM CURSO ORDER BY  COORDENADOR DESC;
SELECT * FROM CURSO WHERE NOME LIKE 'T%';
SELECT * FROM CURSO WHERE NOME LIKE '%A';
SELECT * FROM CURSO WHERE NOME LIKE '_A%';
SELECT * FROM CURSO WHERE NOME LIKE '%A_';
DROP TABLE CURSO;
