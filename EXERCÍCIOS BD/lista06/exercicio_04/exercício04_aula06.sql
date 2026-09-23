CREATE DATABASE BD_loja_virtual;
USE BD_loja_virtual;

CREATE TABLE categorias (
    idcategorias INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    categoria_prod VARCHAR(45) NULL,
    descricao VARCHAR(45) NULL
);

CREATE TABLE produto (
    idproduto INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_prod VARCHAR(45) NULL,
    preco_prod DECIMAL(6,2) NULL,
    qtd_prod INT NULL,
    FK_CATEGORIAS INT,
    CONSTRAINT CH_FK_CATEGORIAS FOREIGN KEY(FK_CATEGORIAS)
    REFERENCES CATEGORIAS(IDCATEGORIAs)
);
SELECT 
	PRODUTO.NOME_PROD AS "NOME DO PRODUTO",
    PRODUTO.PRECO_PROD AS "PREÇO DO PRODUTO",
    CASE 
		WHEN PRODUTO.QTD_PROD =0 THEN "INDISPONÍVEL"
		WHEN PRODUTO.QTD_PROD >=1 AND PRODUTO.QTD_PROD <=5 THEN "ESTOQUE BAIXO"
		WHEN PRODUTO.QTD_PROD >5 THEN "DISPONÍVEL"
	END AS "QUANTIDADE DO ESTOQUE",
    CATEGORIAS.CATEGORIA_PROD AS "CATEGORIA DO PRODUTO"

FROM CATEGORIAs JOIN PRODUTO ON PRODUTO.FK_CATEGORIAS = CATEGORIAS.IDCATEGORIAS 
ORDER BY CATEGORIAS.CATEGORIA_PROD ASC,PRODUTO.PRECO_PROD DESC;

INSERT INTO categorias (categoria_prod, descricao) VALUES
('Eletrônicos', 'Aparelhos eletrônicos em geral'),
('Roupas', 'Vestuário masculino e feminino'),
('Alimentos', 'Produtos alimentícios'),
('Livros', 'Livros físicos e digitais');

-- Produtos
INSERT INTO produto (nome_prod, preco_prod, qtd_prod, FK_CATEGORIAS) VALUES
('Smartphone Galaxy A54', 1899.90, 25, 1),
('Notebook Dell Inspiron', 3599.00, 10, 1),
('Fone de Ouvido Bluetooth', 149.90, 50, 1),
('Smart TV 50"', 2299.00, 15, 1),
('Camiseta Básica', 39.90, 100, 2),
('Calça Jeans', 129.90, 60, 2),
('Jaqueta de Couro', 349.90, 20, 2),
('Vestido Floral', 89.90, 40, 2),
('Arroz 5kg', 24.90, 200, 3),
('Feijão 1kg', 8.50, 150, 3),
('Café Torrado 500g', 15.90, 80, 3),
('Azeite Extra Virgem', 32.90, 45, 3),
('Dom Casmurro', 29.90, 30, 4),
('1984', 39.90, 25, 4),
('Sapiens', 54.90, 20, 4);