CREATE DATABASE HR_DB;				-- Задание 3: Спроектировать базу данных для вымышленной системы отдела кадров, провести нормализацию всех таблиц.

USE HR_DB;

DROP TABLE employees;

CREATE TABLE employees
(
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
middle_name VARCHAR(50) DEFAULT NULL,
birthday DATE DEFAULT(CURRENT_DATE),
passport_data TEXT(200) NOT NULL,
inn_code VARCHAR(20) NOT NULL,
degree VARCHAR(100) DEFAULT NULL,
s_status VARCHAR(50) DEFAULT NULL
);

INSERT INTO employees
(first_name, last_name, middle_name, birthday, passport_data, inn_code, degree, s_status)
VALUES
('Джин', 'Грін', 'П.', '1989-02-13', 'АЕ 434123, виданий МВС України у 2002 році', '43948230432049', 'вища', NULL),
('Ром', 'Єллоу', 'С.', '1999-02-13', 'МВ 234324, виданий МВС України у 2012 році', '45534543535543', 'вища', NULL),
('Виска', 'Пінк', 'А.', '1995-07-08', 'YВ 132132, виданий МВС України у 2008 році', '34432132343423', 'вища', NULL);

SELECT * FROM employees;

DROP TABLE payments;

CREATE TABLE payments
(
id INT AUTO_INCREMENT PRIMARY KEY,
employee_id INT,
salary DOUBLE NOT NULL,
payment_date DATE DEFAULT(CURRENT_DATE) NOT NULL,
payment_for_month VARCHAR(30) NOT NULL,
vacation_payment DOUBLE DEFAULT 0,
extra_payment DOUBLE DEFAULT 0,
tax_payment TINYINT DEFAULT 0, 						-- 0 - податки не сплачені, 1 - податки сплачені.
FOREIGN KEY(employee_id) REFERENCES employees(id)
ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO payments
(employee_id, salary, payment_date, payment_for_month, vacation_payment, extra_payment, tax_payment)
VALUES
(1, 6000, CURRENT_DATE(), 'June', 0, 0, 1),
(2, 7000, CURRENT_DATE(), 'June', 0, 0, 1),
(3, 8000, CURRENT_DATE(), 'June', 0, 0, 1);

SELECT * FROM payments;

DROP TABLE departments;

CREATE TABLE departments
(
id INT AUTO_INCREMENT PRIMARY KEY,
dept_name VARCHAR(20),
head_dept INT NOT NULL,
dept_contact VARCHAR(50) NOT NULL,
employee_id INT,
position VARCHAR(30) NOT NULL,
hireDate DATE NOT NULL DEFAULT(CURRENT_DATE),
teminationDate DATE DEFAULT NULL,
FOREIGN KEY(employee_id) REFERENCES employees(id)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY(head_dept) REFERENCES employees(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);

INSERT INTO departments
(dept_name, head_dept, dept_contact, employee_id, position, hireDate, teminationDate)
VALUES
('financial_dept', 3, '+(380)44-202-02-20', 1, 'accountant', '2019-01-01', NULL),
('financial_dept', 3, '+(380)44-202-02-20', 2, 'accountant', '2019-01-01', NULL),
('financial_dept', 3, '+(380)44-202-02-20', 3, 'accountant', '2018-01-01', NULL);

SELECT * FROM departments;

SELECT first_name, last_name departmentsdept_name, departments.position, departments.hireDate, payments.salary FROM employees		-- , dept_name, position, hireDate, salary
	     INNER JOIN payments
			ON employees.id = payments.employee_id
	     INNER JOIN departments
			ON employees.id = departments.employee_id
GROUP BY  employees.first_name,
		  employees.last_name,
          departments.dept_name,
          departments.position,
          departments.hireDate,
          payments.salary;





