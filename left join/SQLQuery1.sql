1) показать названия товаров и их производителей, но и в том числе тех производителей, у которых нет товаров
select producer.name as [дилер] , Product.name as [Контрабанда]
from  producer left join product  on Producer.id = Product.id_producer


2) показать только те категории, к которым не относится ни один товар

select distinct (Category.name) as [вид порошка]
from   Category left join product   on  product.id_category = Category.id 
where product.id is null

3) показать названия товаров, даты их поставки и поставщиков, в том числе тех поставщиков, которые ничего не успели поставить
select Product.name , Delivery.date_of_delivery,Producer.name
from Producer left join Product left join Delivery on Product.id = Delivery.id_product  on  Producer.id = Product.id_producer 







4) показать области / штаты, в которых нет ни одного производителя---------
select Region.name
from [Producer] right join [Address] right join city right join  Region 
on City.id_region = Region.id on [Address].id_city = City.id 
on [Producer].id_address = [Address].id

where  [Address].id is null



