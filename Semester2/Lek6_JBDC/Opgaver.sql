-- Opgave 4
create proc allemedarbejdere
as
select m.navn, m.mobil
from Medarbejder m

-- Opgave 8
create database lek6

create table TESTTYPE(
    testChar char(1),
    testVarChar VARCHAR(30),
    testInt INT,
    testDecimal DECIMAL(7,2),
    testDate DATE,
    testBit BIT
)

select *
from TESTTYPE
