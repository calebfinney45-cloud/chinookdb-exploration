-- joins.sql
-- Practice using different SQL joins

-- INNER JOIN: tracks and their albums
SELECT tracks.Name,
       albums.Title
FROM tracks
INNER JOIN albums
ON tracks.AlbumId = albums.AlbumId;

-- LEFT JOIN: customers without invoices
SELECT customers.CustomerId,
       customers.FirstName,
       customers.LastName,
       invoices.InvoiceId
FROM customers
LEFT JOIN invoices
ON customers.CustomerId = invoices.CustomerId
WHERE invoices.InvoiceId IS NULL;

-- RIGHT JOIN: artists and their albums
-- Requires SQLite 3.39 or later
SELECT albums.Title,
       artists.Name
FROM albums
RIGHT JOIN artists
ON albums.ArtistId = artists.ArtistId;

-- FULL OUTER JOIN: customers and invoices
SELECT customers.CustomerId,
       invoices.InvoiceId
FROM customers
FULL OUTER JOIN invoices
ON customers.CustomerId = invoices.CustomerId;

-- CROSS JOIN: every media type with every genre
SELECT media_types.Name,
       genres.Name
FROM media_types
CROSS JOIN genres;

-- SELF JOIN: employees and their managers
SELECT employees.FirstName || ' ' || employees.LastName,
       managers.FirstName || ' ' || managers.LastName
FROM employees
LEFT JOIN employees AS managers
ON employees.ReportsTo = managers.EmployeeId;

-- Join multiple tables
SELECT customers.FirstName,
       customers.LastName,
       tracks.Name,
       invoices.InvoiceDate
FROM customers
JOIN invoices
ON customers.CustomerId = invoices.CustomerId
JOIN invoice_items
ON invoices.InvoiceId = invoice_items.InvoiceId
JOIN tracks
ON invoice_items.TrackId = tracks.TrackId
ORDER BY invoices.InvoiceDate DESC
LIMIT 20;