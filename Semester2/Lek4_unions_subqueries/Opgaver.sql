--Opgave 1
SELECT projektnavn, estimeretTimer
from Projekt
where estimeretTimer = (
    select MIN(estimeretTimer)
    from Projekt
    )

-- Opgave 2
SELECT navn
from Medarbejder
where EXISTS (
    select *
    from Tidsregistrering
    where Tidsregistrering.medarbejderNr = Medarbejder.medarbejderNr
)

-- Opgave 3
select Distinct navn
from Medarbejder
inner join Tidsregistrering
on Tidsregistrering.medarbejderNr = medarbejder.medarbejderNr 

-- Opgave 4
SELECT distinct projektnavn, Opgave.opgavenr, statuspaaopgave, navn
from Tidsregistrering
inner join Opgave
on Opgave.opgaveNr = Tidsregistrering.opgaveNr
inner join Projekt
on Projekt.projektNr = Opgave.projektNr
inner join Medarbejder
on Medarbejder.medarbejderNr = Tidsregistrering.medarbejderNr

-- Opgave 5
select navn
from Medarbejder
where exists (
    select MedarbejderOpgavetype.medarbejderNr
    from MedarbejderOpgavetype
    where MedarbejderOpgavetype.medarbejderNr = Medarbejder.medarbejderNr
    and exists (
    select statusPaaOpgave
    from Opgave
    where Opgave.opgavetypeId = MedarbejderOpgavetype.typeId
    and Opgave.statusPaaOpgave = 'To do'
))

-- Opgave 5 inner join
select distinct navn
from Medarbejder
inner join MedarbejderOpgavetype
on MedarbejderOpgavetype.medarbejderNr = Medarbejder.medarbejderNr
inner join Opgave
on Opgave.opgavetypeId = MedarbejderOpgavetype.typeId
where statusPaaOpgave = 'To do'

