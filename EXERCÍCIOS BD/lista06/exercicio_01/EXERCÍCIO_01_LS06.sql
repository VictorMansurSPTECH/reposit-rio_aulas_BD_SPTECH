CREATE DATABASE BIBLIOTECA_LS06;
USE BIBLIOTECA_LS06;
CREATE TABLE autores (
    idautores INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NULL,
    nacionalidade VARCHAR(45) NULL
);

CREATE TABLE Livro (
    idLivro INT  PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(45) NULL,
    genero VARCHAR(45) NULL,
    qtd_pag INT NULL,
    ano_publi DATE NULL,
    FK_AUTORES INT,
    CONSTRAINT CHK_FK_AUTORES FOREIGN KEY (FK_AUTORES)
    REFERENCES AUTORES(IDAUTORES)
   );

INSERT INTO autores (nome, nacionalidade) VALUES
('Machado de Assis', 'Brasileira'),
('J.K. Rowling', 'Britânica'),
('George Orwell', 'Britânica'),
('Clarice Lispector', 'Brasileira');

-- Livros
INSERT INTO Livro (titulo, genero, qtd_pag, ano_publi, FK_AUTORES) VALUES
('Dom Casmurro', 'Romance', 256, '1899-01-01', 1),
('Memórias Póstumas de Brás Cubas', 'Romance', 208, '1881-01-01', 1),
('Harry Potter e a Pedra Filosofal', 'Fantasia', 223, '1997-06-26', 2),
('Harry Potter e a Câmara Secreta', 'Fantasia', 251, '1998-07-02', 2),
('1984', 'Distopia', 328, '1949-06-08', 3),
('A Revolução dos Bichos', 'Sátira', 152, '1945-08-17', 3),
('A Hora da Estrela', 'Romance', 96, '1977-01-01', 4),
('Laços de Família', 'Contos', 156, '1960-01-01', 4);

SELECT 
    LIVRO.TITULO AS "TITULO DO LIVRO",
    LIVRO.GENERO AS "GÊNERO",
    LIVRO.ANO_PUBLI AS "ANO DE PUBLICAÇÃO",
    AUTORES.NOME AS "NOME DO AUTOR",
    AUTORES.NACIONALIDADE AS "NACIONALIDADE"
FROM LIVRO 
JOIN AUTORES ON LIVRO.FK_AUTORES = AUTORES.IDAUTORES -- comparando os valores para que não ocorra erro no join 
WHERE LIVRO.ANO_PUBLI > '1969-01-01' ORDER BY  LIVRO.ANO_PUBLI DESC ;
    

	