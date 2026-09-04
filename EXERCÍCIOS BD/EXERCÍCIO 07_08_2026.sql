/*
CREATE DATABASE atividade_01;
USE atividade_01;

CREATE TABLE atleta (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40) UNIQUE,
modalidade VARCHAR(40),
qtd INT
);


INSERT INTO atleta (nome,modalidade,qtd) values
('alex','natação',2),('lucas','salto com vara',1),('pedro','boxe',2),('antonio','boxe',5),('stefani','natação',3);

SELECT * FROM atleta;

SELECT nome,qtd from atleta;

SELECT nome,modalidade FROM atleta WHERE modalidade LIKE 'boxe';

SELECT * FROM atleta ORDER BY modalidade;

SELECT nome,qtd,modalidade FROM atleta ORDER BY qtd ASC;

SELECT nome FROM atleta WHERE nome LIKE 's%'; 

SELECT * FROM atleta WHERE nome LIKE 'a%';

SELECT * FROM atleta WHERE nome LIKE 'p%';

SELECT * FROM atleta WHERE nome LIKE '%r_';

DROP TABLE atleta;

terminando ex 01
*/
/*
exercicio 02
CREATE DATABASE sprint1;
USE sprint1;


CREATE TABLE musica (
 idMusica INT PRIMARY KEY AUTO_INCREMENT,
 titulo VARCHAR(40) UNIQUE,
 artista VARCHAR(40),
 genero VARCHAR(40)
);

INSERT INTO musica (titulo,artista,genero) VALUES ('KILLING IN THE NAME ','joão','rock'),('Nightmare','pedro','Rock'),('Faint','linkin Park','Rock'),('Fbint','linkin Park','Rock');

SELECT * FROM musica;

SELECT titulo,artista,genero FROM musica WHERE genero LIKE 'Rock';

SELECT * FROM musica WHERE artista LIKE 'Pedro';

SELECT * FROM musica ORDER BY titulo ASC; 

SELECT * FROM musica ORDER BY titulo DESC;

SELECT * FROM musica WHERE titulo LIKE 'f%'; 

SELECT * FROM musica WHERE artista LIKE '%k'; 

SELECT * FROM musica WHERE genero LIKE '_o%';

SELECT * FROM musica WHERE titulo LIKE '%m_';

DROP DATABASE sprint1;
*/
/*
-- exercico 03
CREATE DATABASE sprint1;
USE sprint1;

CREATE TABLE Filmes (
idFilme INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(50) UNIQUE,
genero VARCHAR(40),
diretor VARCHAR(40)

);
INSERT INTO filmes (titulo, genero, diretor) VALUES
('Batman Begins', 'Ação', 'Christopher Nolan'),
('Interestelar', 'Ficção Científica', 'Christopher Nolan'),
('A Origem', 'Ficção Científica', 'Christopher Nolan'),
('John Wick', 'Ação', 'Chad Stahelski'),
('Coringa', 'Drama', 'Todd Phillips'),
('O Poderoso Chefão', 'Drama', 'Francis Ford Coppola'),
('Toy Story', 'Animação', 'John Lasseter');

SELECT * FROM Filmes;

SELECT titulo,diretor FROM filmes;

SELECT * FROM Filmes WHERE genero LIKE 'Ação';

SELECT * FROM Filmes where diretor LIKE 'Francis Ford Coppola'; 

SELECT * FROM filmes ORDER BY titulo;

SELECT * FROM Filmes ORDER BY diretor DESC;

SELECT * FROM Filmes WHERE titulo LIKE 'a%';

SELECT * FROM Filmes WHERE titulo LIKE '%a';

SELECT * FROM Filmes WHERE genero LIKE '_a%';

SELECT * FROM Filmes WHERE titulo LIKE '%a_';

DROP DATABASE sprint1;
*/
/*
-- exercico 04
CREATE DATABASE sprint1;
USE sprint1;

CREATE TABLE Professor (
idProfessor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
especialidade VARCHAR(40),
dtNasc DATE
);
INSERT INTO Professor (nome, especialidade, dtNasc) VALUES
('Carlos Almeida', 'Matemática', '1980-03-15'),
('Fernanda Souza', 'Português', '1975-07-22'),
('Ricardo Lima', 'Matemática', '1990-11-30'),
('Juliana Costa', 'História', '1983-10-13'),
('Marcos Pereira', 'Educação Física', '1988-05-09'),
('Patrícia Gomes', 'Matemática', '1979-01-25');
SELECT * FROM Professor;

SELECT especialidade FROM professor;

SELECT * FROM Professor WHERE especialidade LIKE "Matemática";

SELECT * FROM Professor ORDER BY nome;

SELECT * FROM Professor WHERE nome LIKE "j%";

SELECT * FROM Professor WHERE  nome LIKE "%a";

SELECT * FROM Professor WHERE nome LIKE "_a%";

SELECT * FROM Professor WHERE nome LIKE "%r_";

DROP DATABASE sprint1; 
*/
/*
-- exercico 05
CREATE DATABASE sprint1;
USE sprint1;

CREATE TABLE jogo (
idjogo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
comentario VARCHAR(200),
ranking int 
);
INSERT INTO Jogo (nome, comentario, ranking) VALUES
('The Legend of Zelda: BOTW', 'Mundo aberto incrível, exploração livre e muita liberdade criativa', 1),
('God of War Ragnarök', 'Narrativa envolvente com combate visceral e ótima ambientação nórdica', 2),
('Minecraft', 'Jogo de construção e sobrevivência com infinitas possibilidades', 3),
('FIFA 24', 'Simulador de futebol com jogabilidade realista e times atualizados', 4),
('Elden Ring', 'RPG de mundo aberto desafiador com level design excepcional', 5);

SELECT * FROM jogo;

SELECT nome FROM jogo;

SELECT comentario FROM jogo WHERE nome ='elden ring';

SELECT nome FROM jogo ORDER BY nome;

SELECT * FROM jogo ORDER BY ranking DESC;

SELECT * FROM jogo WHERE nome LIKE "e%";

SELECT * FROM jogo WHERE nome LIKE "%4";

SELECT * FROM jogo WHERE nome LIKE "_l%";

SELECT * FROM jogo WHERE nome LIKE "%N_";

SELECT * FROM jogo WHERE nome <> 'Minecraft';

DROP TABLE sprint1;

*/