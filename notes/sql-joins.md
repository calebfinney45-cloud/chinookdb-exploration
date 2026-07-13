# SQL Joins

SQL joins are used to combine data from two or more tables using a related column.

## Types of SQL Joins

### 1. INNER JOIN

An `INNER JOIN` only returns rows where there is a match in both tables. I used this join to connect tracks with the albums they belong to.

```sql
SELECT t.Name AS Track, al.Title AS Album
FROM tracks t
INNER JOIN albums al
ON t.AlbumId = al.AlbumId;
```

---

### 2. LEFT JOIN

A `LEFT JOIN` returns all the rows from the left table and only the matching rows from the right table. If there isn't a match, SQL shows `NULL`.

The example below finds customers who have never made a purchase.

```sql
SELECT c.CustomerId,
       c.FirstName,
       c.LastName,
       i.InvoiceId
FROM customers c
LEFT JOIN invoices i
ON c.CustomerId = i.CustomerId
WHERE i.InvoiceId IS NULL;
```

---

### 3. RIGHT JOIN

A `RIGHT JOIN` returns all the rows from the right table and the matching rows from the left table.

> **Note:** Some versions of SQLite don't support `RIGHT JOIN`. If that happens, you can swap the tables and use a `LEFT JOIN` instead.

```sql
SELECT al.Title,
       ar.Name AS Artist
FROM albums al
RIGHT JOIN artists ar
ON al.ArtistId = ar.ArtistId;
```

---

### 4. FULL OUTER JOIN

A `FULL OUTER JOIN` returns all the rows from both tables. If there isn't a match, the missing values are shown as `NULL`.

```sql
SELECT c.CustomerId,
       i.InvoiceId
FROM customers c
FULL OUTER JOIN invoices i
ON c.CustomerId = i.CustomerId;
```

---

### 5. CROSS JOIN

A `CROSS JOIN` combines every row from one table with every row from another table. This creates every possible combination.

```sql
SELECT mt.Name AS MediaType,
       g.Name AS Genre
FROM media_types mt
CROSS JOIN genres g;
```

---

### 6. SELF JOIN

A `SELF JOIN` is when a table is joined with itself. In the Chinook database, I used it to see which employee reports to which manager.

```sql
SELECT e.FirstName || ' ' || e.LastName AS Employee,
       m.FirstName || ' ' || m.LastName AS Manager
FROM employees e
LEFT JOIN employees m
ON e.ReportsTo = m.EmployeeId;
```

---

## Example of Joining Multiple Tables

This query joins four tables to show the customer's name, the track they bought, and the invoice date.

```sql
SELECT c.FirstName,
       c.LastName,
       t.Name AS Track,
       i.InvoiceDate
FROM customers c
JOIN invoices i
ON c.CustomerId = i.CustomerId
JOIN invoice_items ii
ON i.InvoiceId = ii.InvoiceId
JOIN tracks t
ON ii.TrackId = t.TrackId
ORDER BY i.InvoiceDate DESC
LIMIT 20;
```

---

## Summary

| Join Type         | What it Does                                                                 |
| ----------------- | ---------------------------------------------------------------------------- |
| `INNER JOIN`      | Returns only the matching rows from both tables.                             |
| `LEFT JOIN`       | Returns all rows from the left table and matching rows from the right table. |
| `RIGHT JOIN`      | Returns all rows from the right table and matching rows from the left table. |
| `FULL OUTER JOIN` | Returns all rows from both tables.                                           |
| `CROSS JOIN`      | Returns every possible combination of rows.                                  |
| `SELF JOIN`       | Joins a table to itself.                                                     |

## What I Learned

After practicing SQL joins, I understand why databases use multiple tables rather than storing everything in one dile making it easier to use this data. I also learned that each type of join is used for a different purpose depending on the results I want to get.

## References

- W3Schools - SQL Joins: https://www.w3schools.com/sql/sql_join.asp
- W3Schools - SQL INNER JOIN: https://www.w3schools.com/sql/sql_join_inner.asp
- W3Schools - SQL LEFT JOIN: https://www.w3schools.com/sql/sql_join_left.asp
- W3Schools - SQL RIGHT JOIN: https://www.w3schools.com/sql/sql_join_right.asp
- W3Schools - SQL FULL OUTER JOIN: https://www.w3schools.com/sql/sql_join_full.asp
- W3Schools - SQL CROSS JOIN: https://www.w3schools.com/sql/sql_join_cross.asp
