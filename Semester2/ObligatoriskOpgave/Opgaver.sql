--Gruppe 9
--Jakob, Tobias, Mathias

--Opgave 4A
SELECT S.navn, RAK.karakter
FROM Studerende S
INNER JOIN ResultAfEksamen RAK ON S.studerendeId = RAK.studerendeId
WHERE RAK.karakter = 12

--Opgave 4B
SELECT S.navn, E.fag, RAK.karakter
FROM Studerende S
INNER JOIN ResultAfEksamen RAK ON S.studerendeId = RAK.studerendeId
INNER JOIN Eksamen E ON E.eksamensId = RAK.eksamensId
WHERE RAK.karakter >= 02

--Opgave 4C
SELECT E.fag, AVG(RAK.karakter * 1.00) AS gennemsnit
FROM Eksamen E
INNER JOIN ResultAfEksamen RAK ON E.eksamensId = RAK.eksamensId
WHERE RAK.karakter >= 02
GROUP BY E.fag

--Opgave 5
go;
CREATE PROC PrintAfStuderendesEksaminer
@studerendeId INT
AS
SELECT S.navn, E.fag, RAK.karakter
FROM Studerende S
INNER JOIN ResultAfEksamen RAK ON S.studerendeId = RAK.studerendeId
INNER JOIN Eksamen E ON E.eksamensId = RAK.eksamensId
WHERE RAK.karakter >= 02 AND @studerendeId = RAK.studerendeId

DROP PROC PrintAfStuderendesEksaminer

EXEC PrintAfStuderendesEksaminer 


--Opgave 6
go;
CREATE TRIGGER KunEnKarakter ON ResultAfEksamen
INSTEAD OF INSERT
AS
IF ((SELECT COUNT(*) FROM ResultAfEksamen WHERE studerendeId = (SELECT studerendeId FROM Inserted)  AND eksamensId = (SELECT eksamensId FROM Inserted) AND karakter >= 2) = 0)
BEGIN
    INSERT INTO ResultAfEksamen
    VALUES ((SELECT studerendeId FROM Inserted), (SELECT eksamensId FROM Inserted), (SELECT karakter FROM Inserted))
    PRINT 'Karakter indsat'
END
ELSE THROW 51000, 'Studerende har allerede en karakter for dette fag', 20

DROP TRIGGER KunEnKarakter

INSERT INTO ResultAfEksamen VALUES 
(2, 3, 00)

SELECT *
FROM ResultAfEksamen