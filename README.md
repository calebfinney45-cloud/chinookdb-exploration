# chinookdb-exploration

Group discussion notes and SQL practice built around the [Chinook sample
database](https://www.sqlitetutorial.net/sqlite-sample-database/).

## Getting the real Chinook database

1. Go to <https://www.sqlitetutorial.net/sqlite-sample-database/>.
2. Download `chinook.zip` and extract it — you'll get `chinook.db`.
3. Reference diagram: [Chinook ER diagram (color)](https://www.sqlitetutorial.net/wp-content/uploads/2015/11/sqlite-sample-database-color.jpg).
4. Open it with `sqlite3 chinook.db`, or point any of the queries in this
   repo at it (e.g. with the SQLite Python module, DB Browser for SQLite,
   or the `sqlite3` CLI).

> Note: `db/chinook.db` in this repo is a small, hand-built database that
> mirrors the real Chinook schema (same 11 tables, same relationships,
> same column names) with a lighter sample dataset, used only so every
> query below could be written and test-run. Swap in the real
> `chinook.db` from the link above to run these same queries against the
> full dataset.

## Chinook schema at a glance

11 tables, 4 broad groups:

- **Music catalog**: `artists` → `albums` → `tracks`, plus lookup tables
  `genres` and `media_types`.
- **Playlists**: `playlists` and `tracks`, linked many-to-many through
  the `playlist_track` junction table.
- **Sales**: `customers` → `invoices` → `invoice_items` → `tracks`.
- **Staff**: `employees`, self-referencing via `ReportsTo`, linked to
  `customers` via `SupportRepId`.

See [`notes/database-keys.md`](notes/database-keys.md) for the full
table-by-table key breakdown.

## Repo structure

```
chinookdb-exploration/
├── README.md
├── db/
│   └── chinook.db            # sample database used to test the queries below
├── notes/
│   ├── filtering.md           # WHERE, AND/OR, BETWEEN, IN, LIKE, IS NULL
│   ├── ordering.md             # ORDER BY
│   ├── limiting.md             # LIMIT / OFFSET
│   ├── grouping.md             # GROUP BY / HAVING
│   ├── database-keys.md        # primary/foreign/composite/surrogate keys, mapped to Chinook
│   └── sql-joins.md            # INNER/LEFT/RIGHT/FULL/CROSS/self joins
└── sql/
    ├── filtering.sql
    ├── ordering.sql
    ├── limiting.sql
    ├── grouping.sql
    └── joins.sql
```

## Discussion topics covered

| Topic | Notes | Queries |
|---|---|---|
| Filtering | [notes/filtering.md](notes/filtering.md) | [sql/filtering.sql](sql/filtering.sql) |
| Ordering | [notes/ordering.md](notes/ordering.md) | [sql/ordering.sql](sql/ordering.sql) |
| Limiting | [notes/limiting.md](notes/limiting.md) | [sql/limiting.sql](sql/limiting.sql) |
| Grouping | [notes/grouping.md](notes/grouping.md) | [sql/grouping.sql](sql/grouping.sql) |
| Database keys | [notes/database-keys.md](notes/database-keys.md) | — (conceptual) |
| SQL joins | [notes/sql-joins.md](notes/sql-joins.md) | [sql/joins.sql](sql/joins.sql) |

## Publishing this to GitHub

```bash
cd chinookdb-exploration
git init
git add .
git commit -m "Initial notes and queries for Chinook DB exploration"
git branch -M main
git remote add origin https://github.com/<your-username>/chinookdb-exploration.git
git push -u origin main
```