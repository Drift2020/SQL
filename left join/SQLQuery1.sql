1) �������� �������� ������� � �� ��������������, �� � � ��� ����� ��� ��������������, � ������� ��� �������
select producer.name as [�����] , Product.name as [�����������]
from  producer left join product  on Producer.id = Product.id_producer


2) �������� ������ �� ���������, � ������� �� ��������� �� ���� �����

select distinct (Category.name) as [��� �������]
from   Category left join product   on  product.id_category = Category.id 
where product.id is null

3) �������� �������� �������, ���� �� �������� � �����������, � ��� ����� ��� �����������, ������� ������ �� ������ ���������
select Product.name , Delivery.date_of_delivery,Producer.name
from Producer left join Product left join Delivery on Product.id = Delivery.id_product  on  Producer.id = Product.id_producer 







4) �������� ������� / �����, � ������� ��� �� ������ �������������---------
select Region.name
from [Producer] right join [Address] right join city right join  Region 
on City.id_region = Region.id on [Address].id_city = City.id 
on [Producer].id_address = [Address].id

where  [Address].id is null



