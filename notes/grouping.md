# Grouping Data in SQL (Chinook Database)

## What is grouping?

`GROUP BY` collapses multiple rows that share the same value(s) in one or
more columns into a single summary row per group, so you can run
aggregate functions (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, ...) over each
group instead of the whole table.

```sql
SELECT grouping_column, AGGREGATE_FUNCTION(other_column)
FROM table_name
GROUP BY grouping_column;
```

Every non-aggregated column in the `SELECT` list must appear in the
`GROUP BY` clause — otherwise the database wouldn't know which row's
value to display for that group.

## Aggregate functions commonly used with GROUP BY

| Function | Purpose |
|---|---|
| `COUNT(*)` / `COUNT(column)` | Number of rows / non-null values per group |
| `SUM(column)` | Total of a numeric column per group |
| `AVG(column)` | Average of a numeric column per group |
| `MIN(column)` / `MAX(column)` | Smallest / largest value per group |

## HAVING — filtering groups

`WHERE` filters individual rows *before* grouping happens. `HAVING`
filters *groups*, after aggregation. This means `HAVING` can reference
aggregate functions, but `WHERE` cannot.

```sql
SELECT grouping_column, COUNT(*) AS cnt
FROM table_name
WHERE row_level_condition        -- filters rows first
GROUP BY grouping_column
HAVING COUNT(*) > 5;             -- then filters the resulting groups
```

| | Runs when | Can reference aggregates? |
|---|---|---|
| `WHERE` | Before grouping | No |
| `HAVING` | After grouping | Yes |

## Example queries

See [`sql/grouping.sql`](../sql/grouping.sql) for the full set. Highlights:

**Number of tracks per genre**
```sql
SELECT g.Name AS genre, COUNT(t.TrackId) AS track_count
FROM tracks t
JOIN genres g ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY track_count DESC;
```

**Total spend, invoice count, and average invoice per customer**
```sql
SELECT CustomerId,
       COUNT(InvoiceId) AS invoice_count,
       SUM(Total) AS total_spent,
       ROUND(AVG(Total), 2) AS avg_invoice
FROM invoices
GROUP BY CustomerId;
```

**Customers who have spent more than $10 in total**
```sql
SELECT c.CustomerId, c.FirstName, c.LastName, SUM(i.Total) AS total_spent
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
HAVING SUM(i.Total) > 10
ORDER BY total_spent DESC;
```

## Key takeaways

- `GROUP BY` turns "rows" into "groups" so aggregate functions can
  summarize each group.
- Any column in `SELECT` that isn't wrapped in an aggregate function must
  be part of `GROUP BY`.
- Use `WHERE` to filter rows before grouping and `HAVING` to filter the
  resulting groups — they are not interchangeable.
- `GROUP BY` is frequently combined with `JOIN` so you can group by a
  human-readable name (like a genre or artist) instead of a raw id.

## References

- [SQLite Group By](https://www.sqlitetutorial.net/sqlite-group-by/)
- [SQLite Having](https://www.sqlitetutorial.net/sqlite-having/)
- [SQLite COUNT](https://www.sqlitetutorial.net/sqlite-count-function/)
- [SQLite AVG](https://www.sqlitetutorial.net/sqlite-avg/)
- [SQLite SUM](https://www.sqlitetutorial.net/sqlite-sum/)