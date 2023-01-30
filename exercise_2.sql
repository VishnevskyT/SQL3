CREATE DATABASE normalized_DB; 			-- Задание 2 Нормализируйте данную таблицу: таблица в материалах к уроку.

USE normalized_DB;

DROP TABLE initial_table;

CREATE TABLE initial_table
(
name VARCHAR(50) NOT NULL,
platoon SMALLINT NOT NULL,
weapon VARCHAR(10) NOT NULL,
provided_by VARCHAR(50) NOT NULL
);


INSERT INTO initial_table
(name, platoon, weapon, provided_by)
VALUES
('Петро В.А.,оф.205', 222, 'AK-47', 'Буровко О.С., майор'),
('Петро В.А.,оф.205', 222, 'Глок20', 'Рибаченко Н.Г., майор'),
('Лодаренко П.С.,оф.221', 232, 'АК-47', 'Деребанченко В.Я., підполковник'),
('Лодаренко П.С.,оф.221', 232, 'Глок20', 'Рибаченко Н.Г., майор'),
('Леоненко К.В.,оф.201', 212, 'AK-47', 'Буровко О.С., майор'),
('Леоненко К.В.,оф.201', 212, 'Глок20', 'Рибаченко Н.Г., майор'),
('Дух Р.М.', 200, 'AK-47', 'Буровко О.С., майор');


SELECT * FROM initial_table;

DROP TABLE weapons;

CREATE TABLE weapons
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
caliber DOUBLE DEFAULT NULL,
available_QTY INT
);

INSERT INTO weapons
(name, caliber, available_QTY)
VALUES
('AK-47', 7.62, NULL),
('Глок20', 10.00, NULL);

SELECT * FROM weapons;

DROP TABLE officers;

CREATE TABLE officers
(
id INT AUTO_INCREMENT PRIMARY KEY,
l_name VARCHAR(40) NOT NULL,
f_name VARCHAR(30) NOT NULL,
m_name VARCHAR(40) NOT NULL,
officer_number INT DEFAULT NULL,
platoon SMALLINT NOT NULL
);

INSERT INTO officers
(l_name, f_name, m_name, officer_number, platoon)
VALUES
('Петро', 'В.', 'А.', 205, 222),
('Лодаренко', 'П.', 'С.', 221, 232),
('Леоненко', 'К.', 'В.', 201, 212),
('Дух', 'Р.', 'М.', NULL, 200);

SELECT * FROM officers;

DROP TABLE warehouse_members;

CREATE TABLE warehouse_members
(
id INT AUTO_INCREMENT PRIMARY KEY,
l_name VARCHAR(40) NOT NULL,
f_name VARCHAR(30) NOT NULL,
m_name VARCHAR(40) NOT NULL,
m_rank VARCHAR(20) NOT NULL
);

INSERT INTO warehouse_members
(l_name, f_name, m_name, m_rank)
VALUES
('Буровко', 'О.','С.', 'майор'),
('Рибаченко', 'H.','Г.', 'майор'),
('Деребанченко', 'В.','Я.', 'підполковник');

SELECT * FROM warehouse_members;

DROP TABLE normalized_table;

CREATE TABLE normalized_table(
id INT AUTO_INCREMENT PRIMARY KEY,
officer_id INT NOT NULL,
weapon_id INT NOT NULL,
warehouse_id INT NOT NULL,
FOREIGN KEY(officer_id) REFERENCES officers(id),
FOREIGN KEY(weapon_id) REFERENCES weapons(id),
FOREIGN KEY(warehouse_id) REFERENCES warehouse_members(id)

);

INSERT INTO normalized_table
(officer_id, weapon_id, warehouse_id)
VALUES
(1,1,1),
(1,2,2),
(2,1,3),
(2,2,2),
(3,1,1),
(3,2,2),
(4,1,1);

SELECT * FROM normalized_table;


