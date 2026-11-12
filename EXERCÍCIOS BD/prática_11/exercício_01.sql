CREATE DATABASE IF NOT EXISTS PRATICA_11;
USE PRATICA_11;

CREATE TABLE ALUNO (
id_aluno INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
email VARCHAR(145) NOT NULL

);

CREATE TABLE CURSO (
id_curso INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
carga_hora DECIMAL(10,2) NOT NULL
);

CREATE TABLE MATRICULA(
FK_CURSO INT NOT NULL,
FK_ALUNO INT NOT NULL,
data_inscricao DATETIME NOT NULL,
nota_final DECIMAL(3,1),
PRIMARY KEY (FK_CURSO,FK_ALUNO),
CONSTRAINT CH_FK_ALUNO FOREIGN KEY (FK_ALUNO) REFERENCES ALUNO(ID_ALUNO),
CONSTRAINT CH_FK_CURSO FOREIGN KEY (FK_CURSO) REFERENCES CURSO(ID_CURSO)
);


INSERT INTO ALUNO (nome, email) VALUES
('Ana Souza',        'ana.souza@email.com'),
('Bruno Lima',       'bruno.lima@email.com'),
('Carla Mendes',     'carla.mendes@email.com'),
('Diego Ferreira',   'diego.ferreira@email.com'),
('Eduarda Rocha',    'eduarda.rocha@email.com'),
('Felipe Costa',     'felipe.costa@email.com');

INSERT INTO CURSO (nome, carga_hora) VALUES
('Lógica de Programação com Python', 80.00),
('Redes de Computadores',            60.00),
('UX/UI Design',                     40.00),
('Banco de Dados',                   60.00);


INSERT INTO MATRICULA (FK_CURSO, FK_ALUNO, data_inscricao, nota_final) VALUES
(1, 1, '2026-02-10 08:00:00', 8.5),
(1, 2, '2026-02-10 08:15:00', 6.0),
(1, 3, '2026-02-11 09:00:00', 9.5),
(2, 4, '2026-02-12 14:00:00', 7.0),
(2, 5, '2026-02-12 14:30:00', 5.5),
(4, 2, '2026-03-01 10:00:00', NULL),
(4, 5, '2026-03-01 10:20:00', NULL);


select 

	aluno.nome as "Aluno",
    aluno.email as "E-mail",
    matricula.data_inscricao as "data de inscrição",
    
    case
		when nota_final = null then "Nota em andamento"
        when nota_final >= 6 then "Aprovado"
        when nota_final <6 then "reprovado"
    end as "situação da nota"

from matricula join aluno on matricula.fk_aluno= aluno.id_aluno;



select 

	count(a.id_aluno ) as "quantidade de alunos",
    count(m.nota_final) as "quantidade de notas lançadas",
    round(avg(m.nota_final),1) as "média de todos os cursos"
    
from matricula as m join aluno as a on m.fk_curso = a.id_aluno
join curso as c on c.id_curso = m.fk_curso;



CREATE VIEW vw_idiomas_desempenho AS
SELECT
    c.id_curso AS id_curso,
    c.nome AS nome_curso,
    COUNT(m.FK_ALUNO) AS qtd_matriculados,
    ROUND(AVG(m.nota_final), 2) AS media_nota_final
FROM CURSO c
LEFT JOIN MATRICULA m ON m.FK_CURSO = c.id_curso
GROUP BY c.id_curso, c.nome;


SELECT * FROM vw_idiomas_desempenho ORDER BY id_curso;