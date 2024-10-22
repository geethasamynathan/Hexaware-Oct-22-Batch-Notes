--synax to create stored procedure

CREATE/ALTER PrOCEDURE ProcedureName
AS
BEGIN 
Procedure Body
END 


-- Example:1

CREATE PROCEDURE uspDisplayMessage
AS
BEGIN
PRINT 'welcome to .Net React Session!..'
END

EXECUTE uspDisplayMessage 
(or)
EXEC uspDisplayMessage
(or) 
uspDisplayMessage



Select * from production.products

create proc uspProductList
AS
BEGIN
select Product_name,list_price from production.products
order by product_name
END

drop procedure uspProductList

exec uspProductList

sp_help uspProductList


USE BikeStores;
GO
EXEC sp_databases;



--Alter procedure
ALTER PROC uspProductList
AS
BEGIN
select Product_name,model_year,list_price from
production.products order by list_price desc
END

uspProductList


exec sp_rename 'uspProductList', 'uspMyProductList'

-- parameter in Stored Procedure
/*input paramater
output parameter
*/

CREATE PROC uspFindProducts(@modelyear as int)
AS
BEGIN
SELECT * from production.products where model_year=@modelyear
END

uspFindProducts 2019


-- Example 4 with multiple parameter
CREATE PROC uspFindProdcutsbyRange(@minPrice decimal,@maxPrice decimal)
AS
BEGIN
SELECT * from production.products where 
list_price>=@minPrice AND 
list_price<=@maxPrice
END;

uspFindProdcutsbyRange 100,3000

--using named Parameter

uspFindProdcutsbyRange 
@maxPrice=12000,
@minPrice=5000

--optional parameter
CREATE PROC uspFindProductsByName
(@minPrice as decimal =2000,@maxPrice decimal,@name as varchar(max))
AS
BEGIN
select * from production.products where list_price>=@minPrice and 
list_price<=@maxPrice
and 
product_name like '%'+@name+'%'
END

uspFindProductsByName 100,1000,'Sun'

uspFindProductsByName @maxPrice=3000,@name='Trek'


-- out Parameter

CREATE PROCEDURE uspFindProductCountByModelYear
(@modelyear int,
@productCount int OUTPUT
)
AS
BEGIN
select Product_name,list_Price 
from production.products 
WHERE 
model_year=@modelyear

select @productCount=@@ROWCOUNT
END


DECLARE @count int;

EXEC  uspFindProductCountByModelYear @modelyear=2016,@productCount=@count OUT;;

select @count as 'Number of Products Found';

--can one stored procedure call another stored procedure


CREATE PROC usp_GetAllCustomers
WITH ENCRYPTION
AS
BEGIN
select * from sales.customers
END

drop procedure usp_GetAllCustomers
sp_help 'usp_GetAllCustomers'

usp_GetAllCustomers


CREATE PROC	usp_GetCusotmerOrders
@customerId INT
AS
BEGIN
SELECT *  FROM sales.orders 
WHERE
customer_id=@customerId 
END


usp_GetCusotmerOrders  1



ALTER PROC usp_GetCustomerData
(@cusomterId INT)
WITH RECOMPILE
AS
BEGIN
EXEC usp_GetAllCustomers;
EXEC usp_GetCusotmerOrders @cusomterId;
END

exec usp_GetCustomerData 1

create procedure getAllCustomers
as
begin
select * from sales.customers
end
exec getAllCustomers

CREATE PROCEDURE getCustomersByProduct
    @ProductID INT
AS
BEGIN
    SELECT 
        c.customer_id, 
        c.first_Name, 
        o.order_date
    FROM 
        sales.customers c
    JOIN 
        sales.orders o ON c.customer_id = o.customer_id
    JOIN 
       sales.order_items  od ON o.order_id = od.order_id
    WHERE 
        od.product_id = @ProductID;
END


exec getCustomersByProduct 4


select * from sales.orders
select * from sales.order_items

select * from production.products


Create proc usp_GetAllProduct
WITH ENCRYPTION
AS
BEGIN
select * from production.products
END

exec usp_GetAllProduct

sp_help 'usp_GetAllProduct'
sp_help 'getCustomersByProduct'
select * from SYSCOMments where ID=OBJECT_ID('usp_GetAllProduct')

select * from SYSCOMments where ID=OBJECT_ID('getCustomersByProduct')



