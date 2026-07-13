# Ordering Data in SQL

## What is Ordering?

Ordering is the process of sorting the results of a query into a specific sequence. SQL uses the `ORDER BY` clause to sort records in either ascending (`ASC`) or descending (`DESC`) order.

- `ASC` sorts data from lowest to highest or A to Z (default).
- `DESC` sorts data from highest to lowest or Z to A.

## Syntax

```sql
SELECT column_name
FROM table_name
ORDER BY column_name ASC;
```

or

```sql
SELECT column_name
FROM table_name
ORDER BY column_name DESC;
```

## Example Queries

### Sort artists alphabetically

```sql
SELECT Name
FROM artists
ORDER BY Name ASC;
```

### Sort albums in reverse alphabetical order

```sql
SELECT Title
FROM albums
ORDER BY Title DESC;
```

### Sort tracks by duration

```sql
SELECT Name, Milliseconds
FROM tracks
ORDER BY Milliseconds DESC;
```

### Sort customers by surname then first name

```sql
SELECT FirstName, LastName
FROM customers
ORDER BY LastName ASC, FirstName ASC;
```

## Why use ORDER BY?

- Makes query results easier to read.
- Helps identify highest or lowest values.
- Useful when generating reports.
- Often combined with `LIMIT` to retrieve top or bottom records.