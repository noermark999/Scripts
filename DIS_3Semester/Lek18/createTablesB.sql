create database lek18B

-- Kunde med felterne kundeid, navn og postnr samt en tabel
-- Postering med felterne kundeid og beloeb.

create TABLE Kunde (
    kundeid int IDENTITY(2,2) primary key,
    navn VARCHAR(25),
    postnr char(4)
)

create table Postering (
    kundeid int,
    beloeb int
)