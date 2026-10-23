CREATE USER 'atendente_suporte'@'localhost' IDENTIFIED BY 'Atend@2026';
CREATE USER 'analista_suporte'@'localhost' IDENTIFIED BY 'Analista@2026';
CREATE USER 'gestor_suporte'@'localhost' IDENTIFIED BY 'Gestor@2026';

CREATE DATABASE suporte_dcl;
USE suporte_dcl;

CREATE TABLE categoria (
    idcategoria INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL
);

CREATE TABLE status_chamado (
    idstatus INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(45) NOT NULL
);

CREATE TABLE chamado (
    idchamado INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(80) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    data_abertura DATE NOT NULL,
    FK_CATEGORIA INT NOT NULL,
    FK_STATUS INT NOT NULL,
    CONSTRAINT CH_FK_CATEGORIA FOREIGN KEY (FK_CATEGORIA)
    REFERENCES CATEGORIA(IDCATEGORIA),
    CONSTRAINT CH_FK_STATUS FOREIGN KEY (FK_STATUS)
    REFERENCES STATUS_CHAMADO(IDSTATUS)
);

INSERT INTO categoria (nome) VALUES
('Hardware'),
('Software'),
('Rede');

INSERT INTO status_chamado (descricao) VALUES
('Aberto'),
('Em andamento'),
('Resolvido');

INSERT INTO chamado (titulo, descricao, data_abertura, FK_CATEGORIA, FK_STATUS) VALUES
('Computador não liga', 'O computador da recepção não liga após queda de energia', '2026-10-01', 1, 1),
('Erro ao abrir planilha', 'O Excel fecha sozinho ao abrir o arquivo de vendas', '2026-10-02', 2, 2),
('Sem acesso à internet', 'A sala 3 está sem conexão com a rede', '2026-10-03', 3, 1),
('Impressora não imprime', 'A impressora do financeiro não responde', '2026-10-05', 1, 3),
('Instalação de programa', 'Solicitação de instalação do editor de código', '2026-10-06', 2, 3),
('Wi-Fi instável', 'O Wi-Fi do segundo andar cai com frequência', '2026-10-08', 3, 2);

GRANT SELECT ON suporte_dcl.categoria TO 'atendente_suporte'@'localhost';
GRANT SELECT ON suporte_dcl.status_chamado TO 'atendente_suporte'@'localhost';
GRANT SELECT, INSERT, UPDATE ON suporte_dcl.chamado TO 'atendente_suporte'@'localhost';

GRANT SELECT ON suporte_dcl.categoria TO 'analista_suporte'@'localhost';
GRANT SELECT ON suporte_dcl.status_chamado TO 'analista_suporte'@'localhost';
GRANT SELECT ON suporte_dcl.chamado TO 'analista_suporte'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE ON suporte_dcl.categoria TO 'gestor_suporte'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON suporte_dcl.status_chamado TO 'gestor_suporte'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON suporte_dcl.chamado TO 'gestor_suporte'@'localhost';

SHOW GRANTS FOR 'atendente_suporte'@'localhost';
SHOW GRANTS FOR 'analista_suporte'@'localhost';
SHOW GRANTS FOR 'gestor_suporte'@'localhost';

SELECT
    CHAMADO.IDCHAMADO AS "ID",
    CHAMADO.TITULO AS "TÍTULO",
    CATEGORIA.NOME AS "CATEGORIA",
    STATUS_CHAMADO.DESCRICAO AS "STATUS"
FROM CHAMADO
JOIN CATEGORIA ON CHAMADO.FK_CATEGORIA = CATEGORIA.IDCATEGORIA
JOIN STATUS_CHAMADO ON CHAMADO.FK_STATUS = STATUS_CHAMADO.IDSTATUS;

INSERT INTO chamado (titulo, descricao, data_abertura, FK_CATEGORIA, FK_STATUS) VALUES
('Teste de cadastro', 'Chamado criado para testar permissões', CURDATE(), 1, 1);

UPDATE chamado SET FK_STATUS = 2 WHERE IDCHAMADO = 1;

INSERT INTO categoria (nome) VALUES ('Segurança');

INSERT INTO status_chamado (descricao) VALUES ('Cancelado');

DELETE FROM chamado WHERE IDCHAMADO = 6;

REVOKE UPDATE ON suporte_dcl.chamado FROM 'atendente_suporte'@'localhost';

SHOW GRANTS FOR 'atendente_suporte'@'localhost';