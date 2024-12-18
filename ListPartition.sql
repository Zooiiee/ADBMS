
#c) LIST PARTITIONING

CREATE TABLE sales_list
(salesman_id NUMBER(5),
salesman_name VARCHAR2(30),
sales_state VARCHAR2(30),
sales_amount NUMBER(10),
sales_date DATE)
PARTITION BY LIST(sales_state)
(
PARTITION sales_west VALUES ('California', 'Hawaii'),
PARTITION sales_east VALUES ('New York', 'Virginia','Florida'),
PARTITION sales_central VALUES ('Texas', 'Illinois'),
PARTITION sales_other VALUES (DEFAULT)
)
enable row movement ;

INSERT INTO sales_list values(1,'John Smith','New York',2300, TO_DATE('01/03/2024','DD/MM/YYYY'));
INSERT INTO sales_list values(2,'Jay Snow','Illionis',2000, TO_DATE('09/02/2024','DD/MM/YYYY'));
INSERT INTO sales_list values(3,'Jaya Park','Texas',1600, TO_DATE('21/01/2024','DD/MM/YYYY'));
INSERT INTO sales_list values(4,'John Smith','California',1800, TO_DATE('01/03/2024','DD/MM/YYYY'));
INSERT INTO sales_list values(5,'Priya Verma','Hawaii',2120, TO_DATE('01/02/2024','DD/MM/YYYY'));
INSERT INTO sales_list values(6,'Iffah Sheikh','New York',2200, TO_DATE('01/04/2024','DD/MM/YYYY'));
INSERT INTO sales_list values(7,'Zoya Jetham','Maryland',1500, TO_DATE('01/05/2024','DD/MM/YYYY'));
INSERT INTO sales_list values(8,'Anita Patel','Florida',1900, TO_DATE('01/02/2024','DD/MM/YYYY'));


SELECT * FROM sales_list;

SELECT * FROM sales_list partition(sales_west);

SELECT * FROM sales_list partition(sales_east);

SELECT * FROM sales_list partition(sales_central);

SELECT * FROM sales_list partition(sales_other);


#2
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(20),
    salary INT
)
PARTITION BY LIST (department)  -- Partition by the 'department' column
(
    PARTITION hr_dept VALUES ('HR'),        -- All HR employees go here
    PARTITION it_dept VALUES ('IT'),        -- All IT employees go here
    PARTITION finance_dept VALUES ('Finance'), -- All Finance employees go here
    PARTITION other_dept VALUES (DEFAULT)  -- Any other department goes here
);

INSERT INTO employees VALUES (1, 'John Doe', 'HR', 60000);
INSERT INTO employees VALUES (2, 'Jane Smith', 'IT', 75000);
INSERT INTO employees VALUES (3, 'Alice Brown', 'Finance', 70000);
INSERT INTO employees VALUES (4, 'Bob White', 'Marketing', 50000);  -- Goes to DEFAULT partition

SELECT * FROM employees;

SELECT * FROM employees PARTITION (hr_dept);


