CREATE DATABASE LISTA_04_BD;
USE LISTA_04_BD;
CREATE TABLE pessoa (
    idpessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11)
);

CREATE TABLE Reserva (
    idReserva INT PRIMARY KEY AUTO_INCREMENT,
    dtReserva DATETIME,
    dtRetirada DATETIME,
    dtDevolucao DATETIME,
    fkPessoa INT
);

ALTER TABLE Reserva
ADD CONSTRAINT fk_reserva_pessoa
FOREIGN KEY (fkPessoa) REFERENCES pessoa(idpessoa);

INSERT INTO pessoa (nome, cpf) VALUES
('Carlos Eduardo', '11122233344'),
('Mariana Souza', '22233344455'),
('Roberto Alves', '33344455566'),
('Fernanda Costa', '44455566677'),
('Ricardo Santos', '55566677788');

INSERT INTO Reserva (dtReserva, dtRetirada, dtDevolucao, fkPessoa) VALUES
('2026-01-10 09:00:00', '2026-01-10 10:00:00', '2026-01-12 10:00:00', 1),
('2026-02-05 14:00:00', '2026-02-05 15:00:00', NULL, 2),
('2026-03-01 08:30:00', NULL, NULL, 3),
('2026-04-20 11:00:00', '2026-04-20 11:30:00', '2026-04-22 11:30:00', NULL),
('2026-05-15 16:00:00', '2026-05-15 16:15:00', '2026-05-17 16:15:00', 5);

SELECT * FROM pessoa;
SELECT * FROM Reserva;

SELECT
    p.nome AS 'Nome Cliente',
    r.dtReserva AS 'Data Reserva',
    r.dtRetirada AS 'Data Retirada',
    r.dtDevolucao AS 'Data Devolução'
FROM pessoa AS p
INNER JOIN Reserva AS r
    ON p.idpessoa = r.fkPessoa;

SELECT
    idReserva,
    dtRetirada,
    dtDevolucao,
    CASE
        WHEN dtRetirada IS NULL THEN 'Não retirado'
        WHEN dtDevolucao IS NULL THEN 'Em andamento'
        ELSE 'Concluída'
    END AS 'Status'
FROM Reserva;

SELECT
    r.idReserva,
    IFNULL(p.nome, 'Sem Cliente Cadastrado') AS 'Nome Cliente'
FROM Reserva AS r
LEFT JOIN pessoa AS p
    ON r.fkPessoa = p.idpessoa;

-- exercicio 02


CREATE TABLE Pessoa1 (
    idPessoa1 INT PRIMARY KEY,
    nome VARCHAR(45),
    dtNascimento DATE
);

CREATE TABLE Pessoa2 (
    idPessoa2 INT PRIMARY KEY,
    nome VARCHAR(45),
    dtNascimento DATE,
    fkPessoa1 INT
);

ALTER TABLE Pessoa2
ADD CONSTRAINT fk_pessoa1
FOREIGN KEY (fkPessoa1) REFERENCES Pessoa1(idPessoa1);

INSERT INTO Pessoa1 (idPessoa1, nome, dtNascimento) VALUES
(1, 'João Silva', '1990-05-10'),
(2, 'Maria Souza', '1985-11-23'),
(3, 'Carlos Lima', '2000-02-15'),
(4, 'Ana Paula', '1995-07-30'),
(5, 'Pedro Costa', '1988-12-01');

INSERT INTO Pessoa2 (idPessoa2, nome, dtNascimento, fkPessoa1) VALUES
(1, 'Lucas Silva', '2010-03-12', 1),
(2, 'Beatriz Souza', '2012-06-25', 2),
(3, 'Rafael Lima', NULL, 3),
(4, 'Camila Paula', '2015-09-18', NULL),
(5, 'Felipe Costa', '2008-01-05', 5);

SELECT * FROM Pessoa1;
SELECT * FROM Pessoa2;

SELECT
    p2.nome AS filho,
    p1.nome AS responsavel
FROM Pessoa2 AS p2
JOIN Pessoa1 AS p1 ON p2.fkPessoa1 = p1.idPessoa1;

SELECT
    nome,
    dtNascimento,
    CASE
        WHEN dtNascimento IS NULL THEN 'Data não informada'
        WHEN YEAR(dtNascimento) < 2010 THEN 'Nascido antes de 2010'
        ELSE 'Nascido em 2010 ou depois'
    END AS categoria_nascimento
FROM Pessoa2;

SELECT
    nome,
    IFNULL(fkPessoa1, 'Sem vínculo com Pessoa1') AS vinculo
FROM Pessoa2;
