Understand basic OLAP operations

CREATE TABLE employee (
emp_no NUMBER(10),
dep_no NUMBER(10),
emp_name VARCHAR(25),
salary NUMBER(10),
comm NUMBER(10),
job VARCHAR(25));

INSERT INTO employee values(101,10,'Tejas',20000,1000,'CLERK');
INSERT INTO employee values(102,20,'Tanvi',35000,2000,'ASSISTANT');
INSERT INTO employee values(103,30,'Kush',22000,3000,'ADMINISTRATOR');
INSERT INTO employee values(104,10,'Khushi',26000,1000,'ADMINISTRATOR');
INSERT INTO employee values(105,30,'Mansvi',30000,1500,'MANAGER');
INSERT INTO employee values(106,20,'Shruti',18000,2100,'CLERK');
INSERT INTO employee values(107,40,'Amaan',23400,1500,'ANALYST');
INSERT INTO employee values(108,20,'Tisha',34000,1400,'MANAGER');
INSERT INTO employee values(109,40,'Ishaan',25000,2000,'ASSISTANT');
INSERT INTO employee values(110,30,'Rohan',25000,3000,'ANALYST');
INSERT INTO employee values(111,10,'Shruti',20000,2000,'ADMINISTRATOR');

1) ROLL-UP
SELECT dep_no, job, count(*), sum(salary) from employee group by rollup(dep_no,job);


2)CUBE
SELECT dep_no, job, count(*), sum(salary) from employee group by cube(dep_no,job);


3) ROW NUMBER
SELECT rownum, emp_no,emp_name, salary from employee;

SELECT rownum,emp_no,emp_name, salary from employee order by salary;

SELECT rownum,emp_no,emp_name, salary from employee order by salary desc;

SELECT row_number() over(order by salary), emp_no, emp_name, salary from employee order by salary desc;


4) RANK
SELECT emp_no, dep_no, salary, comm, rank() over(partition by dep_no order by salary) as RANK from employee;


5) DENSE RANK
SELECT emp_no, dep_no, salary, comm, dense_rank() over(partition by dep_no order by salary) as DENSE_RANK from employee;


6) LEAD
SELECT emp_no,emp_name,date,bdate, lead(bdate,1) over(order by bdate) as "Next" from employees;

SELECT emp_no,emp_name,bdate, lead(bdate,1) over(order by bdate) as "Next" from employees WHERE dep_no=20;


7) LAG
SELECT emp_no,emp_name,bdate, lag(bdate,1) over(order by bdate) as "Previous" from employees;

SELECT emp_no,emp_name,bdate, lag(bdate,1) over(order by bdate) as "Previous" from employees WHERE dep_no=30;


LEAD & LAG
SELECT emp_no,emp_name,bdate, lag(bdate,1) over(order by bdate) as "Previous Birthdate", lead(bdate,1) over(order by bdate) as "Next Birthdate" from employees;


8) FIRST
SELECT dep_no,emp_name,salary,max(salary) keep(DENSE_RANK FIRST ORDER BY salary desc) over(PARTITION BY dep_no)"MAX" FROM emp;

SELECT EMP_no,JOB,salary,max(salary) keep(DENSE_RANK FIRST ORDER BY salary desc) over(PARTITION BY JOB)"MAX" FROM emp;

9) LAST
SELECT dep_no,emp_name,salary,min(salary) keep(DENSE_RANK LAST ORDER BY salary desc) over(PARTITION BY dep_no)"MIN" FROM emp;

SELECT EMP_no,JOB,salary,max(salary) keep(DENSE_RANK LAST ORDER BY salary desc) over(PARTITION BY JOB)"MIN" FROM emp;
