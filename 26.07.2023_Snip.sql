-- 1 Zadanie
SELECT Product_Table.name, Producer_Table.name
FROM Product_Table
FULL OUTER JOIN Producer_Table ON Product_Table.id_producer = Producer_Table.ID

-- 2 Zadanie
SELECT Product_Table.name,Delivery_Table.date_of_delivery,Delivery_Table.id_supplier
FROM Product_Table
FULL OUTER JOIN Delivery_Table ON Product_Table.ID = Delivery_Table.id_product

-- 3 Zadanie(vibral firmy 'ValDoYA_Prod'
SELECT Category_Table.name, Producer_Table.name
FROM Product_Table
JOIN Category_Table ON Product_Table.id_category = Category_Table.ID
JOIN Producer_Table ON Product_Table.id_producer = Producer_Table.ID

EXCEPT 

SELECT Category_Table.name, Producer_Table.name
FROM Product_Table
JOIN Category_Table ON Product_Table.id_category = Category_Table.ID
JOIN Producer_Table ON Product_Table.id_producer = Producer_Table.ID
WHERE Product_Table.id_producer = 6

-- 4 Zadanie
SELECT Producer_Table.name, Category_Table.name
FROM Product_Table
JOIN Producer_Table ON Product_Table.id_producer = Producer_Table.ID
JOIN Category_Table ON Product_Table.id_category = Category_Table.ID

 EXCEPT 

SELECT Producer_Table.name, Category_Table.name
FROM Product_Table
JOIN Producer_Table ON Product_Table.id_producer = Producer_Table.ID
JOIN Category_Table ON Product_Table.id_category = Category_Table.ID
WHERE Product_Table.id_category = 2






