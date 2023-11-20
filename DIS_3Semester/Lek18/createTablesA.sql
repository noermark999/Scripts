create database lek18A

-- Kunde med felterne kundeid, navn og postnr, samt en tabel
-- Bestilling med felterne kundeid, varenavn og antalVarer.

create TABLE Kunde (
    kundeid int IDENTITY(1,2) primary key,
    navn VARCHAR(25),
    postnr char(4)
)

create table Bestilling (
    kundeid int,
    varenavn VARCHAR(25),
    antalVarer int
)