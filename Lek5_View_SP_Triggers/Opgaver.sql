--Opgave 1
SELECT medarbejder.navn, mobil
from Medarbejder
inner join MedarbejderITeam
on MedarbejderITeam.medarbejderNr = Medarbejder.medarbejderNr
inner join Team
on MedarbejderITeam.teamId = team.teamId
where team.navn = 'Team alfa'
go;

-- Opgave 2
drop view medarbejderPåTeam
go;

create view medarbejderPåTeam 
AS
SELECT team.navn Teamnavn, medarbejder.navn, mobil
from Medarbejder
inner join MedarbejderITeam
on MedarbejderITeam.medarbejderNr = Medarbejder.medarbejderNr
inner join Team
on MedarbejderITeam.teamId = team.teamId
go;

-- Opgave 3
select *
from medarbejderPåTeam
where Teamnavn = 'Team Alfa'
go;

-- Opgave 4
create proc findMedarbejderPåTeam
@teamnavn VARCHAR(30)
AS
select navn, mobil
from medarbejderPåTeam
where Teamnavn = @teamnavn

exec findMedarbejderPåTeam 'Team Alfa'
go;

-- Opgave 5
drop proc NavnDerStarterMed
go;

create proc NavnDerStarterMed 
@forbogstav char(1)
AS
select navn
from Medarbejder
where navn like @forbogstav + '%'

exec NavnDerStarterMed J

-- Opgave 6
create table SlettedeMedarbejder(
medarbejderNr int primary key,
navn varchar(30),
stillingsbetegnelse varchar(30),
mobil char(10)
)

drop trigger sletmedarbejder
go;

create trigger sletMedarbejder on Medarbejder
instead of delete
AS
insert into SlettedeMedarbejder(medarbejderNr, navn, stillingsbetegnelse, mobil)  
    select *
    from deleted
go;

insert into Medarbejder VALUES 
(151, 'Lars', 'Ingen', '15101010')

delete from Medarbejder
where Medarbejder.medarbejderNr = 151

select * from Medarbejder
where Medarbejder.medarbejderNr = 151

select * from SlettedeMedarbejder
where medarbejderNr = 150
go;

--Opgave 7
select *
from Medarbejder
left join slettedemedarbejder
on Medarbejder.medarbejderNr = slettedemedarbejder.medarbejderNr
where slettedemedarbejder.medarbejderNr is null
go;

-- Opgave 8

Create view OpgaveTidsregistreringer
as
select O.opgaveNr, O.deadline, P.projektnavn, M.navn, TR.datoRegistering
from Tidsregistrering TR
inner join Opgave O
on TR.opgaveNr = O.opgaveNr
inner join Medarbejder M
on M.medarbejderNr = TR.medarbejderNr
inner join Projekt P
on P.projektNr = O.projektNr
go;

select *
from OpgaveTidsregistreringer

-- Opgave 9
drop proc MedarbejderInfo

go;
Create proc MedarbejderInfo
@MNavn VARCHAR(30)
AS
select O.opgaveNr, P.projektnavn, P.deadline, TR.datoRegistering
from Opgave O
inner join Projekt P
on O.projektNr = P.projektNr
inner join Tidsregistrering TR
on TR.opgaveNr = O.opgaveNr
inner join Medarbejder M
on TR.medarbejderNr = M.medarbejderNr
where @MNavn = M.navn


exec MedarbejderInfo 'Jennifer Lawrence'

-- Opgave 10
drop proc AntalTimer

go;
Create proc AntalTimer
@Mnavn VARCHAR(30)
AS
select SUM((DATEDIFF(MINUTE, tr.starttid, tr.sluttid) / 60.0)) AntalTimer
from Tidsregistrering TR
inner join Medarbejder M
on TR.medarbejderNr = M.medarbejderNr
where M.navn = @Mnavn

exec AntalTimer 'Jennifer Lawrence'

select (DATEDIFF(MINUTE, tr.starttid, tr.sluttid) / 60.0) antaltimer
from Tidsregistrering TR

-- Opgave 11
drop trigger timerforTidsregistrering

go;
Create trigger timerForTidsregistrering on Tidsregistrering
after INSERT
AS
declare @AntalTimer as float;
Set @AntalTimer = (select (DATEDIFF(MINUTE, starttid, sluttid) / 60.0)
                    from inserted)
print @AntalTimer

insert into Tidsregistrering VALUES
('8:30', '16:00', 'Godt Arbejde', '2022-01-01', 4, 2)

delete Tidsregistrering
where Tidsregistrering.datoRegistering = '2022-01-01'








