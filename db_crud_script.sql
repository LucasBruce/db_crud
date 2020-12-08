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
  tipo_logradouro varchar(30)
);

create table if not exists tbl_endereco_cliente(
  id_endereco_cliente int primary key auto_increment,
  complemento varchar(50) not null,
  nome_rua varchar(50) not null,
  numero_casa varchar(50) not null,
  cep char(9) not null,
  id_cliente int not null,
  id_tipo_logradouro int not null,
  constraint fk_id_endereco_cliente_id_cliente foreign key (id_cliente)
    references tbl_cliente (id_cliente)
    on delete cascade
    on update cascade,
  constraint fk_id_endereco_cliente_id_tipo_logradouro foreign key (id_tipo_logradouro)
    references tbl_tipo_logradouro(id_tipo_logradouro)
    on delete cascade
    on update cascade
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
    references tbl_cliente (id_cliente)
    on delete cascade
    on update cascade,
  constraint fk_id_telefone_cliente_id_tipo_telefone foreign key (id_tipo_telefone)
    references tbl_tipo_telefone(id_tipo_telefone)
    on delete cascade
    on update cascade
);

create table if not exists tbl_tecnico(
  id_tecnico int primary key auto_increment,
  nome_tecnico varchar(30) not null,
  email_tecnico varchar(30) not null
);

create table if not exists tbl_ordem_servico(
  id_ordem_servico int primary key auto_increment,
  data_ordem_servico timestamp default current_timestamp,
  equipamento varchar(150) not null,
  defeito varchar(150) not null,
  servico varchar(150),
  valor decimal(10,2),
  id_tecnico int not null,
  id_cliente int not null,
  constraint fk_id_ordem_servico_id_tecnico foreign key (id_tecnico)
    references tbl_tecnico (id_tecnico)
    on delete cascade
	on update cascade,
  constraint fk_id_ordem_servico_id_cliente foreign key (id_cliente)
    references tbl_cliente (id_cliente)
	on delete cascade
	on update cascade
); 

insert into tbl_cliente(nome_cliente, email_cliente)
  values
  ('Linsus Torvalds', 'linus@linux.com');

insert into tbl_tipo_telefone(tipo_telefone)
  values
  ('comercial'),
  ('residencial'),
  ('pessoal');

insert into tbl_telefone_cliente(telefone_cliente, id_cliente, id_tipo_telefone)
  values
  ('8888-888', 1, 2);
 
insert into tbl_tecnico(nome_tecnico, email_tecnico)
  values
  ('carluxo', 'carluxo@yahoo.com');

insert into tbl_ordem_servico(equipamento, defeito, servico, valor, id_tecnico, id_cliente)
  values
  ('Notebook', 'o dispositivo não liga', 'troca de fonte', 87.50, 1, 1);

insert into tbl_endereco_cliente(complemento, nome_rua, cep, id_cliente, id_tipo_logradouro, numero_casa)
  values
  ('casa', 'francisco massaranduba', '41253-678', 1, 1, '163');

insert into tbl_tipo_logradouro(tipo_logradouro)
 values
 ('aeroporto'), ('alameda'), ('área'), ('avenida'),
 ('campo'), ('chácara'), ('colônia'), ('condomínio'), 
 ('conjunto'), ('distrito'), ('esplanada'), ('estação'),
 ('estrada');

/*consulta trás a ordem de serviço equipamento, defeito, serviço, valor, nome do cliente, telefone
do cliente, tipo do telefone, nome do tecnico reponsavel*/
select os.id_ordem_servico, os.equipamento, os.defeito, os.servico,
os.valor, c.nome_cliente, tc.telefone_cliente, tt.tipo_telefone, t.nome_tecnico
from tbl_ordem_servico os
inner join tbl_cliente c
on c.id_cliente = os.id_cliente
inner join tbl_telefone_cliente tc
on c.id_cliente = tc.id_cliente
inner join tbl_tipo_telefone tt
on tt.id_tipo_telefone = tc.id_tipo_telefone
inner join tbl_tecnico t
on t.id_tecnico = os.id_tecnico;
