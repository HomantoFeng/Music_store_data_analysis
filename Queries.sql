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
 

 -- Q4: find out the most popular music genre for each country. 
WITH Album_all as (SELECT * FROM Music_store.album UNION SELECT * FROM Music_store.album2),
genre_classify_country as (SELECT country,genre.name as genre,sum(quantity) as total_purchase
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
JOIN Music_store.genre
USING (genre_id)
GROUP BY country,genre.name
ORDER BY country,total_purchase DESC)

SELECT country,genre,total_purchase
FROM genre_classify_country
WHERE (country,total_purchase) IN (SELECT country,max(total_purchase)
FROM genre_classify_country
GROUP BY country)

 -- Q5: find out the customer that spent the most for each country
WITH Album_all as (SELECT * FROM Music_store.album UNION SELECT * FROM Music_store.album2),
spent_amount as (
SELECT country,customer_id,customer.first_name as first_name,customer.last_name as last_name,sum(invoice_line.quantity*invoice_line.unit_price) as spent_amount 
FROM Music_store.invoice
JOIN Music_store.invoice_line 
USING (invoice_id)
JOIN Music_store.customer
USING (customer_id)
JOIN Music_store.track 
USING (track_id)
GROUP BY country,customer_id,customer.first_name,customer.last_name)

SELECT country,customer_id,first_name,last_name,spent_amount as total_spent_amount
FROM spent_amount
WHERE (country,spent_amount) IN (SELECT country,max(spent_amount)
FROM spent_amount
GROUP BY country)
ORDER BY country