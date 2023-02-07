DROP DATABASE IF EXISTS YSVERANO;

CREATE DATABASE YSVERANO CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;


CREATE TABLE CATEGORIA(
ID_CATEGORIA INT PRIMARY KEY,
DESCRICAO VARCHAR(200));

INSERT INTO categoria (id_categoria,descricao) VALUES
('1','conjuno biquini preto curtininha'),
('2', 'conjunto biquini vermelho curtininha'),
('3','conjuno biquini vermelho veludo curtininha');



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
insert into cliente(id_cliente,nome,cpf,telefone,email,cep,numerocasa,complemento,foto)VALUES
('1','Maria','123456893-10','(21)99886-1055','maria@gmail.com','12555',31,'ap 102','vazio'),
('2','Rafaela','123456894-10','(21)99886-8888','rafaela@gmail.com','12556',129,'ap 9','vazio'),
('3','Carla','123456895-10','(21)99886-9999','carla@gmail.com','12557',128,'ap 179','vazio'),
('4','Andreia','123456896-10','(21)99886-7777','andreia@gmail.com','12558',179,'ap 12','vazio'),
('5','Núvia','123456895-10','(21)99886-8887','nuvia@gmail.com','12559',126,'ap 19','vazio');

CREATE TABLE FORNECEDOR(
	ID_FORNECEDOR INT PRIMARY KEY,
	NOME VARCHAR(200),
	TELEFONE VARCHAR(15) NOT NULL,
	EMAIL VARCHAR(20) NOT NULL,
	CEP CHAR(9) NOT NULL,
    COMPLEMENTO VARCHAR(30),

	CONTA_BANCARIA INT NULL,
	AGENCIA INT NULL);

	insert into FORNECEDOR(ID_FORNECEDOR,NOME,TELEFONE,EMAIL,CEP,COMPLEMENTO,CONTA_BANCARIA,AGENCIA) VALUES
	('1','FORNECEDORum','(21)98378-4343','fornecedorum@gmail.com','23092687','amarela','4545','6565'),
	('2','FORNECEDORdois','(21)98378-4343','fornecedordois@gmail.com','23092687','amarela','4545','6565'),
	('3','FORNECEDORtres','(21)98378-4343','fornecedortres@gmail.com','23092687','amarela','4545','6565'),
   ('4','FORNECEDORquatro','(21)983784343','fornecedorquatro@gmail.com','23092687','amarela','4545','6565');



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
insert into VENDEDOR(id_vendedor,nome,pis,cpffuncionario,telefone,email,cep,numerocasa,complemento,agencia,conta_bancaria,foto)VALUES
('1','Mário Silva','3232','119554687-45','(21)9999-8787','mario@gmail.com','23092631','20','ap 202','8484','5252','vazio'),
('2','Denize Rafaela','3332','119554687-45','(21)9999-8787','denize@gmail.com','23092631','20','ap 202','8484','5252','vazio'),
('3','Pricilaalcantara','3432','119554687-45','(21)9999-8787','pricila@gmail.com','23092631','20','ap 202','8484','5252','vazio'),
('4','Carlos Algusto','3532','119554687-45','(21)9999-8787','Carlos@gmail.com','23092631','20','ap 202','8484','5252','vazio');





CREATE table roupa(
id_roupa INT PRIMARY KEY,
produto_nome VARCHAR(200),
quantidade int not null,
tamanho char(2)not null,
cor varchar(30)not null,
custo double,
valor double not null,
Fornecedor_id_Fornecedor int null);

insert into roupa(id_roupa,produto_nome,quantidade,tamanho,cor,custo,valor,Fornecedor_id_Fornecedor)VALUES
('1','conjunto Peace Love biquini preto curtininha','10','P','preto','100','200','1'),
('2','conjunto biquini Peace Love vermelho curtininha','15','P','vermelho','150','200','1'),
('3','maiô foi dental fire','10','M','preto','100','200','2');


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
/**continuar daqui**/
insert into venda(data,valor,FORMA_PAGAMENTO,PARCELAS,OBSERVACOES,ID_VENDEDOR,ID_CLIENTE)VALUES
('2022-12-05','300','crédito','1','obcervações aqui','1','1'),
('2022-12-04','300','débito','1','obcervações aqui','2','2'),
('2022-12-03','300','débito','1','obcervações aqui','3','3'),
('2022-12-02','120','crédito','1','obcervações aqui','4','4');




CREATE TABLE VENDA_ROUPA(
	ID_VENDA_ROUPA INT PRIMARY KEY AUTO_INCREMENT,
    ID_ROUPA INT NOT NULL,
    ID_VENDA INT NOT NULL,
	quantidade INT null,
	VALOR DOUBLE NOT NULL, 
FOREIGN KEY(ID_ROUPA) REFERENCES ROUPA(ID_ROUPA),
FOREIGN KEY(ID_VENDA) REFERENCES VENDA(ID_VENDA));

insert into VENDA_ROUPA(ID_VENDA_ROUPA,id_roupa,id_venda,quantidade,valor)VALUES
('1','2','3','3','200'),
('2','2','3','3','200'),
('1','2','3','3','200');





