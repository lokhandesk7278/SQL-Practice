/*
You are given an employee table where:

Each employee has a manager_id

manager_id refers to emp_id of the same table

👉 Write a SQL query to find employees whose salary is greater than their manager’s salary.

This is a self join scenario because:

One column (manager_id) references another column (emp_id) of the same table

🧱 Table Structure

CREATE TABLE emp
(
   emp_id INT,
   emp_name VARCHAR(10),
   salary INT,
   manager_id INT
);
*/

create table emp(emp_id int,emp_name varchar(10),salary int ,manager_id int);

insert into emp values(1,'Ankit',10000,4);
insert into emp values(2,'Mohit',15000,5);
insert into emp values(3,'Vikas',10000,4);
insert into emp values(4,'Rohit',5000,2);
insert into emp values(5,'Mudit',12000,6);
insert into emp values(6,'Agam',12000,2);
insert into emp values(7,'Sanjay',9000,2);
insert into emp values(8,'Ashish',5000,2);

select * from emp;

select e.emp_id, e.emp_name, m.emp_name as manager_name, e.salary, m.salary as manager_salary
from emp e
inner join emp m on e.manager_id = m.emp_id
where e.salary > m.salary;


/* Explanation :
Self Join Used → The table emp is joined with itself to compare employees with their managers.
Aliases (e and m) →
e represents the employee
m represents the manager

Join Condition →

e.manager_id = m.emp_id

This links each employee to their manager.

Filter Condition (WHERE clause) →

e.salary > m.salary

Selects only those employees who earn more than their managers.

Selected Columns →
e.emp_id → Employee ID
e.emp_name → Employee Name
m.emp_name → Manager Name
e.salary → Employee Salary
m.salary → Manager Salary
Purpose of Query →
To find employees who are earning more than their managers.*/
