create database aula_10_1ccok_262;

use aula_10_1ccok_262;


create table categoria(
id_categoria int primary key auto_increment,
nome varchar(45)
);

create table funcionario(
id_funcionario int primary key auto_increment,
nome varchar(45),
cpf char(9),
salario decimal(10,2)
);

create table produto (
id_produto int primary key auto_increment,
nome varchar(45),
preco decimal(8,2),
fk_categoria int,
constraint chfk_categoria foreign key(fk_categoria) references categoria(id_categoria)
);
create table venda(
id_venda int primary key auto_increment,
data_hora datetime,
fk_vendedor int,
constraint chfk_funcionario foreign key(fk_vendedor) references funcionario(id_funcionario)
);

create table item_venda(
fk_venda int,
fk_produto int,
qtd int,
desconto decimal (8,2),

constraint chfk_fk_venda foreign key (fk_venda) references venda(id_venda),
constraint chfk_fk_produto foreign key (fk_produto) references produto(id_produto)

);



INSERT INTO categoria (nome) VALUES 
('Eletrônicos'),
('Roupas'),
('Alimentos'),
('Livros');


INSERT INTO funcionario (nome, cpf, salario) VALUES 
('Ana Souza', '123456789', 3500.00),
('Carlos Silva', '987654321', 4200.50),
('Mariana Lima', '456789123', 2800.00);


INSERT INTO produto (nome, preco, fk_categoria) VALUES 
('Smartphone', 1500.00, 1),
('Camiseta Básica', 49.90, 2),
('Chocolate Amargo', 8.50, 3),
('Livro de SQL', 89.90, 4);


INSERT INTO venda (data_hora, fk_vendedor) VALUES 
('2026-10-23 10:30:00', 1),
('2026-10-23 11:15:00', 2),
('2026-10-23 12:00:00', 1);


INSERT INTO item_venda (fk_venda, fk_produto, qtd, desconto) VALUES 
(1, 1, 1, 50.00), 
(1, 3, 2, 0.00),  
(2, 2, 3, 5.00),   
(3, 4, 1, 10.00);


INSERT INTO item_venda (fk_venda, fk_produto, qtd, desconto) VALUES 
(1, 3, 6, 20.00), 
(2, 4, 12, 8.00);

select * from item_venda;
select * 

from produto join item_venda on produto.id_produto = item_venda.fk_produto
join venda on venda.id_venda = item_venda.fk_venda;

select 

	produto.nome,
    produto.preco,
    item_venda.qtd,
    item_venda.desconto,
    venda.data_hora,
    funcionario.nome

from produto join item_venda on produto.id_produto = item_venda.fk_produto
join venda on venda.id_venda = item_venda.fk_venda
join funcionario on venda.fk_vendedor= funcionario.id_funcionario;

--
select sum(produto.preco * item_venda.qtd) as "total de vendas de tv sem desconto"

from produto join item_venda on produto.id_produto = item_venda.fk_produto
where produto.nome ="Smartphone";

-- avg função de média

select avg(preco) from produto;
-- tratando o valor da médio dos preços com duas casas decimais.

select round(avg(preco))from produto; -- sem casas decimais
select round(avg(preco),2)from produto; -- 2 casas decimais

select truncate( avg(preco),2) from produto; -- remover casas decimais 

select ceil(avg(preco)) from produto; -- arredondar casas decimais para cima
select floor(avg(preco)) from produto; -- arredondar casas decimais para baixo