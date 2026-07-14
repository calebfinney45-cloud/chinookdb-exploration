SELECT Name
FROM artists
ORDER BY Name ASC;

SELECT Title
FROM albums
ORDER BY Title DESC;

SELECT Name, Milliseconds
FROM tracks
ORDER BY Milliseconds DESC;

SELECT FirstName, LastName
FROM customers
ORDER BY LastName ASC, FirstName ASC;
SELECT InvoiceId, CustomerId, Total
FROM invoices
ORDER BY Total DESC;