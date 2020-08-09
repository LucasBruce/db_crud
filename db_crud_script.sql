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

create table if not exists tbl_cliente(
  id_cliente int primary key auto_increment,
  nome_cliente varchar(50) not null,
  email_cliente varchar(50) 
);

create table if not exists tbl_tipo_logradouro(
  id_tipo_logradouro int primary key auto_increment,
  tipo_logradouro varchar(50)
);

create table if not exists tbl_endereco_cliente(
  id_endereco_cliente int primary key auto_increment,
  complemento varchar(50) not null,
  nome_rua varchar(50) not null,
  numero_rua varchar(50) not null,
  cep char(9) not null,
  id_cliente int not null,
  id_tipo_logradouro int not null,
  constraint fk_id_endereco_cliente_id_cliente foreign key (id_cliente)
    references tbl_cliente (id_cliente),
  constraint fk_id_endereco_cliente_id_tipo_logradouro foreign key (id_tipo_logradouro)
    references tbl_tipo_logradouro(id_tipo_logradouro)
);

create table if not exists tbl_tipo_telefone(
  id_tipo_telefone int primary key auto_increment,
  tipo_telefone varchar(20) not null
);

create table if not exists tbl_telefone_cliente(
  id_telefone_cliente int primary key auto_increment,
  telefone_cliente varchar(15),
  id_cliente int not null,
  id_tipo_telefone int not null,
  constraint fk_id_telefone_cliente_id_cliente foreign key (id_cliente)
    references tbl_cliente (id_cliente),
  constraint fk_id_telefone_cliente_id_tipo_telefone foreign key (id_tipo_telefone)
    references tbl_tipo_telefone(id_tipo_telefone)
);


