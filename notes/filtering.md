# Filtering Data in SQL

- Filtering is sort of like restricting the rows a query returns so you get what you want only

- Done using `WHERE` which sits between `FROM` and `GROUP BY`/`ORDER BY` inside a `SELECT` statement

```sql
SELECT column_list
FROM table_name
WHERE condition
```

- `condition` here is a boolean. Oly rows that evaluate to true are included in the result, those that bring `NULL`/`FALSE` are excluded.

## Query selection order

SQL is declarative, but it helps to know the logical order in which a statement is processed.

1. `FROM` (and `JOIN`)
2. `WHERE` -> filtering happens here, before grouping
3. `GROUP BY`
4. `HAVING`
5. `SELECT`
6. `ORDER BY`
7. `LIMIT`

Because `WHERE` runs before `GROUP BY`, it cannot filter the result of an aggregate function

## Common filtering operators

| Operator | Purpose | Example |
|---|---|---|
| `=`, `!=` / `<>`, `>`, `<`, `>=`, `<=` | Basic comparisons | `WHERE Country = 'Germany'` |
| `AND` | Both conditions must be true | `WHERE GenreId = 1 AND UnitPrice > 0.98` |
| `OR` | Either condition can be true | `WHERE Country = 'Canada' OR Country = 'Brazil'` |
| `NOT` | Negates a condition | `WHERE NOT GenreId = 1` |
| `BETWEEN ... AND ...` | Value falls within an inclusive range | `WHERE Total BETWEEN 5 AND 15` |
| `IN (...)` | Value matches any item in a list | `WHERE GenreId IN (1, 2, 3)` |
| `LIKE` | Pattern matching (`%` = any chars, `_` = single char) | `WHERE Email LIKE '%gmail.com'` |
| `IS NULL` / `IS NOT NULL` | Checks for missing/present values | `WHERE Company IS NULL` |
| `GLOB` | Case-sensitive Unix-style pattern matching (SQLite specific) | `WHERE Name GLOB 'B*'` |

### Note on NULL

- `NULL`  represents unknown/missing data. Cannot be compared using the signs or even `WHERE` as it does not match anything. 
- Instead, use `IS NULL`/`IS NOT NULL`

### Operator precedence

`AND` binds tighter than `OR`. When mixing them use parantheses

```sql
WHERE (Country = 'Canada' OR Country = 'Brazil') AND Company IS NOT NULL;
```

**There is a missing part here - will be filled later on**

## Key takeaways
 
- `WHERE` filters *rows*, before any grouping happens.
- Use `AND`/`OR`/`NOT` to combine multiple conditions, and parentheses to
  control precedence.
- `BETWEEN` and `IN` are shorthand for common range/list comparisons and
  are more readable than chains of `OR`.
- `LIKE` (and SQLite's `GLOB`) are for pattern matching on text.
- Always use `IS NULL` / `IS NOT NULL` to test for missing values — never
  `= NULL`.
## References
 
- [SQLite Where](https://www.sqlitetutorial.net/sqlite-where/)
- [SQLite AND Operator](https://www.sqlitetutorial.net/sqlite-and-operator/)
- [SQLite OR Operator](https://www.sqlitetutorial.net/sqlite-or-operator/)
- [SQLite BETWEEN](https://www.sqlitetutorial.net/sqlite-between/)
- [SQLite IN](https://www.sqlitetutorial.net/sqlite-in/)
- [SQLite LIKE](https://www.sqlitetutorial.net/sqlite-like/)
- [SQLite IS NULL](https://www.sqlitetutorial.net/sqlite-is-null/)
- [SQLite GLOB](https://www.sqlitetutorial.net/sqlite-glob/)