-- Opgave 1
select prodName, unitPrice
from Product
JOIN Supplier on Product.suppID = Supplier.suppID
WHERE Supplier.compName = 'FixFax'

-- Opgave 2
select orderID, SUM(quantity*unitPrice) as Pris
from OrderItem
join Product on Product.prodID = orderItem.prodID
group by orderID

-- Opgave 3
select orderID, SUM(quantity*unitPrice) as Pris
from OrderItem
join Product on Product.prodID = orderItem.prodID
group by orderID
having SUM(quantity*unitPrice) > 200

-- Opgave 4
select orderID, unitPrice, quantity, quantity*unitPrice as Pris
from OrderItem
join Product on Product.prodID = orderItem.prodID
where orderID = 1

-- Opgave 5
drop proc findOrdrerLinjer
go;
create proc findOrdrerLinjer
@Id INT
AS
select orderID, unitPrice, quantity, quantity*unitPrice as Pris
from OrderItem
join Product on Product.prodID = orderItem.prodID
where orderID = @Id

exec findOrdrerLinjer 4

-- Opgave 6
go;
create TRIGGER mereEnd5Save on OrderItem
after INSERT
AS
declare @quantity as INT
set @quantity = (select quantity 
                from Product
                join OrderItem on OrderItem.prodID = Product.prodID
                where orderItemID = (select orderItemID from inserted))
IF  (@quantity >= 5)
    IF ((select prodName
        from Product
        join OrderItem on OrderItem.prodID = Product.prodID
        where orderItemID = (select orderItemID from inserted)) = 'Sav')
        BEGIN
        print 'Der er blevet bestilt mere end 5 save'
        END

INSERT into OrderItem VALUES
(25, 6, 1, 2)

-- Opgave 7
SELECT compName, COUNT(prodID) as antal
from Supplier
join Product on Product.suppID = Supplier.suppID
GROUP by compName

-- Opgave 8
go;
CREATE view SupplierInfo
as
select compName, prodName, unitPrice
from Supplier
join Product on Product.suppID = Supplier.suppID
go;

select *
from SupplierInfo
where compName = 'Primus'

-- Opgave 9
select prodName, quantity, compName
from OrderItem
join Product on Product.prodID = OrderItem.prodID
join Supplier on Supplier.suppID = Product.suppID
where orderID = 1