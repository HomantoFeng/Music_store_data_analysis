# Music_store_data_analysis

In this project, I wrote five SQL queries to analyze the intricate relationships among 12 datasets from the Music Store Data Analysis. I also developed an Entity-Relationship (ER) model to visually represent the table structures and their logical interconnections. By combining these SQL queries with the ER model, I demonstrate my ability to handle complex datasets, extract meaningful insights, and present results in a clear and organized way.

SQL queries to answer five questions:
Q1: Find info of all Rock Music listeners returning emails, first name and last name
Q2: List top 10 artist name and total track counts of the top 10 rock bands
Q3: Find all the track names that have a song length longer than the average song length
Q4: Find out the most popular music genre for each country
Q5: Find out the customer that spent the most for each country

Data Preprocessing

Before importing the datasets into MySQL Workbench, I performed preprocessing in Python using the [CSV2Json_convert.ipynb](https://github.com/HomantoFeng/Music_store_data_analysis/blob/main/CSV2Json_convert.ipynb) script. This process involved converting multiple CSV files into JSON format to ensure the data was clean and fully compatible with SQL operations. Special attention was given to handling non-ASCII characters, including the UTF-8 Byte Order Mark (BOM), to avoid potential encoding issues.

Visualizing Relationships: ER Diagrams for Each Query

Q1:
![image](https://github.com/user-attachments/assets/3b77641a-f717-4827-95b9-d97e4abebd92)

