select alder, count(alder) antal
from Medlem
group by alder

select klubid, COUNT(klubId) antal
from Hold
group by klubId

select klub.klubId, count(holdid) as antal
from Hold
right outer join Klub
on klub.klubId = hold.klubId
group by klub.klubId

select alder, count(alder) antal
from Medlem
group by alder
having count(alder) = 2