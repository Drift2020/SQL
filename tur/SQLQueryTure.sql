
--сумма за транспорт тура
WITH Transport_price as (
Select Tour.ID, sum(Price_for_Transport.Price) as [Count]
from Tour inner join Tour_Resorts_link 
inner join Resorts 
inner join Types_of_transport 
inner join Price_for_Transport on
Price_for_Transport.ID= Types_of_transport.MoneyID on 
Types_of_transport.ID = Resorts.TransportID on 
Resorts.ID = Tour_Resorts_link.ResortsID on 
Tour_Resorts_link.TourID = Tour.ID
group by Tour.ID
), Hotel_price as (
									Select Tour.ID , sum(Price_for_Hotels.Price) as [Count]
									from Tour inner join Tour_Resorts_link 
									inner join Resorts 
									inner join Hotels_Resorts_link 
									inner join Hotels 
									inner join Time_of_Hotel 
									inner join Price_for_Hotels on
									Price_for_Hotels.ID= Time_of_Hotel.MoneyID on
									Time_of_Hotel.ID = Hotels.TimeID on 
									Hotels.ID = Hotels_Resorts_link.HotelsID on
									Hotels_Resorts_link.ResortsID = Resorts.ID on
									Resorts.ID = Tour_Resorts_link.ResortsID on
									Tour_Resorts_link.TourID= Tour.ID
									group by Tour.ID
									),
Rest_Price as (
				Select Tour.ID , sum(Price_for_Types_of_rest.Price) as [Count]
									from Tour inner join Tour_Resorts_link 
									inner join Resorts 
									inner join Types_of_rest_Resortsl_Link 
									inner join Types_of_rest 
									inner join Time_of_Types_of_rest 
									inner join Price_for_Types_of_rest on
									Price_for_Types_of_rest.ID= Time_of_Types_of_rest.MoneyID on
									Time_of_Types_of_rest.ID = Types_of_rest.TimeID on 
									Types_of_rest.ID = Types_of_rest_Resortsl_Link.Types_of_restID on
									Types_of_rest_Resortsl_Link.ResortsID = Resorts.ID on
									Resorts.ID = Tour_Resorts_link.ResortsID on
									Tour_Resorts_link.TourID= Tour.ID
									group by Tour.ID
				)

select Tour.Name as 'Название тура', (Transport_price.count+Hotel_price.count+Rest_Price.count) as 'Цена тура($)'
from Tour inner join Transport_price inner join Hotel_price inner join Rest_Price on 
Rest_Price.ID=Hotel_price.ID on 
Hotel_price.ID = Transport_price.ID on
Transport_price.ID = Tour.ID

--В каких странах и городах будет проходить тур
Select Tour.Name as 'Тур', Country.Name as'Страна', City.Name as 'Город'
from Tour inner join Tour_Resorts_link 
inner join Resorts 
inner join Country 
inner join Country_City_link
inner join City on 
City.ID = Country_City_link.CityID on
Country.ID = Country_City_link.CountryID on
Country.ID = Resorts.CountryID on
Resorts.ID = Tour_Resorts_link.ResortsID on
Tour_Resorts_link.TourID = Tour.ID

--Какие виды отдыха в каких городах будут
WITH Type_of_Rest as (
Select Types_of_rest_Resortsl_Link.Types_of_restID as [ID], Types_of_rest.Name as [Type],Resorts.id as [ID_Resorts]
from Tour inner join Tour_Resorts_link 
inner join Resorts 
inner join Types_of_rest_Resortsl_Link 
inner join Types_of_rest on
Types_of_rest.ID= Types_of_rest_Resortsl_Link.Types_of_restID on 
Types_of_rest_Resortsl_Link.ResortsID = Resorts.id on 
Resorts.ID = Tour_Resorts_link.ResortsID on 
Tour_Resorts_link.TourID = Tour.ID

)


Select Tour.Name as 'Тур', Country.Name as'Страна', City.Name as 'Город' ,Type_of_Rest.Type as 'Вид отдыха'
from 
Tour 
inner join Tour_Resorts_link 
inner join Type_of_Rest 
inner join Resorts 
inner join Country 
inner join Country_City_link
inner join City on 
City.ID = Country_City_link.CityID on
Country.ID = Country_City_link.CountryID on
Country.ID = Resorts.CountryID on

Resorts.ID = Type_of_Rest.ID_Resorts on
Type_of_Rest.ID_Resorts = Tour_Resorts_link.ResortsID on
Tour_Resorts_link.TourID = Tour.ID 