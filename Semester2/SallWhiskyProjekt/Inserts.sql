-- Amin, Oliver, Casper og Jakob

INSERT INTO Lager VALUES 
('Rundhøjen 29, Sall', 'Originalt Lager'),
('Langegade 12, Sall', 'Stort Lager')

INSERT into Reol VALUES
(1),
(1),
(1),
(2),
(2),
(2),
(2),
(2)

INSERT into Hylde VALUES
(1,5),
(1,5),
(1,5),
(2,3),
(2,3),
(2,3),
(3,5),
(3,5),
(3,5),
(4,3),
(4,3),
(4,3),
(5,5),
(5,5),
(5,5),
(6,5),
(6,5),
(6,5),
(7,3),
(7,3),
(7,3),
(8,5),
(8,5),
(8,5)

Insert into Fad VALUES
('Bourbon', 50, 1),
('Hvidvin', 50, 2),
('Sherry', 100, 4),
('Portvin', 100, 5),
('Madeira', 50, 7),
('Rom', 75, 8),
('Cognac', 50, 10),
('Calvados', 100, 11),
('Rødvin', 50, 13),
('Rosévin', 75, 14),
('Bourbon', 100, 14),
('Hvidvin', 75, 13),
('Sherry', 50, 11),
('Portvin', 50, 10),
('Madeira', 100, 8),
('Rom', 100, 7),
('Cognac', 75, 5),
('Calvados', 50, 4),
('Rødvin', 75, 2),
('Rosévin', 75, 1),
('Bourbon', 50, 3),
('Hvidvin', 50, 6),
('Sherry', 100, 9),
('Portvin', 100, 12),
('Bourbon', 50, 15),
('Hvidvin', 50, 16),
('Sherry', 100, 17),
('Portvin', 100, 18),
('Cognac', 75, null),
('Calvados', 50, null),
('Rødvin', 75, null),
('Rosévin', 75, null),
('Bourbon', 50, null),
('Hvidvin', 50, null)

Insert into Medarbejder values
('Kenneth Brygger'),
('Lars Ølvom'),
('Lis Dranker')

Insert into Destillering values
('2020-07-20', '2020-07-20', 'Single Malt', 'Bygmalt', 1000, 63, 1),
('2020-06-21', '2020-06-21', 'Double Malt', 'Bygmalt', 500, 63, 1),
('2019-03-11', '2019-03-11', 'Triple Malt', 'Bygmalt', 1000, 63, 1),
('2020-12-03', '2020-12-03', 'Single Malt', 'Bygmalt', 1000, 63, 1),
('2020-11-04', '2020-11-04', 'Single Malt', 'Bygmalt', 1000, 63, 1),
('2023-02-20', '2023-02-20', 'Double Malt', 'Bygmalt', 1000, 63, 1),
('2021-07-01', '2021-07-01', 'Single Malt', 'Bygmalt', 1000, 63, 1),
('2022-09-27', '2022-09-27', 'Single Malt', 'Bygmalt', 500, 63, 1),
('2020-07-15', '2020-07-15', 'Single Malt', 'Bygmalt', 500, 63, 1),
('2023-01-15', '2023-01-15', 'Double Malt', 'Bygmalt', 500, 63, 1),
('2021-02-16', '2021-02-16', 'Single Malt', 'Bygmalt', 500, 63, 2),
('2022-03-14', '2022-03-14', 'Single Malt', 'Bygmalt', 500, 63, 2),
('2022-07-05', '2022-07-05', 'Double Malt', 'Bygmalt', 500, 63, 2),
('2023-03-10', '2023-03-10', 'Double Malt', 'Bygmalt', 500, 64, 2),
('2020-05-30', '2020-05-30', 'Double Malt', 'Bygmalt', 500, 64, 2),
('2021-06-20', '2021-06-20', 'Double Malt', 'Bygmalt', 500, 64, 2),
('2021-07-10', '2021-07-10', 'Triple Malt', 'Bygmalt', 1000, 63, 2),
('2020-07-23', '2020-07-23', 'Triple Malt', 'Bygmalt', 1000, 63, 2),
('2023-07-25', '2023-07-25', 'Triple Malt', 'Bygmalt', 1000, 63, 2),
('2020-01-26', '2020-01-26', 'Single Malt', 'Bygmalt', 1000, 64, 3),
('2022-01-20', '2022-01-20', 'Single Malt', 'Bygmalt', 500, 65, 3),
('2021-01-10', '2021-01-10', 'Single Malt', 'Rugmalt', 500, 65, 3),
('2020-02-20', '2020-02-20', 'Single Malt', 'Rugmalt', 500, 65, 3),
('2020-05-22', '2020-05-22', 'Single Malt', 'Rugmalt', 1000, 65, 3),
('2023-12-22', '2023-12-22', 'Single Malt', 'Rugmalt', 1000, 65, 3),
('2023-12-22', '2023-12-22', 'Single Malt', 'Rugmalt', 1000, 65, 1),
('2023-11-20', '2023-11-20', 'Single Malt', 'Rugmalt', 500, 65, 1),
('2023-10-20', '2023-10-20', 'Single Malt', 'Rugmalt', 500, 65, 1),
('2021-01-20', '2021-01-20', 'Single Malt', 'Rugmalt', 500, 65, 1),
('2022-02-20', '2022-02-20', 'Single Malt', 'Rugmalt', 500, 65, 1)

insert into Destillat (datoForPaafyldning, fadId) values
('2019-08-06', 1),
('2019-06-06', 2),
('2018-02-10', 3),
('2019-10-07', 4),
('2019-08-02', 5),
('2019-08-13', 6),
('2020-10-06', 7),
('2017-12-05', 8),
('2021-03-23', 9),
('2022-02-21', 10),
('2023-05-12', 11),
('2016-07-13', 12),
('2017-09-15', 13),
('2018-11-06', 14),
('2019-10-07', 15),
('2020-03-08', 16),
('2019-04-09', 17),
('2020-02-04', 18),
('2019-12-17', 19),
('2021-03-24', 20),
('2019-05-25', 21),
('2018-01-23', 22),
('2019-06-08', 23),
('2020-03-06', 24),
('2019-08-27', 25),
('2021-08-13', 26),
('2019-02-11', 27),
('2023-01-14', 28)

UPDATE Destillat
SET slutMaengde = 47,
	toemningsDato = '2023-04-18'
WHERE destillatId = 6

UPDATE Destillat
SET slutMaengde = 45,
	toemningsDato = '2023-04-18'
WHERE destillatId = 1

UPDATE Destillat
SET slutMaengde = 43,
	toemningsDato = '2023-04-18'
WHERE destillatId = 5

insert into DestillatDestillering values
(1, 30, 50),
(2, 29, 25),
(3, 28, 75),
(4, 27, 100),
(5, 26, 50),
(6, 27, 50),
(7, 25, 75),
(8, 24, 100),
(9, 23, 75),
(10, 22, 50),
(11, 21, 100),
(12, 20, 25),
(13, 20, 50),
(14, 20, 75),
(15, 19, 100),
(16, 18, 50),
(17, 17, 50),
(18, 16, 75),
(19, 15, 50),
(20, 14, 100),
(21, 13, 75),
(22, 12, 50),
(23, 11, 50),
(24, 10, 75),
(25, 9, 50),
(26, 8, 100),
(27, 7, 75),
(28, 6, 50)