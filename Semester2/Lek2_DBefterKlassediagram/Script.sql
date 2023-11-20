DROP TABLE Datatyper

CREATE DATABASE Lek2

CREATE TABLE DataTyper (
    id INT PRIMARY KEY,
    navn VARCHAR(20) DEFAULT 'Et godt navn', -- Hvis der ikke bliver skrevet noget navn ved insert kommer der til at stå dette
    navn2 VARCHAR(20) UNIQUE, -- Der kan ikke være 2 af samme navn2
    postnummer CHAR(4) check (postnummer in ('8000', '8200', '8300')), -- Postnummeret skal være en af de 3 værdier
    alder INT CHECK (alder > 20),
    tid TIME DEFAULT current_timestamp,
    dato DATE DEFAULT getdate(),
    pris DECIMAL(7,2), -- Det første tal (7) er hvor langt tallet kan være alt i alt og det andet tal (2) er hvor mange cifre efter decimaltallet
    boolean BIT, --Taster man 0 ind bliver der 0, alt andet er 1
    boolean2 CHAR(1) CHECK (boolean2 in ('0','1')), -- det indtastede skal være enten 0 eller 1
    lilletal TINYINT not null,
    aar SMALLINT not null CHECK (aar > 1950 and aar < 2150)
)

select *
from DataTyper

INSERT into DataTyper VALUES (
    1,
    'Peter',
    'Larsen',
    '8300',
    23,
    '10:32',
    '2023-02-03',
    231.99,
    'false',
    '1',
    53,
    2012
)

INSERT into DataTyper (
    id, 
    navn2, 
    lilletal, 
    aar
) VALUES (
    2,
    'Hansen',
    53,
    2012
)
