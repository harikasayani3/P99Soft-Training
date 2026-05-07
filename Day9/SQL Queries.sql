create table employees ( name VARCHAR(50), dept VARCHAR(50), salary INT );

insert into employees (name, dept, salary) values ('Alice', 'HR', 50000),('Bob', 'IT', 70000),
('Charlie', 'Marketing', 80000),('Harika','IT',50000),('Harini','IT',50000)

select * from employees;

select * from  employees where salary > 60000;

select * from employees where name like 'Hari%';

delete from employees where name = 'Alice';

select count(*) from employees;

select sum(salary) from employees;

select avg(salary) from employees;

select max(salary) from employees;

select min(salary) from employees;

SELECT dept, AVG(salary) FROM employees GROUP BY dept;

SELECT dept, AVG(salary) FROM employees GROUP BY dept HAVING AVG(salary) > 60000;

SELECT name, dept, salary,
ROW_NUMBER() OVER (PARTITION BY dept ORDER BY salary DESC) AS row_num
FROM employees;

SELECT name, salary,
RANK() OVER (ORDER BY salary DESC) AS rank
FROM employees;

SELECT name, salary,
DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank
FROM employees;
