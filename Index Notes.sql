CREATE TABLE Employee
(
Id INT,
Name VARCHAR(50),
Salary INT,
Gender VARCHAR(10),
City VARCHAR(50),
Dept VARCHAR(50)
)


INSERT INTO Employee VALUES (3,'Pranaya', 4500, 'Male', 'New York', 'IT')
INSERT INTO Employee VALUES (1,'Anurag', 2500, 'Male', 'London', 'IT')
INSERT INTO Employee VALUES (4,'Priyanka', 5500, 'Female', 'Tokiyo', 'HR')
INSERT INTO Employee VALUES (5,'Sambit', 3000, 'Male', 'Toronto', 'IT')
INSERT INTO Employee VALUES (7,'Preety', 6500, 'Female', 'Mumbai', 'HR')
INSERT INTO Employee VALUES (6,'Tarun', 4000, 'Male', 'Delhi', 'IT')
INSERT INTO Employee VALUES (2,'Hina', 500, 'Female', 'Sydney', 'HR')
INSERT INTO Employee VALUES (8,'John', 6500, 'Male', 'Mumbai', 'HR')
INSERT INTO Employee VALUES (10,'Pam', 4000, 'Female', 'Delhi', 'IT')
INSERT INTO Employee VALUES (9,'Sara', 500, 'Female', 'London', 'IT')


select * from Employee where Id=8

CREATE INDEX IX_EMPLOYEE_ID 
ON EMPLOYEE(ID ASC)

CREATE CLUSTERED INDEX IX_EMPLOYEE_ID1
ON EMPLOYEE(ID ASC)

drop table Employee1
CREATE TABLE Employee1
(
Id INT primary key ,
Name VARCHAR(50),
Salary INT,
Gender VARCHAR(10),
City VARCHAR(50),
Dept VARCHAR(50)
)

select * from Employee1 

INSERT INTO Employee1 VALUES (3,'Pranaya', 4500, 'Male', 'New York', 'IT')
INSERT INTO Employee1 VALUES (1,'Anurag', 2500, 'Male', 'London', 'IT')
INSERT INTO Employee1 VALUES (4,'Priyanka', 5500, 'Female', 'Tokiyo', 'HR')
INSERT INTO Employee1 VALUES (5,'Sambit', 3000, 'Male', 'Toronto', 'IT')
INSERT INTO Employee1 VALUES (7,'Preety', 6500, 'Female', 'Mumbai', 'HR')
INSERT INTO Employee1 VALUES (6,'Tarun', 4000, 'Male', 'Delhi', 'IT')
INSERT INTO Employee1 VALUES (2,'Hina', 500, 'Female', 'Sydney', 'HR')
INSERT INTO Employee1 VALUES (8,'John', 6500, 'Male', 'Mumbai', 'HR')
INSERT INTO Employee1 VALUES (10,'Pam', 4000, 'Female', 'Delhi', 'IT')
INSERT INTO Employee1 VALUES (9,'Sara', 500, 'Female', 'London', 'IT')


CREATE CLUSTERED INDEX idx_employee1_salary
ON Employee1(Salary)

SELECT * FROM sales.customers
--Example for Unique Index
CREATE UNIQUE INDEX idx_unique_email
ON sales.customers(email)
--Example for Clustered Index .
-- We can create only one clustered index per table
-- if we have primary key in a table automatically it will create clustered index for that table
-- suppose when table is not having primary ket then only we can create clustered index.while creating clustered index
--if we can duplicate and null values exists it will sort and store the data
CREATE CLUSTERED INDEX IX_EMPLOYEE_ID1
ON EMPLOYEE(ID ASC)

--Non-clustered index 
-- we can create upto 999 non clustered index per table
CREATE NONCLUSTERED INDEX idx_name
ON sales.customers(first_name,last_name)
(or) 
CREATE  INDEX idx_name1
ON sales.customers(first_name,last_name)



create table Department
(
Id int,
Name Varchar(100)
)

 insert into Department 
 values (1,'HR'),
 (1,'Admin')

 select * from Department


 CREATE CLUSTERED INDEX idx_dept_id
 ON Department(Id)

 insert into Department values (2,'IT'),
 (3,'Transport'),
 (2,'Information Tech')

 insert into Department (Name) values ('Insurance')