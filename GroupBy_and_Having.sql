-- 1 Zadanie
SELECT Sale_Table.id_product as 'Айди Продукта',Sale_Table.price as 'Стоимость',
(SELECT Product_Table.name
FROM Product_Table WHERE ID = Sale_Table.id_product) as 'Имя Продукта'
FROM Sale_Table
GROUP BY Sale_Table.id_product, Sale_Table.price

-- 2 Zadanie
SELECT Sale_Table.id_product as 'Айди Продукта',Sale_Table.price as 'Стоимость',
(SELECT Product_Table.name
FROM Product_Table WHERE ID = Sale_Table.id_product) as 'Имя Продукта'
FROM Sale_Table
GROUP BY Sale_Table.id_product,Sale_Table.price
HAVING AVG(Sale_Table.price) > 50

-- 3 Zadanie
SELECT Delivery_Table.id_product,
(SELECT Product_Table.name
FROM Product_Table WHERE ID = Delivery_Table.id_product) as 'Name',
Delivery_Table.quantity, Delivery_Table.price
FROM Delivery_Table
GROUP BY Delivery_Table.id_product,Delivery_Table.price,Delivery_Table.quantity
HAVING AVG(Delivery_Table.price) > 100

-- 4 Zadanie
SELECT Product_Table.name, Category_Table.name,Product_Table.price,Product_Table.quantity,(Product_Table.price * Product_Table.quantity) as 'Сумма продажи'
FROM Product_Table
JOIN Category_Table ON Product_Table.id_category = Category_Table.ID
WHERE Category_Table.name IN ('Фрукты','Сладости')
GROUP BY Product_Table.name,Category_Table.name,Product_Table.price,Product_Table.quantity

-- 5 Zadanie
SELECT Product_Table.name, MIN(Delivery_Table.price) AS 'price', Delivery_Table.date_of_delivery AS 'Delivery', Supplier_Table.name
FROM Delivery_Table
JOIN Product_Table ON Delivery_Table.id_product = Product_Table.ID
JOIN Supplier_Table ON Delivery_Table.id_supplier = Supplier_Table.ID
WHERE Delivery_Table.date_of_delivery LIKE '2023-07-%%'
GROUP BY Product_Table.name, Supplier_Table.name, Delivery_Table.date_of_delivery,Delivery_Table.price
ORDER BY Delivery_Table.price ASC

-- 6 Zadanie(Sdelal drygoi diapazon)
SELECT Producer_Table.name, Address_Table.street, City_Table.name,Region_Table.name,Country_Table.name, COUNT(Product_Table.ID) AS 'Product_Count',
SUM(Product_Table.price * Product_Table.quantity) AS Total
FROM Producer_Table
JOIN Product_Table ON Producer_Table.ID = Product_Table.id_producer
JOIN Address_Table ON Producer_Table.id_address = Address_Table.ID
JOIN City_Table ON Address_Table.id_city = City_Table.ID
JOIN Region_Table ON City_Table.id_region = Region_Table.ID
JOIN Country_Table ON Region_Table.id_country = Country_Table.ID
GROUP BY Producer_Table.name,Address_Table.street,City_Table.name,Region_Table.name,Country_Table.name
HAVING Sum(Product_Table.price*Product_Table.quantity) >=1000 AND Sum(Product_Table.price*Product_Table.quantity) <=10000

-- 7 Zadanie
SELECT TOP 1 Category_Table.name,Product_Table.id_category, COUNT(*) AS Num_Product
from Product_Table
JOIN Category_Table ON Product_Table.id_category = Category_Table.ID
GROUP BY Product_Table.id_category,Category_Table.name
ORDER BY Num_Product ASC

-- 8 Zadanie
SELECT Category_Table.name,Product_Table.id_category, COUNT(*) AS Num_Product, (Delivery_Table.price * Delivery_Table.quantity)
from Product_Table
JOIN Delivery_Table ON Product_Table.price = Delivery_Table.price
JOIN Category_Table ON Product_Table.id_category = Category_Table.ID
WHERE (Delivery_Table.price*Delivery_Table.quantity) > 400 AND Product_Table.id_producer IN (2,1,6)
GROUP BY Product_Table.id_category,Category_Table.name,(Delivery_Table.price * Delivery_Table.quantity)
