DROP TABLE team
DROP TABLE projekt
DROP TABLE Medarbejder
DROP TABLE teammedarbejder
DROP TABLE Opgavetype
DROP TABLE MedarbejderOpgavetype
DROP TABLE opgave
DROP TABLE tidsregistrering

CREATE TABLE Team (
    teamid int PRIMARY KEY,
    navn varchar(20)
)

CREATE TABLE Projekt (
    projektid int PRIMARY KEY,
    navn VARCHAR(20),
    estimeretTimer int,
    deadline date,
    teamid int FOREIGN KEY REFERENCES Team(teamid)
)

CREATE TABLE Medarbejder (
    medarbejderid int PRIMARY KEY,
    navn varchar(20),
    stillingsbetegnelse varchar(50),
    mobil CHAR(8)
)

CREATE TABLE TeamMedarbejder(
    teamid int FOREIGN KEY REFERENCES Team(teamid),
    medarbejderid int FOREIGN KEY REFERENCES Medarbejder(medarbejderid),
    PRIMARY KEY (teamid, medarbejderid)
)

CREATE TABLE Opgavetype (
    opgavetypeid int PRIMARY KEY,
    navn VARCHAR(20),
    beskrivelse VARCHAR(200)
)

CREATE TABLE MedarbejderOpgavetype (
    medarbejderid int FOREIGN KEY REFERENCES medarbejder(medarbejderid),
    opgavetypeid int FOREIGN KEY REFERENCES opgavetype(opgavetypeid),
    PRIMARY KEY (medarbejderid, opgavetypeid)
)

CREATE TABLE Opgave (
    opgaveid int PRIMARY KEY,
    beskrivelse varchar(200),
    prioritet varchar(20),
    forventetStart date,
    deadline date,
    opgavestatus varchar(50),
    projektid int FOREIGN KEY REFERENCES Projekt(projektid) not null,
    opgavetypeid int FOREIGN KEY REFERENCES Opgavetype(opgavetypeid) not NULL
)

CREATE TABLE Tidsregistrering(
    Tidsregistreringid int PRIMARY KEY,
    starttid time,
    sluttid time,
    beskrivelseAfArbejdet varchar(300),
    datoRegistrering date,
    opgaveid int FOREIGN KEY REFERENCES opgave(opgaveid) not null,
    medarbejderid int FOREIGN KEY REFERENCES medarbejder(medarbejderid) not null
)
