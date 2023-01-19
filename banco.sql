 DROP DATABASE IF EXISTS YSVERANO;

CREATE DATABASE YSVERANO CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;


CREATE TABLE CATEGORIA(
ID_CATEGORIA INT PRIMARY KEY,
DESCRICAO VARCHAR(200));

CREATE TABLE CLIENTE (
ID_CLIENTE INT PRIMARY KEY,
NOME VARCHAR(60) NOT NULL,
CPF CHAR(14) NOT NULL,
TELEFONE VARCHAR(15) NOT NULL,
EMAIL VARCHAR(20) ,
CEP CHAR(9) NOT NULL,
NUMEROCASA SMALLINT NOT NULL,
COMPLEMENTO VARCHAR(30),
FOTO VARCHAR(255));


CREATE TABLE FORNECEDOR(
	ID_FORNECEDOR INT PRIMARY KEY,
	NOME VARCHAR(200),
	TELEFONE VARCHAR(15) NOT NULL,
	EMAIL VARCHAR(20) NOT NULL,
	CEP CHAR(9) NOT NULL,
    NUMEROCASA SMALLINT NOT NULL,
    COMPLEMENTO VARCHAR(30),
	CONTA_BANCARIA INT NULL,
	AGENCIA INT NULL,
	CONTA INT NULL);



CREATE TABLE VENDEDOR (
ID_VENDEDOR INT PRIMARY KEY,
NOME VARCHAR(60) NOT NULL,
PIS INT NULL,
CPFFUNCIONARIO CHAR (14),
TELEFONE VARCHAR(15) NOT NULL,
EMAIL VARCHAR(20),
CEP CHAR(9) NOT NULL,
NUMEROCASA SMALLINT NOT NULL,
COMPLEMENTO VARCHAR(30),
AGENCIA INT,
CONTA_BANCARIA INT,
FOTO VARCHAR(255));

CREATE table roupa(
id_roupa INT PRIMARY KEY,
produto_nome VARCHAR(200),
quantidade int not null,
tamanho char(2)not null,
cor varchar(30)not null,
custo double,
valor double not null,
Fornecedor_id_Fornecedor int null);

CREATE TABLE VENDA_ROUPA(
	ID_VENDA_ROUPA INT PRIMARY KEY AUTO_INCREMENT,
    ID_ROUPA INT NOT NULL,
    ID_VENDA INT NOT NULL,
	quantidade INT null,
	VALOR DOUBLE NOT NULL, 
FOREIGN KEY(ID_ROUPA) REFERENCES ROUPA(ID_ROUPA),
FOREIGN KEY(ID_VENDA) REFERENCES VENDA(ID_VENDA));


CREATE table venda(
id_venda INT primary key auto_increment,
data date not null,
valor DOUBLE not null,
forma_pagamento varchar(200),
parcelas int null,
observacoes varchar(200) null,
ID_VENDEDOR int not null,
ID_CLIENTE int not null,
FOREIGN KEY(ID_VENDEDOR) REFERENCES VENDEDOR(ID_VENDEDOR),
    FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE));
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

