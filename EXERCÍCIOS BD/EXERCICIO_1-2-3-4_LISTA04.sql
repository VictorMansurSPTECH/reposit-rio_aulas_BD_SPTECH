/*
CREATE DATABASE sprint01;
USE sprint01;

CREATE TABLE ALUGUEL(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(90),
    SOBRENOME VARCHAR(90),
    VALOR_TOTAL DECIMAL(7,2),
    STATUS_ALUGUEL VARCHAR(90),CONSTRAINT CHK_STATUS CHECK(STATUS_ALUGUEL IN('FINALIZADO','EM_ANDAMENTO'))

);
INSERT INTO ALUGUEL (NOME,SOBRENOME,VALOR_TOTAL,STATUS_ALUGUEL) VALUES ('Cristiano','Ronaldo',10000,'EM_ANDAMENTO');
	SELECT CONCAT(NOME,' ',SOBRENOME) AS 'NOME COMPLETO',VALOR_TOTAL,
    
    CASE 
		WHEN STATUS_ALUGUEL = 'FINALIZADO' THEN 'CONCLUIDO'
        WHEN STATUS_ALUGUEL = 'EM_ANDAMENTO' THEN 'EM ANDAMENTO'
        ELSE 'CANCELADO'
	END AS 'SITUAÇÃO'
    FROM ALUGUEL ORDER BY NOME ASC;
*/    

-- exercicio 2
CREATE database biblioteca_lista04;

use biblioteca_lista04;

create table livro (
idLivro int primary key auto_increment,
codigo varchar(90),
titulo varchar(90),
ano_publicacao date,
autor varchar(120) default 'Sem autor'
);

insert into livro (codigo,titulo,ano_publicacao,autor) values ('12345asq','As aventuras depeter Pan','1958-06-09','david fonseca'),
('iahfgwu12','As crônicas de narnia','1998-07-09','pedrinho');

select * from livro;

update livro set autor = 'robert' where idlivro = 1;

delete from livro where idlivro =1;

describe livro;

alter table livro add column editora varchar(90) default 'editora não informada';

select * from livro where autor like "%a%";

alter table livro drop column editora;


create table usuario (
idUsuario int primary key auto_increment,
codigo varchar(90) not null,
nome varchar(90) not null,
tipo varchar(90) not null
);
insert into usuario (codigo,nome,tipo) values ('usr001','Marcos Aurélio','visitante'),
('usr002','Fernanda Lima','docente');
alter table usuario add constraint check ( tipo in ('docente','discente','visitante'));
update usuario set tipo = 'docente' where idUsuario = 1;
update usuario set tipo = 'discente' where idUsuario = 2;
select * from usuario where nome like '%m_';
alter table usuario add column telefone varchar(20);
alter table usuario modify nome varchar(150);

select nome as nome_completo from usuario;
select concat(titulo,' - ',autor) as detalhes from livro;
select titulo, ano_publicacao,
case
when ano_publicacao < '2000-01-01' then 'Antigo'
else 'Moderno'
end as classificacao
from livro;
select * from livro order by titulo desc;
select * from usuario where tipo <> 'docente';

truncate table livro;
drop database biblioteca;

-- exercicio 3


CREATE DATABASE IF NOT EXISTS sprint1;

USE sprint1;

