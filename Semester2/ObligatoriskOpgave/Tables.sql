--Gruppe 9
--Jakob, Tobias og Mathias
create database obliOpgave

CREATE TABLE Skole (
    skoleId INT IDENTITY(1,1) PRIMARY KEY,
    navn VARCHAR(50) NOT NULL,
    adresse VARCHAR(50)
)

CREATE TABLE Uddannelse (
    uddannelsesId INT IDENTITY(1,1) PRIMARY KEY,
    navn VARCHAR(50) NOT NULL,
    skoleId INT FOREIGN KEY REFERENCES Skole(skoleId) NOT NULL
)

CREATE TABLE Studerende (
    studerendeId INT IDENTITY(1,1) PRIMARY KEY,
    navn VARCHAR(50) NOT NULL,
    alder INT,
    uddannelsesId INT FOREIGN KEY REFERENCES Uddannelse(uddannelsesId)
)

CREATE TABLE Eksamen (
    eksamensId INT IDENTITY(1,1) PRIMARY KEY,
    fag VARCHAR(50) NOT NULL,
    uddannelsesId INT FOREIGN KEY REFERENCES Uddannelse(uddannelsesId) NOT NULL
)

CREATE TABLE ResultAfEksamen (
    studerendeId INT FOREIGN KEY REFERENCES Studerende(studerendeId) NOT NULL,
    eksamensId INT FOREIGN KEY REFERENCES Eksamen(eksamensId),
    karakter INT CHECK (karakter IN(-3, 00, 02, 4, 7, 10, 12)),
)