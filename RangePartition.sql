#RANGE PARTITIONING

CREATE TABLE sales_range
(salesman_id NUMBER(5),
salesman_name VARCHAR2(30),
sales_amount NUMBER(10),
sales_date DATE)
PARTITION BY RANGE(sales_date)
(
PARTITION sales_jan2024 VALUES LESS THAN(TO_DATE('01/02/2024','DD/MM/YYYY')),
PARTITION sales_feb2024 VALUES LESS THAN(TO_DATE('01/03/2024','DD/MM/YYYY')),
PARTITION sales_mar2024 VALUES LESS THAN(TO_DATE('01/04/2024','DD/MM/YYYY')),
PARTITION sales_apr2024 VALUES LESS THAN(TO_DATE('01/05/2024','DD/MM/YYYY'))
) ;

INSERT INTO sales_range values(1,'John Smith',5000,TO_DATE('23/02/2024','DD/MM/YYYY'));
INSERT INTO sales_range values(2,'JANE Eyre',8000,TO_DATE('02/01/2024','DD/MM/YYYY'));
INSERT INTO sales_range values(3,'Harry Potter',8500,TO_DATE('19/04/2024','DD/MM/YYYY'));
INSERT INTO sales_range values(4,'Taylor Styles',10000,TO_DATE('08/03/2024','DD/MM/YYYY'));
INSERT INTO sales_range values(5,'Priya Verma',9000,TO_DATE('27/02/2024','DD/MM/YYYY'));
INSERT INTO sales_range values(6,'Maddie Van',9500,TO_DATE('01/03/2024','DD/MM/YYYY'));
INSERT INTO sales_range values(7,'Iffah Sheikh',7600,TO_DATE('30/04/2024','DD/MM/YYYY'));

select * from sales_range;

SELECT * FROM sales_range PARTITION(sales_feb2024);

SELECT * FROM sales_range PARTITION(sales_jan2024);

 SELECT * FROM sales_range PARTITION(sales_apr2024);
