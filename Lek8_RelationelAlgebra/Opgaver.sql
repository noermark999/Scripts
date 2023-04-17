-- Opgave 1
select sname
from s 
inner join r 
on s.sid = r.sid
where r.bid = 103

π sname(σ bid=103(r ⋈ s))

-- Opgave 2
select Color 
from B
inner join R
on R.bid = B.bid
inner join S 
on S.sid = R.sid
where sname = 'Lubber'

π Color(σ sname='Lubber'(S ⋈R ⋈B))

--Opgave 3
select sid
from S
where rating >7
union
select sid
from R
where bid = 103

 πsid(σ rating>7(S)) ∪ πsid(σ bid=103(R))

 --Opgave 4
 select sname
 from S 
 inner join R 
 on S.sid = R.sid
 inner join B 
 on B.bid = R.bid
 WHERE color != 'red'

select sname
from S 
EXCEPT
select sid 
from R
inner join B 
on R.bid = B.bid 
where color = 'Red'


π sname(σ color ≠ 'red' (S ⋈R ⋈B))
