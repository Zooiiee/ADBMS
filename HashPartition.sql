CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
)
PARTITION BY HASH (employee_id)
PARTITIONS 4;


INSERT INTO employees VALUES (1, 'John Doe', 'IT', 50000);
INSERT INTO employees VALUES (2, 'Jane Smith', 'HR', 60000);
INSERT INTO employees VALUES (3, 'Alice Brown', 'Finance', 70000);
INSERT INTO employees VALUES (4, 'Bob White', 'IT', 55000);
INSERT INTO employees VALUES (5, 'Charlie Green', 'HR', 62000);
INSERT INTO employees VALUES (6, 'David Black', 'Finance', 75000);
INSERT INTO employees VALUES (7, 'Eva Adams', 'IT', 48000);
INSERT INTO employees VALUES (8, 'Frank Wilson', 'HR', 58000);

SELECT * FROM employees;


#PARTITIONING BY HASH

CREATE TABLE sales
(dept_no NUMBER(5),
part_no VARCHAR2(20),
country VARCHAR2(20),
date1 DATE,
amount NUMBER(10)
)
PARTITION BY HASH(part_no)
(
PARTITION p1,
PARTITION p2,
PARTITION p3
) ;

INSERT INTO sales values(1,'101','India',TO_DATE('06/02/2024','DD/MM/YYYY'),25000);
INSERT INTO sales values(2,'202','India',TO_DATE('21/03/2024','DD/MM/YYYY'),20000);
INSERT INTO sales values(3,'403','US',TO_DATE('08/03/2024','DD/MM/YYYY'),30000);
INSERT INTO sales values(4,'504','UK',TO_DATE('01/02/2024','DD/MM/YYYY'),40000);
INSERT INTO sales values(5,'105','India',TO_DATE('12/04/2024','DD/MM/YYYY'),35000);
INSERT INTO sales values(6,'306','Canada',TO_DATE('24/04/2024','DD/MM/YYYY'),21000);
INSERT INTO sales values(7,'207','US',TO_DATE('01/03/2024','DD/MM/YYYY'),29000);
INSERT INTO sales values(8,'318','UK',TO_DATE('23/02/2024','DD/MM/YYYY'),34000);


SELECT TABLE_NAME, PARTITION_NAME, NUM_ROWS
FROM USER_TAB_PARTITIONS
WHERE TABLE_NAME = 'EMPLOYEES';

SELECT * FROM sales PARTITION(p1);

SELECT * FROM sales PARTITION(p2);

SELECT * FROM sales PARTITION(p3);
