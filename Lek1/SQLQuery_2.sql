DROP TABLE Datatyper

Create table Datatyper(
    id int PRIMARY KEY,
    tal int,
    navn varchar(20) CHECK (navn in('Bo', 'Ulla', 'Lars'))
)

SELECT *
from Datatyper

insert into Datatyper VALUES
(2,3,'Bo')

DELETE from Datatyper
where id = 2

UPDATE
