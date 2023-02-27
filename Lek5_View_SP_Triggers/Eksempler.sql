select m.navn
from HoldMedlem hm
inner join Medlem m
on hm.medlemsId = m.medlemsId
where hm.holdId = 1
go;

create proc MedlemmerPaaHold
@id INT
AS
select m.navn
from HoldMedlem hm
inner join Medlem m
on hm.medlemsId = m.medlemsId
where hm.holdId = @id

exec MedlemmerPaaHold 2
go;

create view alleMedlemmer
as
select m.medlemsId, m.navn, k.navn klubnavn, h.holdNavn
from Medlem m
inner join HoldMedlem hm
on m.medlemsId = hm.medlemsId
inner join Hold h
on h.holdId = hm.holdId
inner join Klub k
on k.klubId = h.klubId
go;

select *
from alleMedlemmer
where klubnavn = 'Kirkeby IF'
go;

create proc MedlemsInfo
@medlemsid INT
AS
select navn, klubnavn, holdNavn
from alleMedlemmer
where medlemsid = @medlemsid
go;

exec MedlemsInfo 3

-- Eksempler for trigger nedenunder

insert into Medlem VALUES
(50,'Karl',56)

insert into HoldMedlem VALUES
(1,50),
(2,50)

delete from Medlem
where medlemsId = 50
go;

select *
from Medlem
where medlemsId = 50
go;

create trigger sletMedlem on medlem
instead of DELETE
AS
delete from HoldMedlem
where medlemsId = (select medlemsId from deleted)
delete from Medlem
where medlemsId = (select medlemsId from deleted)
go;

create trigger OpretMedlem on medlem
after INSERT
AS
Declare @Medlemsnavn as VARCHAR(30)
set @Medlemsnavn = (select navn from inserted)
DECLARE @medlemsid as char(3)
set @medlemsid = (select medlemsid from inserted)
print 'Medlem er oprettet'
PRINT 'Navn: ' + @Medlemsnavn
PRINT 'Medlemsid: ' + @medlemsid




