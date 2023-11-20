-- Amin, Oliver, Casper og Jakob

Create database SallWhisky

drop table DestillatDestillering
drop TABLE Destillering
drop table Destillat
drop table Medarbejder
drop table Fad
drop table Hylde
drop table Reol
drop table Lager

Create Table Lager (
    lagerId INT IDENTITY(1,1) PRIMARY KEY,
    adresse VARCHAR(50),
    lagerNavn VARCHAR(50) NOT NULL,
)

Create Table Reol (
    reolId INT IDENTITY(1,1) PRIMARY KEY,
    lagerid INT FOREIGN KEY REFERENCES Lager(lagerId) NOT NULL
)

Create Table Hylde (
    hyldeId INT IDENTITY(1,1) PRIMARY KEY,
    reolId INT FOREIGN KEY REFERENCES Reol(reolId) NOT NULL,
    maksPladser INT NOT NULL
)

Create Table Fad (
    fadId INT IDENTITY(1,1) PRIMARY KEY,
    fadType VARCHAR(50),
    fadStørrelse INT, --Liter
    hyldeId INT FOREIGN KEY REFERENCES Hylde(hyldeId)
)

CREATE TABLE Medarbejder (
    medarbejderId INT IDENTITY(1,1) PRIMARY KEY,
    navn VARCHAR(50)
)

Create Table Destillat (
    destillatId INT IDENTITY(1,1) PRIMARY KEY,
    datoForPaafyldning DATE,
    slutMaengde INT, --Liter
    toemningsDato DATE,
    fadId INT FOREIGN KEY REFERENCES Fad(fadId) NOT NULL
)

Create Table Destillering (
    destilleringsId INT IDENTITY(1,1) PRIMARY KEY,
    startDato date,
    slutDato date,
    maltBatch varchar(50),
    kornSort VARCHAR(50),
    maengde int, --Liter
    alkoholProcent Decimal(5,2) CHECK (alkoholProcent >= 0 and alkoholProcent <= 100),
    medarbejderId INT FOREIGN KEY REFERENCES Medarbejder(medarbejderId) not null
)

Create Table DestillatDestillering (
    destiallatDestilleringId INT IDENTITY(1,1) PRIMARY KEY,
    destillatId INT FOREIGN KEY REFERENCES Destillat(destillatId),
    destilleringsId INT FOREIGN KEY REFERENCES Destillering(destilleringsId) not null,
    maengde INT --Liter
)