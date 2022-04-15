/*
Query 1 (Most tracks for artists in the Jazz Genre)
*/
SELECT a.Name, count(*) No_of_Tracks
FROM Track t
JOIN Album
ON album.AlbumId=t.AlbumId
JOIN Artist a
ON a.ArtistId=album.ArtistId
JOIN Genre g
ON t.GenreId=g.GenreId
WHERE g.Name="Jazz"
GROUP BY 1
ORDER BY 2 DESC


/*
Query 2 (Purchases for each Genre)
*/
SELECT g.name, sum(i.total) AS Purchases
FROM Genre g
JOIN Track
ON track.GenreId=g.GenreId
JOIN InvoiceLine
ON Track.TrackId=InvoiceLine.TrackId
JOIN Invoice i
ON i.InvoiceId=InvoiceLine.InvoiceId
GROUP BY 1
ORDER BY 2 DESC

/*
Query 3 (Most Purchased Metallica Albums)
*/
SELECT album.Title, count(InvoiceLine.Quantity) No_of_Purchases
FROM Artist
JOIN Album
ON album.ArtistId=Artist.ArtistId
JOIN Track
ON Track.AlbumId = Album.AlbumId
JOIN InvoiceLine
ON InvoiceLine.TrackId=Track.TrackId
WHERE Artist.Name ="Metallica"
GROUP BY Album.Title
ORDER BY 2 DESC

/*
Query 4 (Top Ten Tracks that are longer than average)
*/
SELECT track.Name, Track.Milliseconds AS Track_Length
FROM Track
JOIN InvoiceLine
ON InvoiceLine.TrackId=Track.TrackId
GROUP BY 1
HAVING avg(track.Milliseconds) < track.Milliseconds
ORDER BY 2 DESC
LIMIT 10
