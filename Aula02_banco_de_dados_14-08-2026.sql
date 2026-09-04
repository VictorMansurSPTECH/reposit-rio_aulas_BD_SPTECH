CREATE DATABASE ccok262Aula02;
use ccok262Aula02;

/*
números decimais 

FLOAT - usa até 7 digitos 
DOUBLE - usa até 17 digitos 
DECIMAL -  usa de 1 há 65 digitos e controlo a quantidade de casas decimais antes e depois da vírgula.
*/
/*
outros tipos dde campos:

numérico TINYINT : vai de -128 até 127
DATA : DATE - YYYY-MM-DD
DATA E HORA : DATETIME - YYYY-MM-DD HH:MM: SS

AUTO_INCREMENT : incrementa automaticamente o meu campo
snake case : padrão de nomenclatura onde as palavras são separadas por underline
camel case: padrão de nomenclatura onde as palavras são separadas por uma letra maiúscula
*/
 CREATE TABLE pessoa (
 id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(80),
 dt_nascimento DATE 
 );
 
 INSERT INTO pessoa (nome, dt_nascimento) VALUES ("VICTOR", "1980-06-12");
 
 INSERT INTO pessoa (nome, dt_nascimento) VALUES('Pedro', '1999-10-12'),('mariana','2014-04-05');
 
 SELECT * FROM pessoa;
 
 DESC pessoa;  -- ver a estrutura da tabela 
 
 DESCRIBE pessoa; -- descreve a tabela
 
 SHOW TABLES; -- mostratodas as tabelas 
 
 INSERT INTO pessoa (nome) VALUES('Guilherme'),('Mônica');
 
 SELECT nome, IFNULL (dt_nascimento,'Sem data de nascimento') FROM pessoa; -- se o campo dt_nascimento estiver vaziu coloque 'Sem data de nascimento'
 
ALTER TABLE pessoa ADD COLUMN cpf CHAR(11); -- estou adicionando uma nova coluna na tabela pessoa

DESC pessoa;

ALTER TABLE pessoa MODIFY COLUMN cpf VARCHAR(12); -- modificando coluna da tabela e adicionando um cpf

ALTER TABLE pessoa DROP COLUMN cpf; -- excluindo coluna cpf

ALTER TABLE pessoa RENAME COLUMN dt_nascimento TO dt_nasc; -- renomeando nome da tabela 

DESC pessoa;

UPDATE pessoa SET nome = 'Clara faria ' WHERE id_pessoa= 4; -- atualizando a tabela pessoa mudando nome da pessoa que tem o id 5

UPDATE pessoa SET nome ='Sem nome' WHERE id_pessoa IN(1,2); -- atualiza a tabela pessoa na coluna nome onde o id for 1 e 2

SELECT * FROM pessoa;

DELETE FROM pessoa WHERE id_pessoa=1;


TRUNCATE pessoa; -- deleta todos os registros da tabela sem apagar a tabela 

CREATE TABLE funcinário(
id_func INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (50) DEFAULT 'SEM NOME', -- DEFAULT serve para quando não tiver as infromções do insert nesta coluna ela vai automaticamente 'sem nome'
cpf CHAR(11) NOT NULL UNIQUE
);

