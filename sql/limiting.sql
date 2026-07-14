SELECT *
FROM tracks
LIMIT 10;

SELECT Name, Milliseconds
FROM tracks
ORDER BY Milliseconds DESC
LIMIT 5;

SELECT *
FROM customers
LIMIT 5 OFFSET 5;
SELECT *
FROM invoices
LIMIT 3;

SELECT Name, UnitPrice
FROM tracks
ORDER BY UnitPrice DESC
LIMIT 10;