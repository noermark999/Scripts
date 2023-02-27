-- opgave 1
select count(*)
from Projekt

-- Opgave 2
select Team.navn, count(MedarbejderITeam.medarbejderNr) antal
from MedarbejderITeam
right outer join Team
on MedarbejderITeam.teamId = team.teamId
group by team.navn

-- Opgave 3
select Team.navn, SUM(Projekt.estimeretTimer) timer
from Team
inner join Projekt
on team.teamId = Projekt.teamId
group by Team.navn

--Opgave 4
select Opgavetype.navn, count(MedarbejderOpgavetype.medarbejderNr) antal
from MedarbejderOpgavetype
right outer join Opgavetype
on MedarbejderOpgavetype.typeId = Opgavetype.opgavetypeId
group by Opgavetype.navn

--Opgave 5
select Medarbejder.navn, Medarbejder.medarbejderNr
from Medarbejder
inner join MedarbejderITeam
on Medarbejder.medarbejderNr = MedarbejderITeam.medarbejderNr
where MedarbejderITeam.teamId = 3

--Opgave 6
select stillingsbetegnelse, COUNT(*) antal
from Medarbejder
group by stillingsbetegnelse