
-- Opgave: Find navnet på de yngste medlemmer
SELECT navn, alder
from Medlem
where alder = (
    select MIN(alder)
    from Medlem
    )

