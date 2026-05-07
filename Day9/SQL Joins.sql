create table users (emp_id INT,name VARCHAR(50), dept_id INT);

create table departments ( dept_id INT, dept_name VARCHAR(50));

insert into users(emp_id,name,dept_id) values(1,'harika',3),(2,'harini',3),(3,'amulya',4),(4,'harshitha',5);

insert into users(emp_id,name,dept_id) values(5,'chandana',6);

insert into departments(dept_id,dept_name) values(1,'HR'),(2,'Marketing'),(3,'IT'),(4,'Technology'),(5,'Technical');

select *from users;

select *from departments;

select u.emp_id, u.name, d.dept_name from users u inner join departments d on u.dept_id = d.dept_id;

select u.emp_id, u.name, d.dept_name from users u left join departments d on u.dept_id = d.dept_id;

select u.emp_id, u.name, d.dept_name from users u right join departments d on u.dept_id = d.dept_id;

select u.emp_id, u.name, d.dept_name from users u full outer join departments d on u.dept_id = d.dept_id;

select u.name, d.dept_name from users u cross join departments d;

select u1.name, u2.name from users u1 join users u2 on u1.dept_id = u2.dept_id;
