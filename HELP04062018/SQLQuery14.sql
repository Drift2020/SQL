declare @max int =( 
						select count(*)
						from Country
						
					), @indecs int
set @indecs = rand() * @max



 


select top 1 Countrys.pole
from (select top (@indecs) Country.name as[pole] 
from Country 
order by Country.name) as Countrys
order by Countrys.pole desc
