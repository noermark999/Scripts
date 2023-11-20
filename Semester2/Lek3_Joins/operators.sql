INSERT into Medlem(medlemsId, navn) VALUES
    (40,'Ole')

select * 
FROM Medlem
where alder is null

select *
from Medlem
where medlemsId BETWEEN 10 and 20

select *
from Medlem
where alder in (10,11,12)
ORDER by alder

select *
from Medlem
where navn like 'a%' -- % betyder at alt efter a er ligemeget og finder derfor medlemmer der starter med a

select *
from Medlem
where navn like '__l%' -- _ betyder det er ligemeget hvad det starter med så her ignorer den de 2 første bogstaver og tjekker efter navne der har l på 3. position

select count(*) antal
from Medlem
where alder = 10