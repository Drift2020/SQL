--¬ывести самые дорогие продукты из разных фирм

WITH Max_prices AS
(select Firm.id,  max(Price.Price) as max_price
 from Price,Firm,Product
 where Product.FirmID = Firm.ID and
 Price.ProductID=Product.ID
 group by Firm.ID)

Select Product.Name , max(Price.Price)
from Product, Firm,Price,Max_prices
where Product.FirmID = Firm.ID and
		Price.ProductID=Product.ID and
		Max_prices.max_price = Price.Price and
		max_prices.ID = Product.FirmID
group by  Product.Name



