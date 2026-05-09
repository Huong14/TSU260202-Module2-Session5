CREATE DATABASE employee;
 USE employee;
 CREATE TABLE employees(
      emp_id INT PRIMARY KEY,
      full_name VARCHAR(150),
      department VARCHAR(50),
      salary DECIMAL(15,2)
 );
 
 INSERT INTO employees (emp_id,full_name,department,salary) VALUES
        (1,'Tran Van A','business',13600000),
        (2,'Nguyen Thi C','maketing',12200000),
        (3,'Tran Van B','business',15900000),
        (4,'Hua Thanh Cong','business',13600000),
        (5,'Nguyen Thi Ngoc','business',13600000),
        (6,'Tran Thanh An','maketing',10700000),
        (7,'Nguyen Van D','hr',11800000);
        
SELECT department, COUNT(*) AS total_emp
FROM employees GROUP BY department;

SELECT department, AVG(salary) AS avg_salary
FROM employees GROUP BY department;
        
SELECT department, COUNT(*) AS total_emp
FROM employees GROUP BY department
HAVING COUNT(*) > 3;

SELECT department, AVG(salary) AS avg_salary
FROM employees GROUP BY department
HAVING avg_salary > 12000000;