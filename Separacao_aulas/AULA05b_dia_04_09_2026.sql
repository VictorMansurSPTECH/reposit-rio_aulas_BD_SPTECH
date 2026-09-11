create database aula5_ccok262b;
use aula5_ccok262b;
create table aluno(
id_aluno int primary key auto_increment,
nome varchar(45),
ra char(8),
fk_empresa int,
constraint ckf_empresa foreign key (fk_empresa) references empresa (id_empresa)
);

create table empresa(
id_empresa int primary key auto_increment,
nome varchar(45),
cnpj char(14)
);


select 

	nome.aluno as 'nome do aluno',
    nome.empresa as 'nome da empresa'
    from aluno
    join empresa
    on empresa.id_empresa = aluno.fk_empresa;

