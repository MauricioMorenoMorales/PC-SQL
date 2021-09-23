-- create view

-- Crea una vista de la base de datos y toma los usuarios que tienen el country "brasil"
CREATE VIEW v_brasil_customers AS
  SELECT customer_name,
contact_name
  FROM customers
  WHERE country = "Brasil";

-- Otro ejemplo

USE `platziblog`;
CREATE OR REPLACE VIEW `platzi_people` AS
SELECT * FROM platziblog.people;
-- Esto genera una nueva zona <views> en la que se mostrara la informacion platzi_people

-- ! Alter Table

ALTER TABLE people
ADD date_of_birth date;

ALTER TABLE people
ALTER COLUMN date_of_birth year;

ALTER TABLE people
DROP COLUMN date_of_birth;

-- Llena la tabla para trabajar con ella

INSERT INTO `platziblog`.`people` (`person_id`, `last_name`, `first_name`, `address`, `city`) 
VALUES 	('1', 'Vásquez', 'Israel', 'Calle Famosa Num 1', 'México'),
				('2', 'Hernández', 'Mónica', 'Reforma 222', 'México'),
				('3', 'Alanis', 'Edgar', 'Central 1', 'Monterrey');

ALTER TABLE `platziblog`.`people`
ADD COLUMN `date_of_birth` DATETIME NULL AFTER `city`;

ALTER TABLE `platziblog`.`people`
CHANGE COLUMN `date_of_birth` `date_of_birth` VARCHAR(30) NULL DEFAULT NULL;

ALTER TABLE `platziblog`.`people`
DROP COLUMN `date_of_birth`

-- ! DLL drop

DROP TABLE people;

DROP DATABASE test_db;

DROP TABLE `Platziblog`.`people`;

DROP DATABASE `Platziblog`;
