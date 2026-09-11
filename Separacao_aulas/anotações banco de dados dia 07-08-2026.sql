/*
banco de dados relacional
tabelas e linhas que se relacionam entre signal
toda tabela precisa ter um identificador único para cada linha(id)
Em mysql o identificador se chama primary key apelido para pk
*/

-- create database ccok262; 
USE ccok262;
CREATE TABLE empresa (
id INT PRIMARY KEY ,
nome VARCHAR(120),
cnpj CHAR(14)
);

INSERT INTO empresa (id,nome)VALUES 
(1,'clara faria'),(2,'sptech'),(3,'safra'),(4,'itaú');

-- SLECIONANDO TODAS OS CAMPOS DA TABELA 
SELECT * FROM empresa;

-- SELECIONANDO CAMPOS EXPECIFICOS DA TABELA 
SELECT id,nome FROM empresa;


-- selecionando todas as empresas que começam com a letra s 
SELECT nome FROM empresa WHERE nome LIKE 'S%';

-- todas as empresas que terminam com a letra a
SELECT nome FROM empresa WHERE nome like '%a';

-- todas as empresas que começam com a letra a 
SELECT nome FROM empresa WHERE nome LIKE 'a%'; 

-- selecionando todas as empresas que tenham a letra a na metade de sua composição
SELECT nome FROM empresa WHERE nome like '%a%';

-- SELECIONANDO AS EMPRESAS QUE TEM A PENÚLTIMA LETRA COM A LETRA A 
SELECT nome FROM empresa WHERE nome like '%a_';

-- selecionando uma empresa onde a segunda letra é a
SELECT nome FROM empresa WHERE nome LIKE '_l%';

-- selecionando empresas que não são a clara 
SELECT nome FROM empresa WHERE nome <> 'Clara faria'; 


-- selecionando empresas cujo o id seja 1
SELECT * FROM empresa WHERE id=1;

-- ordenano a minha consulta em ordem alfabética
SELECT * FROM empresa ORDER BY nome;

-- ordenando a minha consulta em ordem decresente 
SELECT nome FROM empresa ORDER BY nome DESC;

-- ELIMINANDO TABELA 
-- DROP TABLE empresa;


