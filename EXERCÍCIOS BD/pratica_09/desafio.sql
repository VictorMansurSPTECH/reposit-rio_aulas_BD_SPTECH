-- ============================================================
-- AULA 12
-- Banco: aula12_ccok262
-- ============================================================

CREATE DATABASE aula12_ccok262;
USE aula12_ccok262;

-- ============================================================
-- 1. CRIAÇÃO DAS TABELAS
-- ============================================================

CREATE TABLE empresa (
    id_empresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL,
    cnpj CHAR(14) NOT NULL UNIQUE
);

CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    fk_empresa INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    CONSTRAINT fk_categoria_empresa
        FOREIGN KEY (fk_empresa)
        REFERENCES empresa (id_empresa)
);

CREATE TABLE funcionario (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    fk_empresa INT NOT NULL,
    nome VARCHAR(80) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    CONSTRAINT fk_funcionario_empresa
        FOREIGN KEY (fk_empresa)
        REFERENCES empresa (id_empresa)
);

CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    fk_categoria INT NOT NULL,
    nome VARCHAR(80) NOT NULL,
    preco_atual DECIMAL(10,2) NOT NULL,
    CONSTRAINT chk_preco_produto
        CHECK (preco_atual > 0),
    CONSTRAINT fk_produto_categoria
        FOREIGN KEY (fk_categoria)
        REFERENCES categoria (id_categoria)
);

CREATE TABLE venda (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    fk_empresa INT NOT NULL,
    fk_funcionario INT NULL,
    data_venda DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_venda_empresa
        FOREIGN KEY (fk_empresa)
        REFERENCES empresa (id_empresa),
    CONSTRAINT fk_venda_funcionario
        FOREIGN KEY (fk_funcionario)
        REFERENCES funcionario (id_funcionario)
);

CREATE TABLE item_venda (
    fk_venda INT NOT NULL,
    numero_item INT NOT NULL,
    fk_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (fk_venda, numero_item),
    CONSTRAINT chk_numero_item
        CHECK (numero_item > 0),
    CONSTRAINT chk_quantidade_item
        CHECK (quantidade > 0),
    CONSTRAINT chk_preco_item
        CHECK (preco_unitario > 0),
    CONSTRAINT fk_item_venda
        FOREIGN KEY (fk_venda)
        REFERENCES venda (id_venda),
    CONSTRAINT fk_item_produto
        FOREIGN KEY (fk_produto)
        REFERENCES produto (id_produto)
);

-- ============================================================
-- 2. INSERTS
-- ============================================================

INSERT INTO empresa (id_empresa, nome, cnpj) VALUES
    (1, 'Loja Centro', '11111111000111'),
    (2, 'Loja Bairro', '22222222000122'),
    (3, 'Loja Nova',   '33333333000133');

INSERT INTO categoria (id_categoria, fk_empresa, nome) VALUES
    (1, 1, 'Papelaria'),
    (2, 1, 'Livros'),
    (3, 2, 'Papelaria'),
    (4, 2, 'Jogos');

INSERT INTO funcionario (
    id_funcionario, fk_empresa, nome, email
) VALUES
    (1, 1, 'Ana',   'ana@centro.exemplo'),
    (2, 1, 'Bruno', 'bruno@centro.exemplo'),
    (3, 2, 'Carla', 'carla@bairro.exemplo'),
    (4, 2, 'Diego', 'diego@bairro.exemplo');
    
    
    


INSERT INTO produto (
    id_produto, fk_categoria, nome, preco_atual
) VALUES
    (1, 1, 'Caderno',              30.00),
    (2, 1, 'Caneta',                5.00),
    (3, 2, 'Livro de SQL',         80.00),
    (4, 2, 'Livro de Python',     100.00),
    (5, 3, 'Caderno',              28.00),
    (6, 3, 'Caneta',                4.00),
    (7, 4, 'Jogo de tabuleiro',   150.00),
    (8, 4, 'Baralho',              20.00),
    (9, 1, 'Estojo',               25.00);

INSERT INTO venda (
    id_venda, fk_empresa, fk_funcionario, data_venda
) VALUES
    (1, 1, 1,    '2026-10-01 09:00:00'),
    (2, 1, 1,    '2026-10-02 10:30:00'),
    (3, 1, NULL, '2026-10-03 14:00:00'),
    (4, 1, 1,    '2026-10-04 11:00:00'),
    (5, 1, NULL, '2026-10-05 16:00:00'),
    (6, 2, 3,    '2026-10-06 09:30:00'),
    (7, 2, NULL, '2026-10-07 15:00:00');

INSERT INTO item_venda (
    fk_venda, numero_item, fk_produto, quantidade, preco_unitario
) VALUES
    (1, 1, 1,  2, 25.00),
    (1, 2, 2, 10,  5.00),

    (2, 1, 1,  4, 25.00),
    (2, 2, 3,  1, 80.00),

    (3, 1, 2, 20,  5.00),
    (3, 2, 4,  2, 100.00),

    (4, 1, 3,  1, 50.00),

    (5, 1, 4,  1, 100.00),

    (6, 1, 5, 10, 25.00),
    (6, 2, 6, 50,  3.00),

    (7, 1, 5, 20, 25.00),
    (7, 2, 6, 25,  4.00);


-- Situações disponíveis para explorar:
-- Loja Nova não possui categorias, funcionários ou vendas.
-- Bruno e Diego não possuem vendas sob sua responsabilidade.
-- As vendas 3, 5 e 7 não possuem responsável.
-- A categoria Jogos possui produtos, mas não possui vendas.
-- Os produtos 7, 8 e 9 nunca foram vendidos.
-- Existem produtos e categorias com nomes iguais em empresas diferentes.
-- Existem preços praticados diferentes do preço atual.
-- Uma mesma venda pode conter produtos de categorias diferentes.

