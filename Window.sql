#Window Functions -
Nvl, sum, dense_rank, rank, over ,orderby, min, preceding, following


CREATE TABLE emp (
    emp_no INT PRIMARY KEY,
    emp_name VARCHAR(50),
    job VARCHAR(50),
    salary INT,
    comm INT,
    dep_no INT,
    hiredate DATE
);

-- Insert sample data
INSERT INTO emp VALUES (1, 'John', 'Manager', 80000, NULL, 10, TO_DATE('2020-01-01', 'YYYY-MM-DD'));
INSERT INTO emp VALUES (2, 'Jane', 'Analyst', 60000, 2000, 10, TO_DATE('2021-02-15', 'YYYY-MM-DD'));
INSERT INTO emp VALUES (3, 'Mark', 'Clerk', 30000, NULL, 20, TO_DATE('2019-03-10', 'YYYY-MM-DD'));
INSERT INTO emp VALUES (4, 'Lucy', 'Manager', 90000, 5000, 20, TO_DATE('2021-05-05', 'YYYY-MM-DD'));
INSERT INTO emp VALUES (5, 'Alice', 'Clerk', 25000, NULL, 30, TO_DATE('2022-07-19', 'YYYY-MM-DD'));
INSERT INTO emp VALUES (6, 'Bob', 'Analyst', 50000, 1000, 30, TO_DATE('2020-11-12', 'YYYY-MM-DD'));


1) NVL, ORDER BY
Q1. Display emp_no, emp_name , salary, comm and replace all null values in commission by 1000.

select emp_no, ename, salary, nvl(comm,1000) new_comm from emp1 order by comm desc;


2) RANK, ORDER BY
Q2. Display emp info who is having lowest salary in every dept

select emp_no, emp_name, job,salary from(select mp_no, emp_name, job,salary, rank() over(partition by dep_no order by salary) lower from emp) where lower =1;

select emp_no, emp_name, dep_no,salary from(select emp_no, emp_name,dep_no,salary, rank() over(partition by dep_no order by salary) lower from emp) where lower =1;

select emp_no, emp_name, dep_no,salary from(select emp_no, emp_name,dep_no,salary, rank() over(partition by dep_no order by salary) lower from emp) where lower =2;



3) SUM, ORDER BY, PRECEDING
Q3. Display emp_no, name, salary , sum of salary dept wise and display the salary of current and previous 2 records

select emp_no, emp_name, salary, dep_no, sum(salary) over(partition by dep_no order by dep_no rows 2 preceding) total from emp1 order by dep_no; 



4) ORDER BY, PRECEDING, FOLLOWING
Q4. Display emp_no, name, salary, sum of 3 earlier rows and 1 next row dept wise.

select emp_no, emp_name, salary, dep_no, sum(salary) over(partition by dep_no order by dep_no rows between 3 preceding and 1 following) total from emp order by dep_no; 


5) UNBOUNDED & CURRENT
Q5. Display emp_no, name, salary, sum of salary for all preceding and current row dept wise.

select emp_no, emp_name, salary, dep_no, sum(salary) over(partition by dep_no order by dep_no rows between UNBOUNDED preceding and CURRENT row) total from emp order by dep_no;


6) MIN, DENSE_RANK

Q6.Write a query to find out information of employee hired first in every department

select dep_no, emp_name, salary, min(hiredate)keep(dense_rank FIRST order by hiredate) over (partition by dep_no) from emp2;


