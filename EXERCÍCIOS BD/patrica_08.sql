CREATE DATABASE IF NOT EXISTS jurassicPark;
USE jurassicPark;

CREATE TABLE parque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    localizacao VARCHAR(100),
    capacidade_maxima INT,
    data_abertura DATE
);

-- jaula nao existia, so tinha ALTER nela. criei ja com a FK
CREATE TABLE jaula (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    capacidade INT,
    id_parque INT,
    CONSTRAINT chk_capacidade CHECK (capacidade > 0),
    CONSTRAINT fk_jaula_parque FOREIGN KEY (id_parque) REFERENCES parque(id)
);

-- tipos estavam impossiveis (DECIMAL(8,10), FLOAT(4,4)), faltava PK
-- e o chk_tipo estava duplicado, o 2o era pra carnivoro
CREATE TABLE dinossauro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    tipo VARCHAR(10),
    peso DECIMAL(10,2),
    altura DECIMAL(5,2),
    carnivoro VARCHAR(6),
    ano_descoberta INT,
    CONSTRAINT chk_tipo CHECK (tipo IN ('Marinho','Terrestre','aereo')),
    CONSTRAINT chk_carnivoro CHECK (carnivoro IN ('sim','não','talvez'))
);

-- FK apontava pra "jaulas", o nome certo e jaula
ALTER TABLE dinossauro
ADD id_jaula INT,
ADD CONSTRAINT fk_jaula FOREIGN KEY (id_jaula) REFERENCES jaula(id);

-- FK do predador apontava pra tabela/coluna que nao existem
ALTER TABLE dinossauro
ADD predador INT,
ADD CONSTRAINT fk_predador FOREIGN KEY (predador) REFERENCES dinossauro(id);

-- faltava tipo na coluna cor, e especie estava com nome da tabela errado
ALTER TABLE dinossauro ADD especie VARCHAR(50);
ALTER TABLE dinossauro ADD cor VARCHAR(20);

INSERT INTO parque (nome, localizacao, capacidade_maxima, data_abertura) VALUES
('Jurassic Park Nublar', 'Ilha Nublar', 5000, '1993-06-11'),
('Jurassic World', 'Ilha Nublar', 20000, '2015-06-12'),
('Site B', 'Ilha Sorna', 3000, '1997-05-23');

INSERT INTO jaula (nome, capacidade) VALUES
('Jaula Norte', 5),
('Jaula Sul', 3),
('Jaula Aquática', 10),
('Jaula Aérea', 8),
('Jaula Oeste', 6);  -- era 'grande', capacidade e INT

-- sempre com lista de colunas
INSERT INTO dinossauro (nome, tipo, peso, altura, carnivoro, ano_descoberta) VALUES
('Rex',   'Terrestre', 8000.00,  4.2,  'sim', 1902),
('Blue',  'Terrestre', 150.00,   1.8,  'sim', 1924),
('Mosa',  'Marinho',   14000.00, 10.5, 'sim', 1829),
('Trike', 'Terrestre', 6000.00,  3,    'não', 1889),
('Ptera', 'aereo',     25.00,    1.2,  'não', 1784);

-- o insert do Rex duplicado virou update
UPDATE dinossauro SET id_jaula = 1 WHERE nome = 'Rex';
UPDATE dinossauro SET predador = 1 WHERE nome = 'Trike';

UPDATE jaula SET id_parque = 2 WHERE id IN (1, 4);

-- preenche especie antes de travar com NOT NULL
UPDATE dinossauro SET especie = 'Tyrannosaurus Rex' WHERE id = 1;
UPDATE dinossauro SET especie = 'Velociraptor'      WHERE id = 2;
UPDATE dinossauro SET especie = 'Mosasaurus'        WHERE id = 3;
UPDATE dinossauro SET especie = 'Triceratops'       WHERE id = 4;
UPDATE dinossauro SET especie = 'Pteranodon'        WHERE id = 5;

ALTER TABLE dinossauro MODIFY especie VARCHAR(50) NOT NULL;

-- o original nao tinha WHERE e marcava todo mundo como carnivoro
UPDATE dinossauro SET carnivoro = 'sim' WHERE id IN (1, 2, 3);

SELECT * FROM dinossauro;
SELECT nome, tipo FROM dinossauro;  -- sem virgula virava alias
SELECT especie, carnivoro FROM dinossauro;
SELECT * FROM dinossauro WHERE nome = 'Rex';  -- especie = 'Rex' nao achava nada
SELECT * FROM dinossauro WHERE peso > 5000;  -- peso = 'pesado' comparava numero com texto
SELECT * FROM dinossauro ORDER BY peso DESC;  -- velocidade nao existe
SELECT * FROM dinossauro WHERE tipo = 'Marinho';  -- AND sobrando
SELECT * FROM dinossauro WHERE carnivoro IN ('sim', 'não');  -- OR 'nao' nao funciona assim

-- self join: faltava alias e a condicao
SELECT d.nome AS dinossauro, p.nome AS predador
FROM dinossauro d
JOIN dinossauro p ON d.predador = p.id;

-- LEFT JOIN com WHERE em p vira INNER, usei INNER
SELECT d.nome AS dinossauro, p.nome AS predador
FROM dinossauro d
JOIN dinossauro p ON d.predador = p.id
WHERE p.nome = 'Rex';

-- o join estava comparando d.id com j.id, o certo e id_jaula
SELECT d.nome AS dinossauro, j.nome AS jaula
FROM dinossauro d
JOIN jaula j ON d.id_jaula = j.id;

SELECT d.nome AS dinossauro, j.nome AS jaula
FROM dinossauro d
JOIN jaula j ON d.id_jaula = j.id
WHERE j.nome = 'Jaula Norte';

-- WHERE em j cortava quem nao tem jaula
SELECT d.nome, j.nome, j.capacidade
FROM dinossauro d
LEFT JOIN jaula j ON d.id_jaula = j.id
WHERE j.capacidade < 3 OR j.id IS NULL;

-- todos os dinossauros do parque
SELECT d.nome AS dinossauro, d.tipo, j.nome AS jaula, p.nome AS parque
FROM dinossauro d
LEFT JOIN jaula j ON d.id_jaula = j.id
LEFT JOIN parque p ON j.id_parque = p.id;