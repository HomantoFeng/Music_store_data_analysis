-- Q1: find info of all Rock Music listeners returning emails, first name, last name 
SELECT email,first_name,last_name
FROM Music_store.invoice
JOIN Music_store.invoice_line 
USING (invoice_id)
JOIN Music_store.customer
USING (customer_id)
JOIN Music_store.track
USING (track_id)
JOIN Music_store.genre
USING (genre_id)
where genre.name='Rock'
group by email,first_name,last_name
order by email

-- Q2: list top 10 artist name and total track count of the top 10 rock bands
WITH Album_all as (SELECT * FROM Music_store.album UNION SELECT * FROM Music_store.album2)

SELECT artist.artist_id,artist.name,count(distinct track_id) as number_of_tracks
FROM Album_all
JOIN Music_store.track 
USING (album_id)
JOIN Music_store.artist
USING (artist_id)
JOIN Music_store.genre
USING (genre_id)
WHERE genre.name='Rock'
GROUP BY artist.artist_id,artist.name 
ORDER BY number_of_tracks DESC
LIMIT 10

 
 

SELECT *
FROM Music_store.invoice

