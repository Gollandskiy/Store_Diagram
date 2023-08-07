-- 1 Zadanie(Sdelal top 3 po prodazham)
SELECT TOP 3 name,(SELECT MAX(Sale_Table.quantity)
FROM Sale_Table
WHERE id_product = Product_Table.ID) as MQ
FROM Product_Table
GROUP BY name,Product_Table.ID
ORDER BY MQ DESC

-- 2 Zadanie
SELECT id_product,
		(SELECT Product_Table.name
		FROM Product_Table
		WHERE Sale_Table.id_product = Product_Table.ID) AS Produkt,
			 (SELECT name 
			 FROM Category_Table
			 WHERE ID = (SELECT id_category
			 FROM Product_Table 
			 WHERE ID = Sale_Table.id_product)) AS Category,
FORMAT((COUNT(*) * 100.0/(SELECT COUNT(*) FROM Sale_Table)),'0.00') AS '%'
FROM Sale_Table
GROUP BY id_product

-- 3 Zadanie(Sdelal moloko a ne yogurt)
SELECT name,id_producer,
		(SELECT Producer_Table.name
		FROM Producer_Table
		WHERE Product_Table.id_producer = Producer_Table.ID) as Producer
FROM Product_Table
Where name NOT LIKE 'Молоко'

-- 4 Zadanie(Izmenil firmy na 'Leon Proizvod'
SELECT name,(SELECT Address_Table.ID
			FROM Address_Table
			Where Producer_Table.id_address = Address_Table.ID AND Address_Table.ID = 10)
FROM Producer_Table

-- 5 Zadanie
SELECT Producer_Table.ID, Producer_Table.name
FROM Producer_Table
JOIN Product_Table ON Producer_Table.ID = Product_Table.id_producer
GROUP BY Producer_Table.ID, Producer_Table.name
HAVING COUNT(Product_Table.ID)>(SELECT COUNT(*)
								FROM Product_Table
								WHERE Producer_Table.ID = 1)


-- 6 Zadanie
SELECT CONVERT(DATE, date_of_sale) AS [Day],
       SUM(quantity) AS total_sales
FROM Sale_Table
WHERE date_of_sale >= '2023-01-01' AND date_of_sale <= GETDATE()
GROUP BY CONVERT(DATE, date_of_sale)
ORDER BY [Day] DESC;

