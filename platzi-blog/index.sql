CREATE SCHEMA `platziblog`;

CREATE TABLE `platziblog`.`categorias` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`nomber_categoria` VARCHAR(30) NOT NULL,
	PRIMARY KEY(id));

CREATE TABLE `platziblog`.`etiquetas` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`nombre_etiqueta` VARCHAR(30) NOT NULL,
	PRIMARY KEY(`id`));

CREATE TABLE `platziblog`.`usuario` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`login` VARCHAR(30) NOT NULL,
	`password` VARCHAR(32) NOT NULL,
	`nickname` VARCHAR(40) NOT NULL,
	`email` VARCHAR(40) NOT NULL,
	PRIMARY KEY(`id`) --Sección de constraints
	UNIQUE INDEX `email_UNIQUE` (`email` ASC));

-- Tienes que crear las tablas solo si sus dependencias ya fueron declaradas

CREATE TABLE `platziblog`.`posts` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`titulo` VARCHAR(30) NOT NULL,
	`fecha_publicacion` TIMESTAMP,
	`contenido` TEXT NOT NULL,
	`estatus` CHAR(8) DEFAULT 'activo',
	`usuario_id` INT NOT NULL,
	`categoria_id` INT NOT NULL,
	PRIMARY KEY (`id`));

-- El update hace que cuando el usuario cambie afecte a nuestra tabla <cascade>
-- On Delete hace que cuando un usuario sea eliminado sus post se queden sin usuario o sean eliminados <cascade | no action | not null | set null>
-- Restrict hace que no puedas eliminar usuario hasta que esten eliminados todos sus posts

-- Ejemplo bien hecho
ALTER TABLE `platziblog`.`posts`
ADD INDEX `posts_usuarios_idx` (`usuario_id` ASC);
;
ALTER TABLE `platziblog`.`posts`
ADD CONSTRAINT `posts_usuarios`
	FOREIGN KEY (`usuario_id`)
	REFERENCES `platziblog`.`usuarios` (`id`)
	ON DELETE NO ACTION
	ON UPDATE CASCADE;

ALTER TABLE `platziblog`.`posts`
ADD INDEX `posts_categorias_idx` (`categorias_id` ASC);
;
ALTER TABLE `platziblog`.`posts`
ADD CONSTRAINT `posts_categorias`
	FOREIGN KEY (`categoria_id`)
	REFERENCES `platziblog`.`categorias` (`id`)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;

-- Agrega llaves externas

CREATE TABLE `platziblog`.`comentarios` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`cuerpo_comentario` TEXT NOT NULL
	`usuario_id` INT NOT NULL
	`post_id` INT NOT NULL
	PRIMARY KEY (`id`));

ALTER TABLE `platziblog`.`comentarios`

ADD INDEX `comentarios_usuarios_idx` (`usuario_id` ASC);
;
ALTER TABLE `platziblog`.`comentarios`
ADD CONSTRAINT `comentarios_usuario`
	FOREIGN KEY (`usuario_id`),
	REFERENCES `platziblog`.`usuarios` (`id`),
	ON DELETE NO ACTION,
	ON UPDATE NO ACTION;

ALTER TABLE `platziblog`.`comentarios`
ADD CONSTRAINT `comentarios_post_idx` (`post_id` ASC);

CREATE TABLE `platziblog`.`posts_etiquetas` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`post_id` INT NOT NULL,
	`etiqueta_id` INT NOT NULL,
	PRIMARY_KEY (`ID`));

ALTER TABLE `platziblog`.`posts_etiquetas`
ADD INDEX `postsetiquetas_post_idx` (`post_id` ASC);
;
ALTER TABLE `platziblog`.`posts_etiquetas`
ADD CONSTRAINT `postsetiquetas_post`
	FOREIGN KEY (`post_id`)
	REFERENCES `platziblog`.`posts` (`id`)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;

ALTER TABLE `platziblog`.`posts_etiquetas`
ADD INDEX `postsetiquetas_etiquetas_idx` (`post_id` ASC);
;
ALTER TABLE `platziblog`.`posts_etiquetas`
ADD CONSTRAINT `postsetiquetas_post`
	FOREIGN KEY (`post_id`)
	REFERENCES `platziblog`.`posts` (`id`)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;