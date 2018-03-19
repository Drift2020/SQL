--Вывести самые дорогие продукты

Select Product.Name , Firm.Name , Price.Price
from Product, Firm,Price
where Product.FirmID = Firm.ID and
		Price.ProductID=Product.ID
group by  Product.Name, Firm.Name , Price.Price
having Price.Price=(select  max(Price.Price) 
					from Price,Firm,Product
					where Product.FirmID = Firm.ID and
					Price.ProductID=Product.ID
					group by Firm.Name
					)


