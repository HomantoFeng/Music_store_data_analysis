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

 -- Q3: return all the track names that have a song length longer than the average song length
 -- return the name and milliseconds for each tracks, order by the song length with longest songs list first
SELECT name, milliseconds
FROM Music_store.track 
where milliseconds> (SELECT AVG(milliseconds) as ave_len FROM Music_store.track)
order by milliseconds desc
 
 -- Q3: find out how much amount spent by each customer on artists? Write a query to return customer name,artist nanme and total spent
WITH Album_all as (SELECT * FROM Music_store.album UNION SELECT * FROM Music_store.album2)

SELECT * -- first_name,last_name,artist.name,sum(invoice_line.unit_price*invoice_line.quantity) as amount_spent
FROM Music_store.invoice
JOIN Music_store.invoice_line 
USING (invoice_id)
JOIN Music_store.customer
USING (customer_id)
JOIN Music_store.track 
USING (track_id)
JOIN Album_all
USING (Album_id)
JOIN Music_store.artist
USING (artist_id)
where first_name='Johannes' and last_name='Van der Berg'
-- GROUP BY first_name,last_name,artist.name
-- HAVING first_name='Johannes'
-- ORDER BY first_name,last_name,artist.name
