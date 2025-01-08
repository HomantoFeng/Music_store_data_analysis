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
