-- =====================================================================
-- filtering.sql
-- Demonstrates filtering rows in the Chinook database using WHERE
-- and its related operators: AND, OR, BETWEEN, IN, LIKE, IS NULL/NOT NULL
-- =====================================================================

-- 1. Basic filtering with a single condition
-- Find every customer based in Germany
SELECT CustomerId, FirstName, LastName, Country
FROM customers
WHERE Country = 'Germany';
"""
-- 2. Filtering with comparison operators
-- Find tracks longer than 5 minutes (300,000 ms)
SELECT TrackId, Name, Milliseconds
FROM tracks
WHERE Milliseconds > 300000;

-- 3. Combining conditions with AND
-- Find tracks that belong to GenreId 1 (Rock) AND cost more than 0.98
SELECT TrackId, Name, GenreId, UnitPrice
FROM tracks
WHERE GenreId = 1 AND UnitPrice > 0.98;

-- 4. Combining conditions with OR
-- Find customers based in Canada OR Brazil
SELECT CustomerId, FirstName, LastName, Country
FROM customers
WHERE Country = 'Canada' OR Country = 'Brazil';

-- 5. Filtering a range of values with BETWEEN
-- Find invoices with a total between $5 and $15
SELECT InvoiceId, CustomerId, Total
FROM invoices
WHERE Total BETWEEN 5 AND 15;

-- 6. Filtering against a list of values with IN
-- Find tracks that belong to the Rock, Jazz or Metal genres (GenreId 1, 2, 3)
SELECT TrackId, Name, GenreId
FROM tracks
WHERE GenreId IN (1, 2, 3);

-- 7. Pattern matching with LIKE
-- Find every customer whose email address is a gmail account
SELECT CustomerId, FirstName, LastName, Email
FROM customers
WHERE Email LIKE '%gmail.com';

-- Find every track whose name starts with the letter "B"
SELECT TrackId, Name
FROM tracks
WHERE Name LIKE 'B%';

-- 8. Filtering NULL / NOT NULL values
-- Find customers who did NOT provide a company name
SELECT CustomerId, FirstName, LastName, Company
FROM customers
WHERE Company IS NULL;

-- Find customers who DID provide a company name
SELECT CustomerId, FirstName, LastName, Company
FROM customers
WHERE Company IS NOT NULL;

-- 9. Negating a condition with NOT
-- Find all tracks that are NOT in the Rock genre
SELECT TrackId, Name, GenreId
FROM tracks
WHERE NOT GenreId = 1;

-- 10. Combining several filtering techniques together
SELECT CustomerId, FirstName, LastName, Country, Company, Email
FROM customers
WHERE Country IN ('Germany', 'Austria', 'Belgium', 'Denmark', 'Czech Republic')
  AND Company IS NULL
  AND Email NOT LIKE '%gmail.com';
  """