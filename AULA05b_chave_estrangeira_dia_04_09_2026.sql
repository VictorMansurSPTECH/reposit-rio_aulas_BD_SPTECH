create database aula5_ccok262;
use aula5_ccok262;
create table aluno(
id_aluno int primary key auto_increment,
nome varchar(45),
ra char(8)
);

create table empresa(
id_empresa int primary key auto_increment,
nome varchar(45),
cnpj char(14)
);


create user 'estag'@'%' identified by 'SPTECH@123senha'; -- % faz com que o usuário acesse qualquer ip, mas não podenso acessar os schemas

show grants for 'estag'@'%'; -- consulta permissões dos usuários

grant select on aula5_ccok262.* to 'estag'@'%'; -- *.* concede permissão de acesso a todos os schemas e todas as suas tabelas | *.* schema.table


grant all on *.* to 'estag'@'%'; -- dando todas as permissões de todos os comandos e tabelas

grant create,update on aula5_ccok262.aluno to 'estag'@'%'; -- dando prmissão para comandos create e update

flush privileges; -- recarrega as permissões do usuário


revoke all privileges, grant option from 'estag'@'%'; -- removendo todas as permissões do usuário estag

revoke create on aula5_ccok262.* from 'estag'@'%';

drop user 'estag'@'%';
