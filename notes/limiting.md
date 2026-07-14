# Limiting Data in SQL

## What is Limiting?

Limiting restricts the number of rows returned by a query. This is useful when you only need a small portion of the results.

The `LIMIT` clause specifies the maximum number of rows to return.

The `OFFSET` clause skips a specified number of rows before returning results.

## Syntax

```sql
SELECT column_name
FROM table_name
LIMIT number;
```

Using OFFSET:

```sql
SELECT column_name
FROM table_name
LIMIT number OFFSET number;
```

## Example Queries

### Display the first 10 tracks

```sql
SELECT *
FROM tracks
LIMIT 10;
```

### Display the five longest tracks

```sql
SELECT Name, Milliseconds
FROM tracks
ORDER BY Milliseconds DESC
LIMIT 5;
```

### Skip the first five customers and return the next five

```sql
SELECT *
FROM customers
LIMIT 5 OFFSET 5;
```

### Display the first three invoices

```sql
SELECT *
FROM invoices
LIMIT 3;
```

## Why use LIMIT?

- Reduces the amount of data returned.
- Improves query performance.
- Useful when previewing tables.
- Often combined with `ORDER BY` to retrieve the top or bottom records.