
#ADT Implementation:

Creating an ADT for name
SQL> create type Type_name as object
(
fname varchar(20), ename varchar(20), lname varchar(20)
); /


Creating an ADT for address
SQL>create type Type_address as object
(
street varchar(20), city varchar(20), pincode number(10)
); /



#Create Table Customer

create table customer
(cid number(5) primary key,
cname Type_name,
c_add Type_address,
c_phno number(10)
);

#Inserting Values
insert into customer values(101,Type_name('Varsha','s','Atul'), Type_address('Sherly','Mumbai',400050),9475928394);

insert into customer values(102,Type_name('Zoya','R','Jetham'), Type_address('Carter','Mumbai',400050),9056583940);

insert into customer values(103,Type_name('Shru','S','Gaikwad'), Type_address('Pathwardan','Mumbai',400055),6783583940);

insert into customer values(104,Type_name('Joseph','R','James'), Type_address('Rajan','Mumbai',400058),7554268632);


#Select street value of customer whose cid= 101
select c.c_add.street from customer c where cid=101;


#Select First name of customer whose cid= 101
select c.cname.fname from customer c where cid=101;


#Select Last name of all customers
select cid, c.cname.lname from customer c;


#Select full name of all customers
select c.cname.fname||' '||c.cname.ename||' '||c.cname.lname from customer c;



#Reference Implementation:

Creating an Object Type
SQL>create type Type_animal as object
(
breed varchar(20), name varchar(20), BirthDate date
);
/


#Creating an Object Table
create table ANIMAL of Type_animal;

#Inserting Values
INSERT into animal values(Type_animal('Tiger','Simba','01-APR-02'));
INSERT into animal values(Type_animal('Dog','Ayaan','06-MAY-04'));
INSERT into animal values(Type_animal('Cat','Kitty','13-DEC-02'));
INSERT into animal values(Type_animal('Dog','Leo','19-JAN-02'));
INSERT into animal values(Type_animal('Cat','Kimi','03-FEB-02'));
INSERT into animal values(Type_animal('Cat','Benji','11-MAR-02'));

#The REF Function
SELECT ref(A) FROM ANIMAL A;

#The DEREF Function
Create table Keeper
CREATE TABLE KEEPER(keeperName varchar(25), AnimalKept REF Type_animal);


#Describe Table Keeper
SQL>Describe KEEPER;

#Inserting Value
insert into keeper select 'CATHRINE', REF(A) FROM ANIMAL A WHERE name='Kitty';
Select * from Keeper;


#Using DEREF Function
SELECT KEEPERNAME, DEREF(K.ANIMALKEPT) FROM KEEPER K;


