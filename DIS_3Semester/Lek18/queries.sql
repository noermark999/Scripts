drop view kunderGlobal
go;

create view kunderGlobal
AS
select *
from Lek18A.dbo.Kunde as KundeA
union
select *
from lek18B.dbo.Kunde as KundeB

go;

create trigger insertGlobal on kunderGlobal
instead of INSERT
AS
declare @id as INT
set @id = (select kundeid from inserted)
IF (@id % 2 = 0)
    insert into lek18B.dbo.Kunde (navn, postnr)
    select navn, postnr
    from inserted
ELSE
    insert into lek18A.dbo.Kunde (navn, postnr)
    select navn, postnr
    from inserted
go;

insert into kunderGlobal values 
    (331, 'Torben', '4532')

select *
from kunderGlobal

select kunderGlobal.kundeid, navn, postnr, sum(beloeb) as samlet
from kunderGlobal
join lek18B.dbo.Postering as p on p.kundeid = kunderGlobal.kundeid
GROUP by kunderGlobal.kundeid, navn, postnr

select kunderGlobal.kundeid, navn, postnr, count(b.varenavn) as antal
from kunderGlobal
join lek18A.dbo.Bestilling as b on b.kundeid = kunderGlobal.kundeid
GROUP by kunderGlobal.kundeid, navn, postnr