create table employees2
(
   emp_id int ,
   emp_name varchar(50),
   dept_id int
);
insert into employees2 values(1, "Shravani",2);
insert into employees2 values(2, "Kunal",3);
insert into employees2 values(3, "Rutuja",2);
insert into employees2 values(4, "Devki",4);
insert into employees2 values(5, "janki",5);
create table department2
(
   dept_id int ,
   dept_name varchar(40)
);
insert into department2 values(2," Software development");
insert into department2 values(3, "Testing");
insert into department2 values(4, "Data Analytics");
insert into department2 values(10, "Management");


select * from employees2;
select * from department2;

select e.emp_id, e.emp_name, d.dept_name
from employees2 e
inner join department2 d on e.dept_id=d.dept_id;



SET SQL_SAFE_UPDATES = 0;
DELETE FROM department2 
WHERE dept_name ="Management";

SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees2 e
RIGHT JOIN department2 d 
ON e.dept_id = d.dept_id;

/* MYSQL Does not support Full outer join so use UNION
select e.emp_id, e.emp_name, d.dept_name
FROM employees2 e
full outer join department2 d 
ON e.dept_id = d.dept_id;*/

SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees2 e
LEFT JOIN department2 d 
ON e.dept_id = d.dept_id

UNION

SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees2 e
RIGHT JOIN department2 d 
ON e.dept_id = d.dept_id;