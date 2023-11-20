select *
from Klub k 
inner join Hold h  on k.klubId = h.klubId

select navn, alder, Hold.holdNavn
from Medlem, HoldMedlem, Hold 
where Medlem.medlemsId = HoldMedlem.medlemsId
and HoldMedlem.holdId = 2 
and Hold.holdId = 2

select navn, alder, Hold.holdNavn
from Medlem
inner join HoldMedlem  
on Medlem.medlemsId = HoldMedlem.medlemsId
inner join Hold
on Hold.holdId = holdmedlem.holdId
where HoldMedlem.holdId = 2

insert into klub values
('KLM', 'Klub LM')

SELECT *
from Klub
left outer join hold 
on Klub.klubId = hold.klubId