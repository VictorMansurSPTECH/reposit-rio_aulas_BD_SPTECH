/*
recapitulando 
comandos DML
UPDATE : atualiza os registros (linhas)
DELETE: apaga os registros (linhas)
DDL (ALTERANDO A ESTRUTURA) 
ALTER TABLE : altera a estrutura da tabela
		MODIFY  COLUMN: alterando a coluna 
        ADD COLUMN : adicionando a coluna 
        DROP COLUMN: remove uma coluna
        RENAME COLUMN: renomeia uma coluna
DROP : remove uma tabela
TRUNCATE: apaga os registros de uma tabela
DCL: manipula as informações
SELECT
INFNULL()
*/

-- Cria o banco de dados chamado CCOKaula03
CREATE DATABASE CCOKaula03;

-- Cria a tabela "usuario" dentro do banco CCOKaula03
CREATE TABLE CCOKaula03.usuario(
id INT PRIMARY KEY AUTO_INCREMENT, -- chave primária que se auto incrementa a cada novo registro
dt_nasc DATE NULL, -- data de nascimento, aceita valor nulo
plano VARCHAR(40) DEFAULT 'Mensal', -- plano do usuário, valor padrão 'Mensal' caso não seja informado
nivel INT , -- nível do usuário
peso DECIMAL(5,2), -- peso com até 5 dígitos, sendo 2 decimais (ex: 999.99)
nome VARCHAR(200) NOT NULL, -- nome obrigatório
cpf CHAR(11) UNIQUE NOT NULL, -- cpf obrigatório e único (não pode repetir)
CONSTRAINT chkPlano CHECK (plano IN ('Mensal','Semanal','Avulso')), -- restrição: plano só pode ser um desses 3 valores
CONSTRAINT chkNivel CHECK (nivel >= 1 AND nivel <= 5) -- restrição: nível só pode ser entre 1 e 5
);

-- Insere um novo registro (linha) na tabela usuario, informando apenas nome e cpf (os demais campos usam valor padrão/nulo)
INSERT INTO CCOKaula03.usuario (nome,cpf) VALUES('clara','12345678901');

-- Atualiza o campo "nivel" para 2, no registro onde o id for igual a 1
UPDATE CCOKaula03.usuario SET nivel = 2 WHERE ID=1;

-- Define o banco CCOKaula03 como o banco padrão para os próximos comandos (não precisa mais escrever "CCOKaula03." antes das tabelas)
USE CCOKaula03;

-- Insere outro registro na tabela usuario, agora informando vários campos
INSERT INTO usuario (cpf,nome,nivel,dt_nasc,plano,peso) VALUES
(12345678910,'rafaell',5,'2003-05-06','avulso',75.34);

-- Seleciona (exibe) todos os registros e todas as colunas da tabela usuario
SELECT * FROM usuario;

-- Altera a estrutura da tabela usuario, adicionando a coluna dt_cadastro do tipo DATETIME
ALTER TABLE usuario ADD COLUMN dt_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP; -- CURRENT_TIMESTAMP ADICIONA A HORA EXATA DO FUSOHORÁRIO DA MAQUINA

-- Seleciona todos os registros novamente, agora já com a coluna dt_cadastro
SELECT * FROM USUARIO;

-- Altera a tabela usuario adicionando duas colunas novas de uma só vez
ALTER TABLE USUARIO ADD COLUMN COR_FAVORITA VARCHAR(30), ADD COLUMN XP INT ; -- adicionando duas colunas de uma vez na tabela usuario 

-- Altera a tabela usuario: adiciona a coluna genero e remove a coluna xp na mesma instrução
ALTER TABLE USUARIO ADD COLUMN genero VARCHAR(30), DROP COLUMN XP ; -- Adicionando uma coluna de genero e retirando a coluna xp 

-- Seleciona apenas as colunas nome e dt_nasc, renomeando (apelidando) dt_nasc para "data de nascimento" na exibição
SELECT nome , dt_nasc AS "data de nascimento" FROM USUARIO; -- ALIAS É UMA APELIDO ,AS e uma sintaxe para usar o conceito de apelido 

-- Usa CASE WHEN para transformar o valor numérico de "nivel" em uma descrição textual, exibida na coluna apelidada de 'NÍVEL'
SELECT nome, CASE 
 WHEN NIVEL= 1 THEN 'NIVEL BAIXO'
 WHEN NIVEL = 2 THEN 'NIVEL MÉDIO'
 WHEN NIVEL = 3 THEN 'NIVEL ALTO'
 WHEN NIVEL = 4 THEN 'NÍVEL MUITO ALTO'
 ELSE 'NÍVEL MUITO ALTO'
 END  AS 'NÍVEL',
 dt_nasc FROM USUARIO;
 
 -- Usa CONCAT para juntar textos e valores de colunas em uma única frase; IFNULL substitui dt_nasc por 'SEM RESGISTRO' caso o valor seja nulo
 SELECT CONCAT('Olá, ', NOME, ' !, ', 'sua data de nascimento é : ', IFNULL( DT_NASC, 'SEM RESGISTRO')) AS frase FROM USUARIO;
 
 -- Usa CASE WHEN com BETWEEN para classificar o nível em 'BAIXO' (entre 1 e 3) ou 'ALTO' (qualquer outro valor)
 SELECT NOME AS 'NOME',CASE WHEN NIVEL BETWEEN 1 AND 3 THEN 'BAIXO' ELSE 'ALTO' END AS 'NÍVEL' FROM USUARIO;
    
-- Insere um novo registro usando a função NOW() para preencher dt_cadastro com a data/hora atual do momento da inserção
INSERT INTO USUARIO (nome,cpf,dt_cadastro) VALUE ('NICOLAS','12345789657', NOW());

-- Exibe todos os registros da tabela usuario após a inserção
SELECT * FROM USUARIO;

-- Cria a tabela EMPRESA, com auto_increment iniciando em 500 (o primeiro id_empresa gerado será 500)
CREATE TABLE EMPRESA (
id_empresa INT PRIMARY KEY AUTO_INCREMENT,
nome_empresa VARCHAR(100),
cnpj CHAR(14) NOT NULL
) auto_increment = 500;

-- Insere um registro na tabela EMPRESA informando apenas o CNPJ (nome_empresa fica nulo, id_empresa começa em 500)
INSERT INTO EMPRESA (CNPJ) VALUES ('1010101010111');

-- Exibe todos os registros da tabela EMPRESA
SELECT * FROM EMPRESA;

