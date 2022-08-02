SELECT * FROM SalesPeople;

SELECT Snum, City, Comm 
FROM SalesPeople; 

SELECT DISTINCT Snum
FROM Orders;

SELECT Snum, Comm FROM SalesPeople
WHERE City = "London";

SELECT Cname FROM Customers
WHERE Rating = 100;

SELECT Onum, AMT, Odate
FROM Orders;

SELECT Cname FROM Customers 
WHERE City = 'San Jose' AND Rating > 200;

SELECT Onum, AMT, Odate FROM Orders
WHERE AMT > 1000
GROUP BY Odate;

SELECT Sname, City FROM SalesPeople
WHERE City = 'London' AND Comm > 0.10;

SELECT Cname FROM Customers
WHERE City = 'Rome' AND Rating >= 100;

SELECT Sname, City FROM SalesPeople
WHERE City IN ('Barcelona','London');

SELECT Sname, Comm FROM SalesPeople
WHERE Comm
BETWEEN 0.10 AND 0.12;

SELECT Cname FROM Customers
WHERE City IS NULL;

SELECT Onum, Odate, AMT FROM Orders
WHERE Odate  In ('1994-10-03','1994-10-04');

SELECT Cname FROM Customers
WHERE Cname LIKE 'A%' OR Cname LIKE 'B%';

SELECT Onum AMT, Odate FROM Orders
WHERE NOT AMT = 0 OR NOT AMT IS NULL;

SELECT Onum, AMT, Odate FROM Orders
WHERE AMT != 0 OR AMT IS NOT NULL;

SELECT COUNT(DISTINCT Snum)FROM Orders;

SELECT MAX(AMT), Snum, Odate FROM ORDERS
GROUP BY Odate, Snum;

SELECT MAX(AMT), Snum, Odate FROM Orders
WHERE AMT > 3000
GROUP BY Odate, Snum;

SELECT Odate, AMT FROM Orders
WHERE AMT = (SELECT MAX(AMT) FROM Orders)
GROUP BY Odate;

SELECT COUNT(Onum) FROM Orders
WHERE Odate = '1994-10-03';

SELECT COUNT(DISTINCT City) FROM Customers;

SELECT MIN(AMT), Cnum, Odate FROM Orders
GROUP BY Cnum;

SELECT Cname FROM Customers
WHERE Cname LIKE 'G%'
LIMIT 1;

SELECT 'For the city ('||City||') the highest rating is :('||MAX(Rating)||')' FROM Customers
GROUP  BY City;

SELECT COUNT(AMT),Odate FROM Orders
GROUP BY Odate
ORDER BY COUNT(AMT) DESC;

SELECT s.Sname, c.Cname, s.City
FROM SalesPeople as s, Customers as c
WHERE s.City = c.City;

SELECT c.Cname, s.Sname 
FROM SalesPeople as s
INNER JOIN Customers as c
ON s.Snum = c.Snum;

SELECT o.Onum, c.Cname 
FROM Customers as c, Orders as o
WHERE o.Cnum = c.Cnum;

SELECT o.Onum, s.Sname, c.Cname
FROM Orders as o, Customers as c, SalesPeople as s
WHERE o.Cnum = c. Cnum AND o.Snum = s.Snum;

SELECT Cname, Sname FROM Customers, SalesPeople
WHERE Customers.Snum = SalesPeople.Snum AND Comm > 0.12;

SELECT Onum, Snum, AMT*0.12
FROM Orders
GROUP BY Snum;

SELECT A.Cname, B.Cname, A.Rating 
FROM Customers A, Customers B
WHERE A.Rating = B.Rating AND A.Cnum != B.Cnum;

SELECT A.Cname, B.Cname, A.Snum
FROM Customers A, Customers B
WHERE A.Snum = b.Snum;

SELECT A.Sname, B.Sname, A.City
FROM SalesPeople A, SalesPeople B
WHERE A.City = B.City AND A.Snum > B.Snum;

SELECT Cname, City FROM Customers
WHERE Rating = (SELECT Rating FROM Customers WHERE Cname = 'Hoffman');

SELECT Onum, Odate FROM Orders
WHERE Snum IN (SELECT Snum FROM SalesPeople WHERE Sname = 'Motika')
GROUP BY Odate;

SELECT Onum, Odate, AMT FROM Orders
WHERE AMT > (SELECT AVG(AMT) FROM Orders
WHERE Odate = '1994-10-04');

SELECT AVG(Comm), Sname FROM SalesPeople
WHERE City = 'London';

SELECT o.Onum, c.Cname, s.Sname, c.City, s.City FROM Orders as o, SalesPeople as s, Customers as c
WHERE o.Cnum = c.Cnum AND o.Snum = s.Snum AND (s.City = 'London' AND c.City = 'London');

SELECT s.Comm, c.Cname, s.Sname
FROM SalesPeople as s, Customers as c
WHERE s.Snum IN (SELECT Snum FROM Customers WHERE City = 'London');

SELECT Cname FROM Customers
WHERE Cnum > (SELECT Snum FROM SalesPeople WHERE Sname = 'Serres');

SELECT COUNT(Cname) FROM Customers
WHERE Rating > (SELECT AVG(Rating) FROM Customers WHERE City = 'San Jose');

SELECT Onum FROM Orders
WHERE Snum IN (SELECT Snum FROM Customers WHERE Cname = 'Hoffman');

SELECT s.Comm*o.AMT, s.Sname FROM SalesPeople as s, Orders as o
WHERE s.Snum IN (SELECT Snum FROM Customers WHERE Rating > 100);

SELECT Cname FROM Customers
WHERE City IN (SELECT s.City, c.City FROM SalesPeople as s, Customers as c 
WHERE s.Sname = 'Serres' AND c.Snum = s.Snum);

SELECT Cname, Sname FROM SalesPeople, Customers
WHERE Sname = (SELECT Sname FROM SalesPeople WHERE rownum <= 3)
ORDER BY Cname; 
SELECT Snum, Cnum FROM Orders
WHERE Cnum IN (SELECT Cnum FROM Customers WHERE City = 'London');

SELECT Onum, Sname, Cname, AMT FROM Orders a, SalesPeople b, Customers c 
WHERE a.Snum = b.Snum AND a.Cnum = c.Cnum AND a.Snum = (SELECT Snum FROM Orders WHERE Cnum = (SELECT Cnum FROM Customers WHERE Cname = 'Hoffman')); 