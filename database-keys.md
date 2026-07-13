# Database Keys in chinook.db

This document summarizes the primary keys, foreign keys, and notable indexes for each table in `chinook.db`.

## albums
- **Primary key:** `AlbumId` (INTEGER)
- **Foreign keys:** `ArtistId` → `artists(ArtistId)`
- **Indexes:** `IFK_AlbumArtistId` on `ArtistId`

## artists
- **Primary key:** `ArtistId` (INTEGER)
- **Foreign keys:** none
- **Indexes:** none

## customers
- **Primary key:** `CustomerId` (INTEGER)
- **Foreign keys:** `SupportRepId` → `employees(EmployeeId)`
- **Indexes:** `IFK_CustomerSupportRepId` on `SupportRepId`

## employees
- **Primary key:** `EmployeeId` (INTEGER)
- **Foreign keys:** `ReportsTo` → `employees(EmployeeId)` (self-referential)
- **Indexes:** `IFK_EmployeeReportsTo` on `ReportsTo`

## genres
- **Primary key:** `GenreId` (INTEGER)
- **Foreign keys:** none
- **Indexes:** none

## invoices
- **Primary key:** `InvoiceId` (INTEGER)
- **Foreign keys:** `CustomerId` → `customers(CustomerId)`
- **Indexes:** `IFK_InvoiceCustomerId` on `CustomerId`

## invoice_items
- **Primary key:** `InvoiceLineId` (INTEGER)
- **Foreign keys:** `TrackId` → `tracks(TrackId)`, `InvoiceId` → `invoices(InvoiceId)`
- **Indexes:** `IFK_InvoiceLineTrackId` on `TrackId`, `IFK_InvoiceLineInvoiceId` on `InvoiceId`

## media_types
- **Primary key:** `MediaTypeId` (INTEGER)
- **Foreign keys:** none
- **Indexes:** none

## playlists
- **Primary key:** `PlaylistId` (INTEGER)
- **Foreign keys:** none
- **Indexes:** none

## playlist_track
- **Primary key:** composite (`PlaylistId`, `TrackId`) — implemented as an implicit primary index `sqlite_autoindex_playlist_track_1`
- **Foreign keys:** `TrackId` → `tracks(TrackId)`, `PlaylistId` → `playlists(PlaylistId)`
- **Indexes:** `IFK_PlaylistTrackTrackId` on `TrackId` (plus the primary composite index)

## tracks
- **Primary key:** `TrackId` (INTEGER)
- **Foreign keys:** `MediaTypeId` → `media_types(MediaTypeId)`, `GenreId` → `genres(GenreId)`, `AlbumId` → `albums(AlbumId)`
- **Indexes:** `IFK_TrackMediaTypeId` on `MediaTypeId`, `IFK_TrackGenreId` on `GenreId`, `IFK_TrackAlbumId` on `AlbumId`

---
Notes:
- Most tables use a single-column integer primary key (`INTEGER` primary keys are typically auto-incremented by SQLite when declared as such).
- Many foreign keys have accompanying indexes named with the `IFK_` prefix; those are helpful for JOIN performance and enforce referential relationships.
- The `playlist_track` table uses a composite primary key (playlist + track) to represent the many-to-many relationship without a separate surrogate id.
