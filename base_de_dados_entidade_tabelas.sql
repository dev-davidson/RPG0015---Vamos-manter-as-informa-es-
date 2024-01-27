CREATE DATABASE loja;
USE loja;

CREATE TABLE usuario (
    idUsuario int identity(1,1) primary key not null,
    login varchar(40) not null unique,
    senha varchar(40) not null
);

CREATE TABLE pessoa (
    idPessoa int primary key not null default NEXT VALUE FOR idPessoa_SEQ,
    nome varchar(255) not null,
    logradouro varchar(255) not null,
    cidade varchar(255) not null,
    estado varchar(2) not null,
    telefone varchar(11) not null,
    email varchar(255) not null unique
);

CREATE TABLE pessoa_juridica (
    idPessoa int foreign key references pessoa(idPessoa) not null primary key,
    cnpj varchar(18) not null
);

CREATE TABLE pessoa_fisica (
    idPessoa int foreign key references pessoa(idPessoa) primary key,
    cpf varchar(14) not null 
);

CREATE TABLE produto (
    idProduto int identity(1,1) primary key,
    nome varchar(255) not null,
    quantidade int not null,
    preco_de_venda numeric(16,2) not null
);

CREATE TABLE movimento (
    idMovimento int identity(1,1) primary key not null,
    idUsuario int foreign key references usuario(idUsuario) not null,
    idPessoa int foreign key references pessoa(idPessoa) not null,
    idProduto int foreign key references produto(idProduto) not null,
    quantidade int not null,
    tipo char(1) not null,
    valor_unitario numeric(16,2) not null
);

CREATE SEQUENCE idPessoa_SEQ
    AS INT
    START WITH 7
    INCREMENT BY 8;
