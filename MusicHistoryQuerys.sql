/*Query all of the entries in the Genre table*/

SELECT *
FROM Genre;

/*Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords*/

SELECT *
FROM Artist
ORDER BY ArtistName;

/*Write a SELECT query that lists all the songs in the Song table and include the Artist name*/

SELECT     /*How I wrote it on my own*/
s.Title,
a.ArtistName
FROM Song s
LEFT JOIN Artist a ON s.ArtistId = a.id;

SELECT s.Title,a.ArtistName  /*Class Example*/
FROM Song AS s
JOIN Artist AS a ON a.Id = s.ArtistId;

/*Write a SELECT query that lists all the Artists that have a Soul Album*/

SELECT 
ArtistId
FROM Album
WHERE GenreId = 1;

SELECT DISTINCT a.ArtistName
FROM Artist a
JOIN Album al ON al.ArtistId = a.Id
JOIN Genre g ON g.Id = al.GenreId
WHERE g.Name = 'Soul';

/*Write a SELECT query that lists all the Artists that have a Jazz or Rock Album*/

SELECT 
ArtistId
FROM Album
WHERE GenreId = 1
OR GenreId = 2;

SELECT DISTINCT a.ArtistName
FROM Artist a
JOIN Album al ON al.ArtistId = a.Id
JOIN Genre g ON g.Id = al.GenreId
WHERE g.Name = 'Soul' OR g.Name = 'Rock';

/*Write a SELECT statement that lists the Albums with no songs*/

SELECT
AlbumLength
FROM Album
Where AlbumLength = 0;

SELECT *
FROM ALbum al
LEFT JOIN Song s ON s.AlbumId = al.Id;

/*Using the INSERT statement, add one of your favorite artists to the Artist table.*/

INSERT INTO Artist (ArtistName, YearEstablished)
VALUES ('Starcadian', 2013);

/*Using the INSERT statement, add one, or more, albums by your artist to the Album table.*/

INSERT INTO Album (Title,ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES ('Midnight Signals', '2017',2140, 'Starcadian', 28, 14);

/*Using the INSERT statement, add some songs that are on that album to the Song table.*/

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
 
 VALUES
 ('Freak Night', 519, '10/11/2017', 14, 28, 23),
 ('New Cydonia', 414, '10/11/2017', 14, 28, 23),
 ('Night Games', 410, '10/11/2017', 14, 28, 23);

 
/*Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
NOTE: Direction of join matters. Try the following statements and see the difference in results.
SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.Id;
SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.Id;*/

SELECT s.Title, alb.Title, ar.ArtistName
FROM Song s
LEFT JOIN Album alb ON alb.id = s.AlbumId
LEFT JOIN Artist ar ON ar.id = s.ArtistId
Where AlbumId = 23;

/*Write a SELECT statement to display how many songs exist for each album.
You'll need to use the COUNT() function and the GROUP BY keyword sequence.*/

Select /*How I did it*/
COUNT(Id) AS SongsInAlbum
FROM Song
GROUP BY AlbumId;

SELECT al.Title, COUNT(s.Id) AS 'Number of Tracks'
FROM Album al
LEFT JOIN Song s ON s.AlbumId = al.Id
GROUP BY al.Id, al.Title;

/*Write a SELECT statement to display how many songs exist for each artist. 
Youll need to use the COUNT() function and the GROUP BY keyword sequence.*/

Select
COUNT(Id) AS SongsSungByArtist
FROM Song
GROUP BY ArtistId;

SELECT a.ArtistName, COUNT(s.Id) AS 'Number of Tracks'
FROM Artist a
LEFT JOIN  Song s ON a.Id = s.ArtistId
GROUP BY a.ArtistName, a.Id;

/* Write a SELECT statement to display how many songs exist for each genre. 
Youll need to use the COUNT() function and the GROUP BY keyword sequence.*/

SELECT COUNT(Id)
FROM Song
GROUP BY GenreId;

/*Write a SELECT query that lists the Artists that have put out records on more than one record label.
Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword*/

SELECT COUNT(Label)
FROM Album
GROUP BY ArtistId;

/*(The above one is not solved)*/

SELECT a.ArtistName, COUNT(DISTINCT al.Label) AS 'Number of Albums'  /*Class example*/
FROM Artist a
JOIN Album al on al.ArtistId = a.Id
GROUP BY ArtistName
HAVING COUNT(DISTINCT al.Label)> 1 ;

/*Using ORDER BY and TOP 1, write a select statement to find the album with the longest duration.
The result should display the album title and the duration.*/
	
SELECT TOP 1 *
FROM Album
ORDER BY AlbumLength DESC;

/*Using ORDER BY and TOP 1, write a select statement to find the song with the longest duration. 
The result should display the song title and the duration.*/

SELECT TOP 1 *
FROM Song
ORDER BY SongLength DESC;

/*Modify the previous query to also display the title of the album.*/

SELECT TOP 1 *, alb.Title
FROM Song
LEFT JOIN Album alb ON Song.AlbumId = alb.Id
ORDER BY SongLength DESC;


 