CREATE TABLE produto (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(90) NOT NULL,
categoria VARCHAR(90) NOT NULL,
tamanho VARCHAR(10) NOT NULL,
preco DECIMAL(7,2) NOT NULL,
disponivel BOOLEAN NOT NULL,
data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO produto (nome, categoria, tamanho, preco, disponivel, data_cadastro) VALUES
('Camiseta Regata Esportiva', 'Camiseta', 'M', 59.90, 1, '2026-08-10 10:00:00'),
('Blusa Frio De Lã', 'Blusa', 'P', 120.00, 1, '2026-08-15 14:30:00'),
('Calça Jeans Slim', 'Calça', 'G', 150.00, 1, '2026-08-19 09:00:00'),
('Short Jeans Verão', 'Short', 'P', 79.90, 0, '2026-08-20 11:15:00'),
('Jaqueta Couro', 'Jaqueta', 'GG', 250.00, 1, '2026-08-22 16:45:00'),
('Moletom Oversized', 'Moletom', 'M', 180.00, 0, '2025-05-10 08:20:00');

SELECT * FROM produto WHERE nome LIKE '%Camiseta%';

SELECT * FROM produto WHERE tamanho <> 'M';

SELECT * FROM produto WHERE data_cadastro > '2026-08-18 23:59:59';

SELECT * FROM produto WHERE disponivel = 1 AND (categoria = 'Camiseta' OR categoria = 'Blusa');

SELECT CONCAT(nome, ' - R$ ', preco) AS 'produto_preco' FROM produto;

SELECT * FROM produto WHERE nome NOT LIKE '%Blusa%';

SELECT *,
CASE
WHEN disponivel = 1 THEN 'Disponível'
ELSE 'Indisponível'
END AS status
FROM produto;

SELECT * FROM produto WHERE categoria = 'Calça' AND preco > 100.00;

SELECT * FROM produto WHERE nome NOT LIKE '%Camiseta%';

SELECT * FROM produto WHERE id IN (1, 3, 5);

SELECT * FROM produto WHERE tamanho NOT IN ('P', 'M');

SELECT * FROM produto WHERE data_cadastro < '2025-08-18 00:00:00';

SELECT nome, preco AS 'produto_valor' FROM produto;

SELECT CONCAT(nome, ' - ', categoria, ' - R$ ', preco) AS 'info_completa' FROM produto;

SELECT * FROM produto WHERE disponivel = 1 AND tamanho = 'M';

SELECT * FROM produto WHERE nome LIKE 'C%';

UPDATE produto SET preco = 270.00 WHERE nome = 'Jaqueta Couro';

UPDATE produto SET disponivel = 0 WHERE categoria = 'Blusa';

UPDATE produto SET tamanho = 'M' WHERE nome LIKE '%Short%';

UPDATE produto SET categoria = 'Camiseta' WHERE nome LIKE '%Camiseta%';

UPDATE produto SET disponivel = 1 WHERE data_cadastro > '2026-08-20 23:59:59';

UPDATE produto SET preco = preco * 1.05 WHERE preco < 100.00;

UPDATE produto SET nome = 'Short Esportivo Unissex' WHERE id = 4;

UPDATE produto SET disponivel = 0 WHERE nome LIKE '%Blusa%' OR nome LIKE '%Moletom%';

UPDATE produto SET data_cadastro = NOW() WHERE categoria = 'Camiseta';

INSERT INTO produto (nome, categoria, tamanho, preco, disponivel, data_cadastro) VALUES
('Camiseta Estampada', 'Camiseta', 'GG', 45.00, 1, '2026-08-25 10:00:00'),
('Jaqueta Nylon Impermeável', 'Jaqueta', 'G', 210.00, 0, '2026-08-26 11:00:00'),
('Calça Cargo', 'Calça', 'M', 110.00, 1, '2026-08-27 12:00:00'),
('Blusa Moletom Capuz', 'Blusa', 'P', 130.00, 0, '2026-08-28 13:00:00'),
('Short Corrida', 'Short', 'G', 65.00, 1, '2026-08-29 14:00:00'),
('Jaqueta Jeans', 'Jaqueta', 'M', 190.00, 0, '2026-08-30 15:00:00');

SELECT * FROM produto WHERE categoria = 'Jaqueta' AND disponivel = 0;

SELECT * FROM produto WHERE tamanho IN ('GG', 'P') ORDER BY preco DESC;

SELECT nome, tamanho FROM produto WHERE data_cadastro >= '2026-08-01 00:00:00' AND data_cadastro <= '2026-08-31 23:59:59';

SELECT * FROM produto WHERE nome LIKE '%a';

SELECT * FROM produto WHERE categoria NOT IN ('Camiseta', 'Calça', 'Short');

SELECT nome AS 'Nome do Produto', preco AS 'Preço' FROM produto WHERE preco BETWEEN 50.00 AND 150.00;

SELECT *, CONCAT(nome, ' - ', categoria) AS 'info' FROM produto;

SELECT *, 'Em falta' AS status FROM produto WHERE disponivel = 0;

SELECT * FROM produto WHERE nome LIKE '% %' AND nome NOT LIKE '% % %';

SELECT
nome AS nome_produto,
preco AS preco_atual,
data_cadastro,
CONCAT(nome, ' - ', categoria, ' - R$ ', preco) AS descricao,
CASE
WHEN disponivel = 1 THEN 'Disponível'
ELSE 'Indisponível'
END AS status_disponibilidade
FROM produto
WHERE nome NOT LIKE '%Blusa%'
AND tamanho IN ('M', 'G')
AND disponivel = 1
AND data_cadastro > '2025-08-15 23:59:59';

-- exercicio número 4
CREATE DATABASE IF NOT EXISTS sprint1;

USE sprint1;

CREATE TABLE jogo (
id INT PRIMARY KEY AUTO_INCREMENT,
nome_jogo VARCHAR(90) NOT NULL,
genero VARCHAR(50) NULL,
preco DECIMAL(7,2) NULL,
plataforma VARCHAR(10) NULL,
data_lancamento DATE NULL,
data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
modo_online CHAR(1) NULL,
CONSTRAINT CHK_modo_online CHECK (modo_online IN ('S', 'N'))
);

INSERT INTO jogo (nome_jogo, genero, preco, plataforma, data_lancamento, modo_online) VALUES
('Resident Evil 2 Remake', 'Survival Horror', 199.90, 'PC', '2019-01-25', 'N'),
('Clash Royale', 'Estratégia', NULL, 'Mobile', '2016-03-02', 'S'),
('Counter-Strike 2', 'FPS', 0.00, 'PC', '2023-09-27', 'S'),
('The Witcher 3: Wild Hunt', 'RPG', 129.90, 'PC', '2015-05-19', 'N'),
('Age of Empires II', 'Estratégia', 39.99, 'PC', '1999-10-22', 'S'),
('Valorant', 'FPS', 0.00, 'PC', '2020-06-02', 'S'),
('FIFA 23', 'Esporte', 299.00, 'PS5', '2022-09-30', 'S'),
('FIFA 23', 'Esporte', 299.00, 'XBOX', '2022-09-30', 'S'),
('Indie Mystery Game', NULL, 15.00, 'PC', '2021-04-12', 'N');

SELECT * FROM jogo;

SELECT nome_jogo, preco FROM jogo;

SELECT * FROM jogo WHERE preco > 100.00;

SELECT * FROM jogo WHERE plataforma = 'PC';

SELECT * FROM jogo ORDER BY preco ASC;

SELECT * FROM jogo ORDER BY nome_jogo DESC;

SELECT * FROM jogo WHERE data_lancamento > '2020-12-31';

SELECT nome_jogo, preco AS 'Valor' FROM jogo;

SELECT CONCAT(nome_jogo, ' - ', plataforma) AS jogo_plataforma FROM jogo;

SELECT id, nome_jogo, IFNULL(CONCAT('R$ ', preco), 'Gratuito') AS preco FROM jogo;

SELECT id, nome_jogo, IFNULL(genero, 'Não informado') AS genero FROM jogo;

SELECT nome_jogo, data_lancamento, data_cadastro, CONCAT('R$ ', preco) AS preco_formatado FROM jogo;

SELECT data_lancamento AS 'Lançamento' FROM jogo;

SELECT modo_online AS 'Modo Online' FROM jogo;

SELECT CONCAT(nome_jogo, ' - ', IFNULL(genero, 'Não informado')) AS jogo_genero FROM jogo;

SELECT
CASE
WHEN preco IS NULL OR preco = 0 THEN CONCAT('O jogo ', nome_jogo, ', com a data de lançamento ', IFNULL(data_lancamento, 'N/I'), ', está Grátis!')
ELSE CONCAT('O jogo ', nome_jogo, ', com a data de lançamento ', IFNULL(data_lancamento, 'N/I'), ', está custando R$ ', preco, '.')
END AS mensagem_customizada
FROM jogo;

SELECT nome_jogo,
CASE
WHEN preco >= 200.00 THEN 'Caro'
ELSE 'Acessível'
END AS classificacao_valor
FROM jogo;

SELECT nome_jogo, 'Online' AS status FROM jogo WHERE modo_online = 'S';

SELECT nome_jogo, 'Offline' AS status FROM jogo WHERE modo_online = 'N';

SELECT nome_jogo,
CASE
WHEN preco IS NULL OR preco = 0 THEN 'Gratuito'
WHEN preco >= 200.00 THEN 'Caro'
ELSE 'Acessível'
END AS situacao_preco,
CASE
WHEN modo_online = 'S' THEN 'Online'
ELSE 'Offline'
END AS disponibilidade_online
FROM jogo;

SELECT nome_jogo,
CASE
WHEN data_lancamento > '2026-12-31' THEN 'Lançamento Recente'
ELSE 'Antigo'
END AS status_lancamento
FROM jogo;

SELECT nome_jogo,
CASE
WHEN preco IS NULL OR preco = 0 THEN 'Gratuito'
ELSE 'Pago'
END AS status_gratuito
FROM jogo;

SELECT nome_jogo,
CASE
WHEN plataforma = 'PC' THEN 'Computador'
WHEN plataforma IN ('PS5', 'PS4', 'XBOX') THEN 'Console'
WHEN plataforma = 'Mobile' THEN 'Dispositivo Móvel'
ELSE 'Outra'
END AS categoria_plataforma
FROM jogo;

SELECT nome_jogo, preco,
CASE
WHEN preco IS NULL OR preco < 50.00 THEN 'Econômico'
WHEN preco BETWEEN 50.00 AND 150.00 THEN 'Intermediário'
ELSE 'Caro'
END AS faixa_preco
FROM jogo;

SELECT nome_jogo,
CASE
WHEN data_lancamento < '2015-01-01' THEN 'Clássico/Antigo'
ELSE 'Contemporâneo'
END AS categoria_idade
FROM jogo;

SELECT * FROM jogo WHERE modo_online = 'S' AND preco IS NOT NULL;

SELECT * FROM jogo WHERE preco IS NULL OR preco = 0 ORDER BY nome_jogo ASC;

SELECT
nome_jogo,
plataforma,
IFNULL(CONCAT('R$ ', preco), 'Gratuito') AS preco_tratado,
CASE
WHEN preco IS NULL OR preco < 50.00 THEN 'Econômico'
WHEN preco BETWEEN 50.00 AND 150.00 THEN 'Intermediário'
ELSE 'Caro'
END AS classificacao_preco
FROM jogo;

UPDATE jogo SET preco = 149.90 WHERE id = 1;

UPDATE jogo SET genero = 'Ação/Terror' WHERE id = 1;

UPDATE jogo SET modo_online = 'S' WHERE plataforma = 'PC';

UPDATE jogo SET preco = 0.00 WHERE preco IS NULL;

UPDATE jogo SET plataforma = 'Steam' WHERE id = 1;

UPDATE jogo SET data_lancamento = '2019-01-26' WHERE id = 1;

UPDATE jogo SET genero = 'Gênero Atualizado';

DELETE FROM jogo WHERE id = 9;

DELETE FROM jogo WHERE preco = 0.00;

DELETE FROM jogo WHERE genero IS NULL;

DELETE FROM jogo WHERE data_lancamento < '2010-01-01';

TRUNCATE TABLE jogo;

ALTER TABLE jogo ADD COLUMN classificacao_indicativa VARCHAR(10);

ALTER TABLE jogo ADD COLUMN tamanho_gb DECIMAL(6,2);

ALTER TABLE jogo ADD COLUMN desenvolvedora VARCHAR(90);

ALTER TABLE jogo ADD COLUMN modo_historia CHAR(1);

ALTER TABLE jogo ADD CONSTRAINT CHK_modo_historia CHECK (modo_historia IN ('S', 'N'));

ALTER TABLE jogo MODIFY COLUMN nome_jogo VARCHAR(150) NOT NULL;

ALTER TABLE jogo MODIFY COLUMN plataforma VARCHAR(50);

ALTER TABLE jogo MODIFY COLUMN preco DECIMAL(10,2);

ALTER TABLE jogo RENAME COLUMN modo_online TO status_online;

ALTER TABLE jogo DROP COLUMN desenvolvedora;

ALTER TABLE jogo DROP CONSTRAINT CHK_modo_historia;

ALTER TABLE jogo DROP COLUMN modo_historia;

ALTER TABLE jogo ADD CONSTRAINT UQ_nome_jogo UNIQUE (nome_jogo);
