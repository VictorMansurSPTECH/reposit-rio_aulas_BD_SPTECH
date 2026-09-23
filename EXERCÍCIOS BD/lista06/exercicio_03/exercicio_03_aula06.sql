CREATE DATABASE banco_empresa;
USE banco_empresa;

CREATE TABLE departamento (
    iddepartamento INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomeDepartamento VARCHAR(45) NULL,
    tipodepartamento VARCHAR(45) NULL
);

CREATE TABLE funcionario (
    idfuncionario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NULL,
    cargo VARCHAR(45) NULL,
    salario DECIMAL(10,3) NULL,
    FK_DEPARTAMENTO INT,
    CONSTRAINT CH_FK_DEPARTAMENTO FOREIGN KEY(FK_DEPARTAMENTO)
    REFERENCES DEPARTAMENTO(IDDEPARTAMENTO)
    
);

SELECT
	FUNCIONARIO.NOME AS "NOME DO FUNCIONÁRIO",
    FUNCIONARIO.CARGO AS "CARGO",
    CASE 
			WHEN FUNCIONARIO.SALARIO <3000 THEN "SALÁRIO INICIAL"
			WHEN FUNCIONARIO.SALARIO > 3000 AND FUNCIONARIO.SALARIO <6000 THEN "SALÁRIO INTERMEDIÁRIO"
			WHEN FUNCIONARIO.SALARIO > 6000 THEN "SALÁRIO AVANÇADO"
    
	END AS "CLASSIFICAÇÃO",
    
    DEPARTAMENTO.NOMEDEPARTAMENTO AS "DEPARTAMENTO ATUANTE"

FROM FUNCIONARIO JOIN DEPARTAMENTO ON FUNCIONARIO.FK_DEPARTAMENTO = DEPARTAMENTO.IDDEPARTAMENTO
ORDER BY FUNCIONARIO.SALARIO ASC;


INSERT INTO departamento (nomeDepartamento, tipodepartamento) VALUES
('Recursos Humanos', 'Administrativo'),
('Financeiro', 'Administrativo'),
('Tecnologia da Informação', 'Operacional'),
('Vendas', 'Comercial');

-- Funcionários
INSERT INTO funcionario (nome, cargo, salario, FK_DEPARTAMENTO) VALUES
('Carlos Mendes', 'Analista de RH', 3500.000, 1),
('Fernanda Alves', 'Assistente de RH', 2200.000, 1),
('Roberto Nunes', 'Gerente de RH', 6800.000, 1),
('Juliana Ramos', 'Analista Financeiro', 3800.000, 2),
('Marcos Vieira', 'Contador', 4500.000, 2),
('Patrícia Gomes', 'Assistente Financeiro', 2300.000, 2),
('André Barbosa', 'Desenvolvedor', 5200.000, 3),
('Bruna Cardoso', 'Analista de Suporte', 3200.000, 3),
('Diego Martins', 'Gerente de TI', 7500.000, 3),
('Camila Teixeira', 'DBA', 5800.000, 3),
('Felipe Rocha', 'Vendedor', 2800.000, 4),
('Aline Correia', 'Gerente de Vendas', 6200.000, 4);