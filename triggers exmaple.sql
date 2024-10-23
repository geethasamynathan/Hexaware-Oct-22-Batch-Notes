CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE
);

CREATE TABLE order_audit (
    audit_id INT IDENTITY PRIMARY KEY,
    order_id INT,
    customer_id INT,
    order_date DATE,
    audit_date DATETIME DEFAULT GETDATE()
);

ALTER TABLE Order_Audit ADD audit_informatio varchar(max)

--Example for After or For Trigger with insert
select * from Orders

Select * from order_audit

ALTER TRIGGER trgAfterInsertOrder
ON Orders
AFTER INSERT
AS
BEGIN
DECLARE @auditInfo nvarchar(1000)
SET @auditInfo='Data Inserted'
INSERT INTO order_audit (order_id,customer_id,order_date,audit_informatio)
SELECT order_id,customer_id,order_date,@auditInfo
FROM inserted
END

 insert into orders values (1001,31,'8-10-2024')
  insert into orders values (1002,41,'8-8-2024')
 update orders set customer_id=32 where order_id=1
  update orders set customer_id=31 where order_id=1001
 --Example for After or For Trigger with update

ALTER TRIGGER trgAfterUpdateOrder
ON Orders
FOR UPDATE
AS
BEGIN
DECLARE @auditInfo nvarchar(1000)
SET @auditInfo='Data changed'
 INSERT INTO order_audit (order_id,customer_id,order_date,audit_informatio)
SELECT order_id,customer_id,order_date,@auditInfo
FROM inserted
 
END



UPDATE orders SET customer_id=33, order_date='10-10-2020'
WHERE order_id=1001

UPDATE Orders SET customer_id=32,order_date='10-10-2024' 
WHERE ORDER_ID=1001

select  *  from tblEmployee
SELECT * FROM tblDepartment

-- Example for Instead of Trigger
CREATE VIEW vwEmployeeDetails
AS

SELECT Id,Name ,Gender,DeptName from tblEmployee e
join tblDepartment d
on e.DepartmentId=d.DeptId


select * from vwEmployeeDetails

INSERT vwEmployeeDetails values (7,'Tina','Female','HR')


CREATE TRIGGER tr_vwEmployeeDetails_InsteadOfInsert
ON vwEmployeeDetails
INSTEAD OF INSERT
AS
BEGIN
DECLARE @deptId int
SELECT @deptId=DeptId from tblDepartment
Join inserted
ON inserted.DeptName=tblDepartment.DeptName

if(@deptId is null)
BEGIN
Raiserror('InValid Department Name .Statement Terminated',16,1)
return
END
Insert into tblEmployee(Id,Name,Gender,DepartmentId) 
select Id,Name,Gender,@deptId
FROM inserted
END

INSERT vwEmployeeDetails values (7,'Tina','Female','HR')

INSERT vwEmployeeDetails values (8,'Yash','Male','Banking')