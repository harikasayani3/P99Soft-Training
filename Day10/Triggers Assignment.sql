create table employee_log ( name varchar, dept varchar, salary int, created_at timestamp );

select *from employee_log;
--- Q1.
create or replace function log_employee_insert()
returns trigger
language plpgsql
as $$
BEGIN
    insert into employee_log(name, dept, salary, created_at)
    values (new.name, new.dept, new.salary, NOW());
    return new;
END;
$$;

create or replace trigger trg_emp_insert
after insert on employees
for each row
execute function log_employee_insert();

insert into employees values ('Harika', 'IT', 50000);

select *from employee_log;


--- Q2.
create or replace function log_salary_insert() returns trigger
language plpgsql
as $$
BEGIN
	if new.salary<=0 then
		raise exception 'Salary must be greater than 0';
	end if;
	return new;
END;
$$;

create trigger trg_sal_insert 
after insert on employees
for each row
execute function log_salary_insert();

insert into employees values('A','Hr',0);

select *from employees;

--- Q3.
create or replace function log_restrict_delete() returns trigger
language plpgsql
as $$
BEGIN
	raise notice 'Deletion restricted';
	return old;
END;
$$;

create trigger trg_restrict_del before delete on employees for each row execute function log_restrict_delete();

drop trigger trg_restrict_del on employees;

delete from employees where name='Charlie';

select *from employees;

--- Q4. 

create or replace function audit_employee_update()
returns trigger language plpgsql as $$
BEGIN
    insert into employee_log(name, dept, salary, created_at)
    values (OLD.name,OLD.dept, NEW.salary,NOW());
    return new;
END;
$$;

create trigger trg_audit_update
after update on employees
for each row
when (OLD.salary is distinct from NEW.salary)
execute function audit_employee_update();

update employees set salary=30000 where name='Bob';

select * from employee_log;