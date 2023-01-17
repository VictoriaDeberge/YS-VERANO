 DROP DATABASE IF EXISTS YSVERANO;

CREATE DATABASE YSVERANO CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;

USE YSVERANO;

CREATE TABLE ENDERECO (
CEP CHAR(9) PRIMARY KEY,
RUA VARCHAR(60) NOT NULL,
BAIRRO VARCHAR(40) NOT NULL,
CIDADE VARCHAR(40) NOT NULL,
UF CHAR(2) NOT NULL);

CREATE TABLE CLIENTE (
MATRICULA INTEGER PRIMARY KEY,
NOME VARCHAR(60) NOT NULL,
TELEFONE VARCHAR(15) NOT NULL,
CPF CHAR(14) NOT NULL,
RG VARCHAR(15) NOT NULL,
SEXO VARCHAR(8),
DATANASCIMENTO DATE NOT NULL,
CEP CHAR(9) NOT NULL,
NUMEROCASA SMALLINT NOT NULL,
COMPLEMENTO VARCHAR(30),
FOTO VARCHAR(255),
FOREIGN KEY(CEP) REFERENCES ENDERECO(CEP));

CREATE TABLE NOME (
NOME VARCHAR(60) NOT NULL,
TELEFONE VARCHAR(15) NOT NULL,
CPF CHAR(14) NOT NULL,
RG VARCHAR(15) NOT NULL,
DATANASCIMENTO DATE NOT NULL,
CEP CHAR(9) NOT NULL,
NUMEROCASA SMALLINT NOT NULL,
COMPLEMENTO VARCHAR(30),
FOTO VARCHAR(255),
FOREIGN KEY(CEP) REFERENCES ENDERECO(CEP));

CREATE TABLE FUNCIONARIO (
CPFFUNCIONARIO CHAR (14) PRIMARY KEY,
NOME VARCHAR(60) NOT NULL,
TELEFONE VARCHAR(15) NOT NULL,
RG VARCHAR(15) NOT NULL,
CEP CHAR(9) NOT NULL,
NUMEROCASA SMALLINT NOT NULL,
COMPLEMENTO VARCHAR(30),
FOTO VARCHAR(255),
FOREIGN KEY(CEP) REFERENCES ENDERECO(CEP));

CREATE table produto{
codigoproduto integer privacy key auto_increment,
nome varchar(60)not null,
cor varchar(30)not null,
valor double not null,
tamanho char(2)not null,
quantidade integer not null;

CREATE table venda{
idvenda integer primary key auto_increment,
data date not null,
valor double not null,
quantidade integer not null,
cpffuncionario char(14)not null,
foreign key(codigoproduto)references produto(codigoproduto),
foreign key(cpffuncionario) references funcionario(cpffuncionario);

	quantidade integer not null,
	codigoproduto integer not null,
	cpffuncionario char(14)not null,
	foreign key(codigoproduto)references produto(codigoproduto),
	foreign key(cpffuncionario)references funcionario(cpffuncionario));
	
insert into endereco(cep,rua,bairro,cidade,uf)VALUES
('23085-210','Rua Padre Pauwles','Campo Grande', 'Rio de Janeiro', 'RJ'),
('26551-090','Travessa Elpidio','Cruzeiro do Sul','Mesquita','RJ');

insert into cliente(nome,telefone,rg,cpf,datanascimento,cep,numerocasa,complemento,foto,sexo)VALUES
('Maria','(21)99886-1055','12555','123456893-10','2001-08-01','23085-610',31,'ap 102','feminino','vazio'),
('Pedro','(21)99999-1055','00012','123456789-10','1997-10-20','26551-090',100,'fundos','masculino','vazio');
	
insert into funcionario(cpffuncionario,nome,telefone,rg,cep,numerocasa,complemento,foto,sexo)VALUES
('123','Mário Silva','(21)9999-8888','0001','23085-610',40,'ap 202','masculino','vazio'),
('456','Gabriel Silva','(21)9999-7777','0002','26551-090',100,'casa','masculino','vazio'),
('789','Mariana Souza','(21)9999-5555','1234','23085-610',1820,'casa','feminino','vazio');

insert into produto(nome,cor,valor,tamanho,quantidade)VALUES
('Conjunto Peace Love','preto',200,'P',20),
('Conjunto Peace','vermelho',200,'M',30);

insert into venda(data,valor,quantidade,codigoproduto,cpffuncionario)VALUES
('2022-12-05',300,2,1,'789'),
('2022-12-05',120,1,2,'789');

