CREATE DATABASE supera_estudos;

USE supera_estudos;

CREATE TABLE `supera_estudos`.`usuario` ( 
	`id` BIGINT NOT NULL AUTO_INCREMENT , 
	`nome` VARCHAR(55) NOT NULL , 
	`email` VARCHAR(55) NOT NULL , 
	`senha` VARCHAR(55) NOT NULL , 
	`telefone` VARCHAR(15) NOT NULL , 
	`rua` VARCHAR(55) NOT NULL , 
	`numero` INT NOT NULL , 
	`complemento` VARCHAR(55) NOT NULL , 
	`bairro` VARCHAR(25) NOT NULL , 
	`cidade` VARCHAR(25) NOT NULL , 
	`estado` VARCHAR(25) NOT NULL , 
	`cep` VARCHAR(9) NOT NULL , 
	`cpf` VARCHAR(14) NOT NULL , 
	PRIMARY KEY (`id`)) ENGINE = MyISAM;

CREATE TABLE `supera_estudos`.`pedido` ( 
	`id` BIGINT NOT NULL AUTO_INCREMENT , 
	`data` DATE NOT NULL , 
	`forma_de_pagamento` VARCHAR(25) NOT NULL,  #conferir com caio
	`status` VARCHAR (25) NOT NULL , 
	`subtotal` VARCHAR (6) NOT NULL , 
	`desconto` VARCHAR(6) NOT NULL , 
	`total` VARCHAR (6) NOT NULL , 
	`complemento` VARCHAR(55) NOT NULL , 
	`id_usuario` BIGINT NOT NULL , 
	CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id),
	PRIMARY KEY (`id`)) ENGINE = MyISAM;

CREATE TABLE `supera_estudos`.`plano` ( 
	`id` BIGINT NOT NULL AUTO_INCREMENT , 
	`nome` VARCHAR (25) NOT NULL , 
	`prazo` INT NOT NULL , 
	`valor` VARCHAR (6) NOT NULL , 
	PRIMARY KEY (`id`)) ENGINE = MyISAM;

CREATE TABLE `supera_estudos`.`materia` ( 
	`id` BIGINT NOT NULL AUTO_INCREMENT , 
	`status` VARCHAR (20) NOT NULL , 
	`nome` VARCHAR(55) NOT NULL , 
	`id_usuario` BIGINT NOT NULL , 
	CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id),
	PRIMARY KEY (`id`)) ENGINE = MyISAM;

CREATE TABLE `supera_estudos`.`conteudo` ( 
	`id` BIGINT NOT NULL AUTO_INCREMENT , 
	`nome` VARCHAR (55) NOT NULL , 
	`id_materia` BIGINT NOT NULL , 
	`id_usuario` BIGINT NOT NULL , 
	CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id),
	CONSTRAINT fk_materia FOREIGN KEY (id_materia) REFERENCES materia(id),
	PRIMARY KEY (`id`)) ENGINE = MyISAM;

CREATE TABLE `supera_estudos`.`metodo` ( 
	`id` BIGINT NOT NULL AUTO_INCREMENT , 
	`nome` VARCHAR (55) NOT NULL , 
	PRIMARY KEY (`id`)) ENGINE = MyISAM;

CREATE TABLE `supera_estudos`.`revisao` ( 
	`id` BIGINT NOT NULL AUTO_INCREMENT , 
	`nome` VARCHAR (55) NOT NULL , 
	PRIMARY KEY (`id`)) ENGINE = MyISAM;

CREATE TABLE `supera_estudos`.`atividade` ( 
	`id` BIGINT NOT NULL AUTO_INCREMENT , 
	`nome` VARCHAR (55) NOT NULL , 
	`id_materia` BIGINT NOT NULL , 
	`id_usuario` BIGINT NOT NULL , 
	`id_metodo` BIGINT NOT NULL,
	`data_inicio` DATE NOT NULL,
	`data_fim` DATE NOT NULL,
	`status` VARCHAR(20) NOT NULL,
	`cronometro` VARCHAR(8) NOT NULL, #tempo, como 1m, 2h, 3h30m
	CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id),
	CONSTRAINT fk_materia FOREIGN KEY (id_materia) REFERENCES materia(id),
	PRIMARY KEY (`id`)) ENGINE = MyISAM;

CREATE TABLE `supera_estudos`.`revisao_array` ( 
	`id` BIGINT NOT NULL AUTO_INCREMENT , 
	`quantidade` INT NOT NULL , 
	`id_atividade` BIGINT NOT NULL , 
	CONSTRAINT fk_atividade FOREIGN KEY (id_atividade) REFERENCES atividade(id),
	PRIMARY KEY (`id`)) ENGINE = MyISAM;

