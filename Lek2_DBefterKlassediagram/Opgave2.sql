insert into team VALUES 
    (1, 'Sælgere'),
    (2, 'købere')

INSERT into projekt VALUES 
    (1, 'SalgAudi', 3, '2023-02-04', 1)

INSERT into medarbejder VALUES
    (1, 'Lars', 'Salg af biler', '93857284'),
    (2, 'Peter', 'Køb af biler', '56827593')

INSERT into TeamMedarbejder VALUES
    (1, 1),
    (2,2)

INSERT into Opgavetype VALUES
    (1, 'Salgsopgaver', 'Der skal bare sælges biler')

INSERT into MedarbejderOpgavetype VALUES
    (1,1)

INSERT into Opgave VALUES
    (1, 'Sælge Audi a3', 'Høj', '2023-02-02', '2023-02-10', 'Næsten færdig', 1,1)

INSERT into Tidsregistrering VALUES
    (1, '10:00', '13:00', 'Solgt Audi', '2023-02-08', 1,1)

