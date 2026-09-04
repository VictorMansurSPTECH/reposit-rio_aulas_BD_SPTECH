CREATE DATABASE aula_pre_prova;
USE aula_pre_prova;

CREATE TABLE produtos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60),
    tipo VARCHAR(45),
    CONSTRAINT chk_tipo CHECK(tipo IN ('Eletrodoméstico', 'Alimento', 'Videogame')),
    preco DECIMAL(5, 2),
    quantidade_venda INT DEFAULT 0,
    dt_compra DATETIME NOT NULL,
    dt_venda DATETIME,
    desconto DECIMAL(5,2));
    
INSERT INTO produtos(nome, tipo, preco, dt_compra, desconto) VALUES
('Geladeira', 'Eletrodoméstico', 500.50, '2026-08-28', 0);

SELECT * FROM produtos;

ALTER TABLE produtos MODIFY COLUMN dt_venda DATETIME DEFAULT CURRENT_TIMESTAMP;

DESC produtos;

INSERT INTO produtos(nome, tipo, preco, dt_compra, quantidade_venda, desconto) VALUES
('TV Oled 8k', 'Eletrodoméstico', 100.00, '2026-08-28', 100, 0.10),
('Nintendo 64', 'Videogame', 700.99, '2026-08-27', 200, 50.00),
('Bolacha', 'Alimento', 9.99, '2026-08-24', 1000, 0),
('GTA6', 'Videogame', 499.99, '2026-07-28', 2, 0.00);

SELECT * FROM produtos;

SELECT * FROM produtos WHERE dt_venda IS NULL;

SELECT * FROM produtos WHERE dt_venda IS NOT NULL;

SELECT nome, dt_venda, ISNULL(dt_venda) FROM produtos;

-- COMANDA PARA SUBSTITUIR O NULL POR ALGO
SELECT nome, dt_venda, IFNULL(dt_venda, 'Produto ruim. Não vendeu') FROM produtos;

SELECT nome, preco, NULLIF(dt_compra, dt_venda) FROM produtos;

-- data hora 

SELECT NOW(), CURRENT_TIMESTAMP,CURDATE();

-- COMANDO QUE BUSCA SOMENTE A DATA - DIA
SELECT nome,tipo, DAY(dt_compra) AS 'DIA' FROM produtos;

SELECT nome,tipo, MONTH(dt_compra) AS 'MÊS' FROM produtos;

SELECT nome,tipo, YEAR(dt_compra) AS 'ANO' FROM produtos;


-- COMANDO PARA FORMATAR A SAIA DA DATA 
SELECT NOME,TIPO, DATE_FORMAT(dt_compra,'%d/%m/%y %H:%I:%S') AS 'DATA FORMATADA' FROM PRODUTOS;

-- %d para representar o dia
-- %m para represntar o mes 
-- %y para representar o ano

-- %H para representar hora 
-- %I para minutos
-- %S para segundos 

-- DATEDIFF()

SELECT nome,tipo, DATEDIFF(NOW(),dt_compra) AS 'Dias desde a compra' FROM produtos;

-- TIMESTAMPDIFF()
-- COMANDO PARA CALCULAR A DISTÂNCIA DE DUSAS DATAS PELA UNIDADE DE MEDIDA QUE PREFERIR:
-- MINUO,DIA,HORA...
SELECT nome, timestampdiff(DAY,dt_compra, NOW()) FROM PRODUTOS;


SELECT nome,tipo,preco, preco *quantidade_venda from produtos;

SELECT nome,tipo,preco, preco - desconto FROM produtos;

ALTER TABLE produtos add column procent_descon INT;


-- comando PARA REMOER O SAFE UPDATE

SET SQL_SAFE_UPDATES = 0;

UPDATE produtos SET procent_descon = 20 WHERE DESCONTO = 0;

SET SQL_SAFE_UPDATES =1;
UPDATE produtos SET procent_descon = 20 WHERE desconto = 0;