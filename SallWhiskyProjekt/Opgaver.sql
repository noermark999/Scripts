-- Amin, Oliver, Casper og Jakob

-- Opgave 2.a Find alle de fade, der indeholder en given destillering identificeret med New Make nummeret
select Fad.* 
from Fad
INNER JOIN Destillat on fad.fadId = Destillat.fadId
INNER JOIN DestillatDestillering dd ON dd.destillatId = Destillat.destillatId
WHERE dd.destilleringsId = 8

-- Opgave 2.b Udregn det samlede antal af fade, der er på hvert lager (adressen)
select Lager.adresse, COUNT(Fad.fadId) as antal
from Lager
INNER JOIN Reol on Reol.lagerid = Lager.lagerId
INNER JOIN Hylde on Hylde.reolId = Reol.reolId
INNER JOIN Fad on fad.hyldeId = Hylde.hyldeId
GROUP BY lager.adresse

-- Opgave 2.c Find alle de hylder, der har mere end 2 fade liggende.
select hyldeId
from Fad
group by hyldeId
having COUNT(*) >= 2 and hyldeId is not null

select COUNT(*) antal from Hylde INNER JOIN Fad on fad.hyldeId = Hylde.hyldeId GROUP by Hylde.hyldeId -- Viser alle hylders antal fade

-- Opgave 2.d Find reoler der ikke indeholder fade.
select Reol.*
FROM Reol
inner JOIN Hylde on hylde.reolId = Reol.reolId
where Hylde.hyldeId not in (select hyldeId from fad where hyldeId is not null)

-- View til startmængde for de næste to opgaver
go;
create view startMaengde AS
select sum(DestillatDestillering.maengde) startMaengde, Destillat.destillatId
from DestillatDestillering 
inner join Destillat on Destillat.destillatId = destillatDestillering.destillatId
group by Destillat.destillatId
go;

-- Opgave 2.e
SELECT (select startMaengde from startMaengde where startMaengde.destillatId = Destillat.destillatId), slutMaengde, (select startMaengde from startMaengde where startMaengde.destillatId = Destillat.destillatId)-slutMaengde AS angels_share
from Destillat
where slutMaengde IS NOT NULL AND toemningsDato IS NOT NULL

--Opgave 2.f
SELECT (select startMaengde from startMaengde where startMaengde.destillatId = Destillat.destillatId), slutMaengde, (((select startMaengde from startMaengde where startMaengde.destillatId = Destillat.destillatId)-slutMaengde)/(DATEDIFF(DAY,datoForPaafyldning,toemningsDato)/30.0)) AS angels_share_per_month
from Destillat
where slutMaengde IS NOT NULL AND toemningsDato IS NOT NULL

-- Opgave 3.a 
go;
create view medarbejderdestil AS
select Destillering.*, Medarbejder.navn, dd.destillatId, Fad.fadId
from Destillering
left join Medarbejder on Medarbejder.medarbejderId = Destillering.medarbejderId
left join DestillatDestillering dd on dd.destilleringsId = Destillering.destilleringsId
left join Destillat on Destillat.destillatId = dd.destillatId
left join Fad on Fad.fadId = Destillat.fadId
go;

drop view medarbejderdestil
go;

SELECT *
from medarbejderdestil
WHERE navn = 'Kenneth Brygger'

--Opgave 3. b
go;
CREATE VIEW lagerView
AS
SELECT Lager.adresse, Reol.reolId, hyldeId, Hylde.maksPladser
FROM Lager, Reol, Hylde
WHERE Lager.lagerId = Reol.lagerid
and	  Hylde.reolId = Reol.reolId

go;
SELECT lagerView.*, COUNT(Fad.fadId) AS fadePerHylde
FROM lagerView
LEFT JOIN Fad ON lagerView.hyldeId = Fad.hyldeId
GROUP BY lagerView.adresse, lagerView.reolId, lagerView.hyldeId, lagerView.maksPladser, lagerView.hyldeId


-- Opgave 4.a Givet to datoer, find alle de destilleringer, der er lavet mellem disse datoer. Begge datoer inklusive
go;
create proc destilleringermellemdato 
@startdato DATE,
@slutdato DATE
AS
select *
from Destillering
WHERE Destillering.startDato BETWEEN @startdato and @slutdato

EXEC destilleringermellemdato '2020-06-21', '2020-12-03'

-- Opgave 4.b Givet et destillat, opdater destillatet med tømningsdato og slutmængde. Disse kan kun
-- opdateres, hvis destillatet har ligget mindst 36 måneder.
go;
create proc opdaterToemning
@destillatId int,
@toemningsDato date,
@slutMaengde int
AS
IF (select (DATEDIFF(DAY,datoForPaafyldning,@toemningsDato)/30.0) from Destillat where @destillatId = Destillat.destillatId) >= 36
    UPDATE Destillat
    SET slutMaengde = @slutMaengde,
	    toemningsDato = @toemningsDato
    WHERE destillatId = @destillatId
