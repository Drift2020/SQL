--������� ����� ������� ��������

Select Product.Name , Firm.Name 
from Product, Firm,Price
where Product.FirmID = Firm.ID and
		Price.ProductID=Product.ID