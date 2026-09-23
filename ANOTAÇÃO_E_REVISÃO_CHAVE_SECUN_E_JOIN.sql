create database teste_join;

use teste_join;

CREATE TABLE curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    area_conhecimento VARCHAR(50),
    formacao_complementar VARCHAR(100),
    coordenador VARCHAR(100)
);
CREATE TABLE aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sexo CHAR(1) CHECK (sexo IN ('M', 'F', 'O')),
    idade INT CHECK (idade > 0),
    curso VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    matricula VARCHAR(20),
    curso_preferido INT, 
    constraint fk_secundária_curso
    foreign key (curso_preferido) -- está tornando o campo curso_preferido em uma chave primaria mas não está apontando qual tabela vai referenciar!!!
    references curso(id_curso) -- aqui está referenciando da tabela curso no campo id_curso 
);
-- 5 inserts em curso
INSERT INTO curso (nome_curso, carga_horaria, area_conhecimento, formacao_complementar, coordenador) VALUES
('Técnico em Informática', 1200, 'Tecnologia', 'Inglês Técnico', 'Marcos Silva'),
('Técnico em Administração', 1000, 'Gestão', 'Excel Avançado', 'Fernanda Costa'),
('Técnico em Enfermagem', 1600, 'Saúde', 'Primeiros Socorros', 'Ana Paula Reis'),
('Técnico em Redes de Computadores', 1400, 'Tecnologia', 'Certificação Cisco', 'Rodrigo Almeida'),
('Técnico em Design Gráfico', 1100, 'Design', 'Adobe Creative Suite', 'Juliana Martins');

select * from curso;

-- 5 inserts em aluno (curso_preferido aponta para id_curso já existente)
INSERT INTO aluno (nome, sexo, idade, curso, email, matricula, curso_preferido) VALUES
('João Vitor Souza', 'M', 19, 'Técnico em Informática', 'joao.souza@email.com', 'MAT2026001', 1),
('Maria Fernanda Lima', 'F', 20, 'Técnico em Administração', 'maria.lima@email.com', 'MAT2026002', 2),
('Carlos Eduardo Santos', 'M', 22, 'Técnico em Enfermagem', 'carlos.santos@email.com', 'MAT2026003', 3),
('Beatriz Oliveira', 'F', 18, 'Técnico em Redes de Computadores', 'beatriz.oliveira@email.com', 'MAT2026004', 4),
('Rafael Costa Pereira', 'M', 21, 'Técnico em Design Gráfico', 'rafael.pereira@email.com', 'MAT2026005', 5);
describe aluno;

SELECT 
	ALUNO.NOME AS 'NOME DO ALUNO',
    CURSO.NOME_CURSO AS 'CURSO SELECIONADO'
FROM ALUNO JOIN CURSO;

