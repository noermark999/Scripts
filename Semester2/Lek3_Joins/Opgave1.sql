create Database Lek3

-- Løsning a
create table beboelseSuper_A (
    kvm int,
    addresse varchar(30) primary key,
    sal varchar(3),
    antalVærelser int,
    grundKVM int,
    carport bit
)

-- Løsning B
create table Lejlighed_B (
    kvm int,
    addresse varchar(30) primary key,
    sal varchar(3),
    antalVærelser int
)

create table Hus_B (
    kvm int,
    addresse varchar(30) primary key,
    grundKVM int,
    carport bit
)

--Løsning C
create table Beboelse_C (
    kvm int,
    addresse varchar(30) primary key 
)

create table Lejlighed_C (
    LejlighedId int PRIMARY KEY,
    sal varchar(3),
    antalVærelser int,
    addresse varchar(30) foreign key REFERENCES Beboelse_C(addresse)
)

create table Hus_C (
    HusId int primary key,
    grundKVM int,
    carport bit,
    addresse varchar(30) foreign key REFERENCES Beboelse_C(addresse)
)