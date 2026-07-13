# Database Keys in the Chinook Database

## Introduction
Database keys are attributes used to uniquely identify records in a database and establish relationships between tables. They help maintain data integrity and improve data retrieval.

# Types of Database Keys

## Primary Key (PK)
A primary key uniquely identifies each record in a table. Primary keys cannot contain duplicate or NULL values.

Examples from Chinook:

Table : Primary Key
artists : ArtistId
albums : AlbumId
customers : CustomerId
employees : EmployeeId
genres : GenreId
invoices : InvoiceId
invoice_items : InvoiceLineId
media_types : MediaTypeId
playlists : PlaylistId
tracks : TrackId

## Foreign Key (FK)
A foreign key is a column that references the primary key of another table, creating relationships between tables.

Examples:

Table : Foreign Key : Table referenced
albums : ArtistId : artists
customers : SupportRepId : employees
employees : ReportsTo : employees
invoices : CustomerId : customers
invoice_items : InvoiceId : invoices
invoice_items : TrackId : tracks
tracks : AlbumId : albums
tracks : GenreId : genres
tracks : MediaTypeId : media_types
playlist_track : PlaylistId : playlists
playlist_track : TrackId : tracks

## Composite Key
A composite key consists of two or more columns that together uniquely identify a record.

Example:

The `playlist_track` table uses:

- PlaylistId
- TrackId

Together they form the composite primary key.

## Candidate Key
A candidate key is any column that could uniquely identify a row.

Examples include:

- ArtistId
- AlbumId
- CustomerId
- EmployeeId
- InvoiceId
- TrackId

Each of these is selected as the primary key of its respective table.

## Alternate Key
An alternate key is a candidate key that is not chosen as the primary key.

The Chinook database does not explicitly define alternate keys.

## Unique Key
A unique key ensures that all values in a column are unique.

The Chinook database does not explicitly define separate unique keys other than the primary keys.

# Conclusion
The Chinook database mainly uses primary keys and foreign keys to uniquely identify records and maintain relationships between tables. It also demonstrates the use of a composite key in the `playlist_track` table.

# References
1. SQLite Documentation. https://www.sqlite.org/lang_createtable.html
2. W3Schools. SQL Keys. https://www.w3schools.com/sql/sql_primarykey.asp
3. Chinook Database GitHub Repository. https://github.com/lerocha/chinook-database
