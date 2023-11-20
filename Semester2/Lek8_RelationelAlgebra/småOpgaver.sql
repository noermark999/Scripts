select maxantal.klubid, maxantal.navn, maxantal.antal, Hold.holdid
from hold
inner join
(select Klub.klubId, Klub.navn, MAX(Hold.antal) as antal
from Klub
INNER join Hold
on Hold.klubId = Klub.klubId
GROUP BY klub.klubId, klub.navn) as maxantal
on hold.klubId = maxantal.klubId
and hold.antal = maxantal.antal


select Klub.klubId, Klub.navn, Hold.antal, hold.holdId
from Klub
INNER join Hold
on Hold.klubId = Klub.klubId
where hold.antal = (select MAX(hold.antal)
                    from Hold)
                