ELSE
throw 51000, 'Tømningsdato er ikke 3 år efter dato for påfyldning', 20

exec opdaterToemning 2, '2023-07-12', 24
go;

-- Opgave 4.c Givet et destillat, finder hvilket fad destillatet ligger på, hvilken hylde fadet ligger på, hvilken
-- reol hylden er på og hvilket lager reolen stå på.
go;
create proc destillatInfo
@destillatId int
AS
select destillatId, Fad.fadId, Hylde.hyldeId, Reol.reolId, Lager.lagerId, Lager.adresse
from Destillat
inner join Fad on Fad.fadId = destillat.fadId
inner join hylde on hylde.hyldeId = Fad.hyldeId
inner join Reol on Reol.reolId = Hylde.reolId
inner join Lager on Lager.lagerId = Reol.lagerId
WHERE destillatId = @destillatId

drop proc destillatInfo

exec destillatInfo 3

-- Opgave 5. A
go;
CREATE TRIGGER insertPaaHylde
ON Fad
INSTEAD OF INSERT, UPDATE
AS
DECLARE @fadId int
SET @fadId = (SELECT fadId FROM inserted)
DECLARE @hylde INT
SET @hylde = (SELECT hyldeId FROM inserted)
DECLARE @reol int
SET @reol = (SELECT reolId
FROM Hylde
WHERE Hylde.hyldeId = @hylde)
DECLARE @maxPlads int
SET @maxPlads = (SELECT maksPladser
FROM Hylde
WHERE Hylde.hyldeId = @hylde)
DECLARE @fadePaaHylden int
SET @fadePaaHylden = (SELECT COUNT(*)
FROM Fad
WHERE Fad.hyldeId = @hylde)
IF @maxPlads >= @fadePaaHylden+1
	BEGIN
	IF EXISTS (SELECT fadId FROM Fad WHERE fadId = @fadId)
		BEGIN
		UPDATE Fad
		SET hyldeId = (SELECT @hylde)
		WHERE Fad.fadId = @fadId
		PRINT 'Fadet ligger på reol: ' + CAST(@reol as VARCHAR) + ' og på hylde: ' + CAST(@hylde AS VARCHAR)
		END
	ELSE
		INSERT INTO Fad (fadType, fadStørrelse, hyldeId)
		(SELECT fadType, fadStørrelse, hyldeId FROM inserted)
		PRINT 'Fadet ligger på reol: ' + CAST(@reol as VARCHAR) + ' og på hylde: ' + CAST(@hylde AS VARCHAR)
		END
ELSE THROW 51000, 'Der er ikke plads på hylden', 20

-- Opgave 5.b
go;
CREATE TRIGGER maengdeTjek on DestillatDestillering
INSTEAD OF INSERT
as
DECLARE @maengde as int
set @maengde = (select inserted.maengde from inserted)
DECLARE @insertDestillatId as INT
set @insertDestillatId = (select inserted.destillatId from inserted)
DECLARE @insertDestilleringsId as INT
set @insertDestilleringsId = (select inserted.destilleringsId from inserted)
declare @sumMaengdeFad as INT
set @sumMaengdeFad = (select SUM(dd.maengde) from DestillatDestillering dd inner join Destillat on Destillat.destillatId = dd.destillatId inner join Fad on Fad.fadId = Destillat.destillatId where destillat.destillatId = @insertDestillatId)
declare @sumMaengdeDest as INT
set @sumMaengdeDest = (select SUM(dd.maengde) from DestillatDestillering dd where dd.destilleringsId = @insertDestilleringsId)
IF @sumMaengdeFad is NULL
    BEGIN
    set @sumMaengdeFad = 0
    end
if (@maengde+@sumMaengdeFad) <= (select Fad.fadStørrelse from Fad where Fad.fadId = (select Destillat.fadId from Destillat where Destillat.destillatId = @insertDestillatId))
begin 
    IF @sumMaengdeDest is NULL
        BEGIN
        set @sumMaengdeDest = 0
        end
    IF (@maengde)+@sumMaengdeDest <= ((select Destillering.maengde from Destillering where Destillering.destilleringsId = @insertDestilleringsId))
        BEGIN
        insert into DestillatDestillering VALUES
        (@insertDestillatId, @insertDestilleringsId, @maengde)
        print 'Destillering tilføjet til destillat'
        END
    ELSE throw 51100, 'Der er ikke nok tilbage i destilleringen til at tilføje til destillat', 20
END
ELSE throw 51100, 'Der er ikke plads i fadet til at tilføjde denne mængde', 20

drop trigger maengdeTjek
