select *from employees;

--- Q1.
create or replace procedure InsertEmployee(IN name varchar(100),IN dept varchar(100), IN salary int)
language plpgsql as $$
begin
	insert into employees(name,dept,salary) values(name,dept,salary);
	raise notice 'data inserted';
end;
$$;
call InsertEmployee('Alice','IT',60000);

drop procedure GetData;

--- Q2.
create or replace procedure GetEmployeeByName(in emp_name varchar)
language plpgsql
as $$
BEGIN
     raise notice 'Employee details: %',
     (SELECT row_to_json(e)
     FROM employees e
     WHERE e.name = emp_name);
END;
$$;
call GetEmployeeByName('Harini')

--- Q3. 
create or replace procedure DeleteEmployee(in emp_name varchar)
language plpgsql
as $$
DECLARE
	cnt int;
BEGIN
	select count(*) into cnt from employees where name=emp_name;
	if cnt>0 then
		delete from employees where name=emp_name;
		raise notice 'Employee Details Deleted';
	else
		raise notice 'Employee Data Not Found';
	end if;
END;
$$;
call DeleteEmployee('chandana')

select *from employees;