-- ============================================================
-- 3. EXERCÍCIOS
-- ============================================================

-- ============================================================
-- NÍVEL 1
-- ============================================================


-- 01. A gestão precisa conferir as vendas sem responsável
-- realizadas entre 01/10/2026 e 05/10/2026, incluindo o dia 5 inteiro.
-- Apresente ID da venda, ID da empresa e data da venda.
select
	v.id_venda As "ID da venda ",
    v.data_venda As "Data e horário das vendas",
    f.nome as "funcinário"
from venda as v left join funcionario as f on v.fk_funcionario = f.id_funcionario
where v.data_venda >= "2026-10-01 00:00:00" and v.data_venda <="2026-10-05 00:00:00" and f.id_funcionario is null;

-- 02. O setor de compras quer consultar os três produtos
-- mais baratos do catálogo com preço atual de até 30.00.
-- Apresente ID, nome e preço atual.
-- Ordene pelo menor preço.
-- Retorne no máximo três produtos.S

select 
	produto.nome as "nome do produto",
    produto.preco_atual as "preço atual"
from produto where produto.preco_atual <=30.00
order by preco_atual asc
limit 3 ;


-- ============================================================
-- NÍVEL 2
-- ============================================================

-- 03. A gestão quer visualizar todas as empresas e seus funcionários,
-- incluindo empresas que ainda não possuem funcionários.
-- Apresente ID e nome da empresa, além do ID e nome do funcionário.
-- Ordene pelo ID da empresa


-- 04. A equipe administrativa precisa consultar todas as vendas,
-- incluindo aquelas que não possuem responsável.
-- Apresente ID da venda, nome da empresa, data da venda
-- e nome do funcionário responsável.
-- Quando não houver responsável, exiba "Sem responsável".
-- Ordene pelo ID da venda.


-- ============================================================
-- NÍVEL 3
-- ============================================================

-- 05. O setor de compras precisa analisar a saída dos produtos.
-- Para cada produto, apresente ID, nome, empresa,
-- quantidade total de unidades vendidas e faturamento total.
-- Inclua produtos nunca vendidos, apresentando zero nos indicadores.
-- Produtos com o mesmo nome devem permanecer separados.
-- Ordene pelo faturamento decrescente.


-- 06. A gestão precisa avaliar as vendas de cada funcionário.
-- Apresente ID e nome do funcionário, nome da empresa,
-- quantidade de vendas distintas e faturamento sob sua responsabilidade.
-- Inclua funcionários sem vendas, apresentando zero nos indicadores.
-- Uma venda com vários itens deve ser contada uma única vez.
-- Ordene pela empresa e pelo ID do funcionário.


-- 07. A direção quer um resumo financeiro de todas as empresas.
-- Apresente ID e nome da empresa, quantidade de vendas distintas,
-- quantidade total de unidades vendidas e faturamento total.
-- Inclua empresas sem vendas, apresentando zero nos indicadores.
-- Considere também vendas sem funcionário responsável.
-- Ordene pelo faturamento decrescente.


-- ============================================================
-- NÍVEL 4
-- ============================================================

-- 08. A equipe comercial quer identificar produtos com saída relevante
-- na primeira semana de outubro de 2026.
-- Considere vendas de 01/10/2026 a 07/10/2026, incluindo os dias inteiros,
-- e somente itens com preço unitário praticado de pelo menos 4.00.
-- Apresente ID e nome do produto, empresa, unidades vendidas
-- e faturamento dos itens considerados.
-- Mostre somente produtos com pelo menos 20 unidades vendidas
-- e faturamento de pelo menos 150.00 após os filtros.
-- Ordene pelo faturamento decrescente.


-- 09. A gestão quer identificar categorias com participação
-- frequente nas vendas e faturamento relevante.
-- Apresente empresa, ID e nome da categoria,
-- quantidade de vendas distintas e faturamento.
-- Mostre somente categorias com pelo menos três vendas distintas
-- e faturamento de pelo menos 300.00.
-- Uma venda com vários produtos da mesma categoria deve ser
-- contada uma única vez para essa categoria.
-- Ordene pelo faturamento decrescente.


-- ============================================================
-- NÍVEL 5
-- ============================================================

-- ============================================================
-- NÍVEL 5
-- ============================================================

-- 10. A direção precisa consultar regularmente o desempenho
-- das categorias de cada empresa.
--
-- Crie uma VIEW chamada vw_desempenho_categoria que apresente,
-- para cada categoria:
-- ID e nome da empresa, ID e nome da categoria,
-- quantidade de produtos cadastrados, quantidade de vendas
-- distintas, total de unidades vendidas e faturamento total.
--
-- Inclua categorias sem vendas, apresentando zero nos indicadores
-- de vendas, unidades vendidas e faturamento.
-- A quantidade de produtos cadastrados deve incluir também
-- os produtos nunca vendidos.
-- Cada produto deve ser contado uma única vez por categoria,
-- mesmo que tenha sido vendido várias vezes.
-- Uma venda com vários produtos da mesma categoria deve ser
-- contada uma única vez para essa categoria.
-- Categorias com nomes iguais devem permanecer separadas.
-- Calcule o faturamento utilizando o preço praticado nos itens.
--
-- Depois, escreva um SELECT utilizando somente essa VIEW
-- para consultar as categorias que possuem pelo menos dois
-- produtos cadastrados, participaram de pelo menos duas vendas
-- distintas e faturaram pelo menos 400.00.
--
-- Apresente nome da empresa, nome da categoria, quantidade
-- de produtos, quantidade de vendas, unidades vendidas
-- e faturamento.
-- Ordene pelo faturamento decrescente e, em caso de empate,
-- pelo ID da categoria em ordem crescente.