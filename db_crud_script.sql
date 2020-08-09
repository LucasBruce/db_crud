/*criando o banco*/
create database if not exists db_infox;

/*selecionando o banco de dados*/
use db_infox;

/*criando tabela usuário*/
create table if not exists tbl_usuario(
  id_usuario int primary key auto_increment,
  usuario varchar(50) not null,
  fone varchar (15),
  login varchar(15) not null unique,
  senha varchar(15) not null
);

/*propriedades da tabela*/
describe tbl_usuario;

/*Inserindo dados na tabela (CRUD)
C -> Create -> Insert*/
insert into tbl_usuario(usuario, fone, login, senha, id_usuario)
  values('Lucas Bruce', '9999-9999', 'lucasbruce', '123456', 1);

insert into tbl_usuario(usuario, fone, login, senha , id_usuario)
  values
  ('Administrador', '8888-8888', 'admin', 'admin', 2),
  ('dudu bananinha', '3333-3333', 'dudu', '123456', 3);
  
/*Visualizar os dados na tabela(CRUD)
R -> Reader -> select*/
select * from tbl_usuario;

/*Atualiza os dados na tabela(CRUD)
U -> Update -> update*/
update tbl_usuario set fone = '7777-7777' where id_usuario = 3;

/*visualizando os dados na tabela*/
select * from tbl_usuario;

/*deletando o registro da tabela(CRUD)
D -> delete -> delete*/
delete from tbl_usuario where id_usuario = 3;