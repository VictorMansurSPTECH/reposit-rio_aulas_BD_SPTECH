CREATE DATABASE banco_escola_tec;
USE banco_escola_tec;

CREATE TABLE curso (
    idcurso INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NULL,
    area VARCHAR(45) NULL,
    duracao VARCHAR(45) NULL
);

CREATE TABLE alunos (
    idalunos INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    RA VARCHAR(45) NULL,
    nome_aluno VARCHAR(45) NULL,
    email VARCHAR(45) NULL,
    semestre VARCHAR(30) NULL,
    FK_CURSO INT,
    CONSTRAINT CH_FK_CURSO FOREIGN KEY (FK_CURSO)
    REFERENCES CURSO(IDCURSO)
);
SELECT
	ALUNOS.RA AS "RA",
    ALUNOS.NOME_ALUNO AS "NOME DO ALUNO",
    ALUNOS.EMAIL AS "E-MAIL",
    ALUNOS.SEMESTRE AS "SEMESTRE",
    CURSO.AREA AS "ÁREA DO CURSO"
FROM ALUNOS 
JOIN CURSO  ON ALUNOS.FK_CURSO = CURSO.IDCURSO 
WHERE ALUNOS.NOME_ALUNO LIKE "p%" ORDER BY CURSO.NOME;  


INSERT INTO curso (nome, area, duracao) VALUES
('Técnico em Informática', 'Tecnologia', '3 semestres'),
('Técnico em Administração', 'Gestão', '3 semestres'),
('Técnico em Enfermagem', 'Saúde', '4 semestres');

INSERT INTO alunos (RA, nome_aluno, email, semestre, FK_CURSO) VALUES
('RA001', 'João Silva', 'joao.silva@escola.com', '1', 1),
('RA002', 'Maria Souza', 'maria.souza@escola.com', '2', 1),
('RA003', 'Pedro Santos', 'pedro.santos@escola.com', '3', 1),
('RA004', 'Ana Oliveira', 'ana.oliveira@escola.com', '1', 2),
('RA005', 'Lucas Costa', 'lucas.costa@escola.com', '2', 2),
('RA006', 'Beatriz Lima', 'beatriz.lima@escola.com', '3', 2),
('RA007', 'Gabriel Ferreira', 'gabriel.ferreira@escola.com', '1', 3),
('RA008', 'Larissa Almeida', 'larissa.almeida@escola.com', '2', 3),
('RA009', 'Rafael Pereira', 'rafael.pereira@escola.com', '3', 3),
('RA010', 'Camila Rodrigues', 'camila.rodrigues@escola.com', '4', 3);