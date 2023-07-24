SELECT name, id_category, id_producer
FROM Store_Diagram.dbo.Product_Table
WHERE id_producer = 5 OR id_producer = 4
---1. Çàäàíèå

SELECT Product_Table.name, id_producer,id_markup
FROM Store_Diagram.dbo.Product_Table
JOIN Producer_Table AS P1 ON Product_Table.id_producer = P1.ID
WHERE P1.name NOT LIKE '%A%' 
  AND P1.name NOT LIKE '%K%'
  AND P1.name NOT LIKE '%M%'
  SELECT *
  FROM Producer_Table
  ---2. Çàäàíèå

  SELECT Product_Table.name, id_category ,id_producer, C2.name, M2.[percent], D1.date_of_delivery
  FROM Product_Table
  JOIN Producer_Table AS P1 ON Product_Table.id_producer = P1.ID
  JOIN Address_Table AS A1 ON P1.id_address = A1.ID
  JOIN City_Table AS C1 ON A1.id_city = C1.ID
  JOIN Region_Table AS R1 ON C1.id_region = R1.ID
  JOIN Country_Table AS C2 ON R1.id_country = C2.ID
  JOIN Markup_Table as M2 ON Product_Table.id_markup = M2.ID
  JOIN Delivery_Table AS D1 ON Product_Table.ID = D1.id_product
  WHERE C2.name NOT LIKE 'Óêðàèíà' and C2.name NOT LIKE 'Ìîëäîâà' and C2.name NOT LIKE 'Ïîëüøà' AND m2.[percent] <= 50 AND date_of_delivery > '2023-05-10'
  ---3. Çàäàíèå

  SELECT Sale_Table.id_product, Sale_Table.quantity
  FROM Sale_Table
  JOIN Product_Table AS P2 ON Sale_Table.id_product = P2.ID
  JOIN Producer_Table AS P3 ON P2.id_producer = P3.ID
  JOIN Markup_Table AS M1 ON P2.id_markup = M1.ID
  WHERE P2.id_category IN (3,5) AND Sale_Table.quantity > 100
  --- 4. Çàäàíèå

  SELECT Product_Table.name AS 'Òîâàð', Supplier_Table.name AS 'Ïîñòàâùèê',Category_Table.name AS 'Êàòåãîðèÿ',Delivery_Table.date_of_delivery AS 'Äàòà ïîñòàâêè', Delivery_Table.price*Delivery_Table.quantity AS 'Îáùàÿ ñòîèìîñòü'
  FROM Delivery_Table
  JOIN Product_Table ON Delivery_Table.id_product = Product_Table.ID
  JOIN Supplier_Table ON Delivery_Table.id_supplier = Supplier_Table.ID
  JOIN Category_Table ON Product_Table.id_category = Category_Table.ID
  WHERE Supplier_Table.name = 'Sup_God' OR Supplier_Table.name = 'Good_Sup' OR Supplier_Table.name = 'Sup_Pro'
  ORDER BY Product_Table.name
  ---5 Çàäàíèå
  
  SELECT DISTINCT Product_Table.name AS 'ÒÎÂÀÐ',Producer_Table.name AS 'ÏÐÎÈÇÂÎÄÈÒÅËÜ', Address_Table.street AS 'ÀÄÐÅÑ', City_Table.name AS 'ÃÎÐÎÄ', Region_Table.name AS 'ÎÁËÀÑÒÜ', Country_Table.name AS 'ÑÒÐÀÍÀ',
  Category_Table.name AS 'ÊÀÒÅÃÎÐÈß', Sale_Table.date_of_sale AS 'ÄÀÒÀ ÏÐÎÄÀÆÈ', Sale_Table.price* Sale_Table.quantity AS 'ÎÁÙÀß ÑÒÎÈÌÎÑÒÜ'
  FROM Product_Table
  JOIN Delivery_Table ON Product_Table.ID = Delivery_Table.id_product
  JOIN Producer_Table ON Product_Table.id_producer = Producer_Table.ID
  JOIN Address_Table ON Producer_Table.id_address = Address_Table.ID
  JOIN City_Table ON Address_Table.id_city = City_Table.ID
  JOIN Region_Table ON City_Table.id_region = Region_Table.ID
  JOIN Country_Table ON Region_Table.id_country = Country_Table.ID
  JOIN Category_Table ON Product_Table.id_category = Category_Table.ID
  JOIN Sale_Table ON Product_Table.ID = Sale_Table.id_product
  ORDER BY Sale_Table.price*Sale_Table.quantity ASC
  ---6. Çàäàíèå


