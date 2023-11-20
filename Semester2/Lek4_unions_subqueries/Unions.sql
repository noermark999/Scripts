select cpr, navn
from AnsatIVirkA
UNION
select cpr, CONCAT(fornavn, ' ' + efternavn) as navn
from AnsatIVirkB  -- Sammensætning af alle rækker fra begge tabeller, medmindre der er to med samme navn og cpr, så kommer den kun 1 gang

select cpr, navn
from AnsatIVirkA
INTERSECT
select cpr, CONCAT(fornavn, ' ' + efternavn) as navn
from AnsatIVirkB -- Viser kun de rækker som er i begge tabeller

select cpr, navn
from AnsatIVirkA
EXCEPT
select cpr, CONCAT(fornavn, ' ' + efternavn) as navn
from AnsatIVirkB -- Viser de rækker der er i AnsatIVirkA som ikke er i AnsatIVirkB


-- Opgave find alle personer som ikke er ansat i en virksomhed
select cpr, navn
from Person
EXCEPT (
    select cpr, navn
    from AnsatIVirkA
    UNION
    select cpr, CONCAT(fornavn, ' ' + efternavn) as navn
    from AnsatIVirkB
) 