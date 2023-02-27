create database Lek5

drop table Ordrelinje
drop table Vare
drop table Ordre
drop table Kunde


create table Kunde(
kundenummer int primary key,
fornavn varchar(30),
efternavn varchar(30),
email varchar(30),
adresse varchar(50),
postnummer char(4),
bynavn varchar(20)
)

create table Ordre(
ordrenummer int primary key,
kundenummer int foreign key references Kunde(kundenummer) 
)

create table Vare(
varenummer int primary key,
varenavn varchar(20),
pris decimal(7,2),
antalPaaLager int
)

create table Ordrelinje(
ordrelinjenummer int,
ordrenummer int foreign key references Ordre(ordrenummer),
varenummer int foreign key references Vare(varenummer)
)

