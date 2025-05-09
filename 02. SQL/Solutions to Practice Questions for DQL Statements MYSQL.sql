-- ### Practice Questions for Data Query Language (DQL) Statements ###

-- 1. Retrieve all authors.
SELECT * FROM authors;

-- 2. Retrieve the names and email addresses of all customers.
SELECT name, email FROM customers;

-- 3. List all books along with their authors' names.
SELECT title, author_name 
FROM books
JOIN authors ON authors.author_id = books.author_id;
 

-- 4. Find all books published before the year 2000.
SELECT title, publication_year FROM books
WHERE publication_year < 2000;

-- 5. Get the total number of books written by British authors.
SELECT count(*) AS BritishBooks FROM books
JOIN authors ON authors.author_id = books.author_id
WHERE nationality = 'British';

-- OR

SELECT count(*) AS BritishBooks FROM books
WHERE author_id IN 
(SELECT author_id FROM authors
WHERE nationality = 'British');

-- 6. Retrieve the titles of all books reviewed by 'John Doe'.
SELECT title, review_text FROM books
JOIN reviews ON reviews.book_id = books.book_id
JOIN customers ON customers.customer_id = reviews.customer_id
WHERE name = 'John Doe';

-- 7. Find the average rating for each book.
SELECT avg(rating), book_id FROM reviews
GROUP BY book_id;

-- 8. List all orders made in the year 2023.
SELECT order_id, order_date FROM orders
WHERE order_date BETWEEN '2023-1-1' AND '2023-12-31';

-- 9. Retrieve the most recent review for each book.
SELECT O.book_id, O.order_date, R.review_text 
FROM reviews R
JOIN orders O ON O.book_id = R.book_id
WHERE O.order_date IN
(SELECT max(O2.order_date) FROM orders O2
GROUP BY O2.book_id);

-- OR

SELECT B.title, R.review_text, O.order_date
FROM BOOKS B
JOIN Reviews R ON B.book_id = R.book_id
JOIN ORDERS O ON R.book_id = O.book_id
WHERE O.order_date IN (
SELECT MAX(O2.order_date) FROM ORDERS O2
GROUP BY O2.book_id
);
-- 10. Find all customers who have never placed an order.
SELECT name FROM customers
LEFT JOIN orders ON orders.customer_id = customers.customer_id
WHERE order_id = NULL;

-- 11. List the top 5 highest-rated books based on average ratings.
SELECT  avg(rating), book_id FROM reviews
GROUP BY book_id
ORDER BY avg(rating) DESC
LIMIT 5;

-- 12. Retrieve the details of all American authors.
SELECT * FROM Authors
WHERE nationality = 'American';

-- 13. Find the total number of orders placed by each customer.
SELECT Customers.name, COUNT(Orders.order_id) AS total_orders
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.name;

-- 14. List the titles of all books and their corresponding review texts.
SELECT Books.title, Reviews.review_text
FROM Books
JOIN Reviews ON Books.book_id = Reviews.book_id;

-- 15. Retrieve the names of all authors who have written more than one book.
SELECT author_name, count(book_id) AS No_Of_Books
FROM authors
JOIN books ON books.author_id = authors.author_id
GROUP BY author_name
HAVING count(book_id) > 1
ORDER BY  count(book_id) desc;

-- 16. Retrieve all books with the word 'the' in the title (case-insensitive).
SELECT * FROM books 
WHERE title LIKE '%the%';


-- 17. Find all customers whose email addresses end with 'example.com'.
SELECT name, email
FROM Customers
WHERE email LIKE '%@example.com';

-- 18. Retrieve the names and birthdates of customers born in the 1980s.
SELECT name, birthdate
FROM Customers
WHERE birthdate BETWEEN '1980-01-01' AND '1989-12-31';

-- 19. List all authors from either the 'British' or 'American' nationality using a set operator.
SELECT author_name, nationality from authors 
WHERE nationality = 'British'
UNION
SELECT author_name, nationality from authors 
WHERE nationality = 'American';

-- 20. Retrieve the titles and publication years of books published after 2000 but not in 2023 using a set operator.
SELECT title, publication_year FROM  books
WHERE publication_year > 2000 AND publication_year <> 2023;

-- 21. Find all books whose titles start with 'The'.
SELECT title
FROM Books
WHERE title LIKE 'The%';

-- 22. Retrieve the titles of books and their genres where the genre contains 'Fiction'.
SELECT title, genre
FROM Books
WHERE genre LIKE '%Fiction%';

-- 23. List the names of customers who have either 'John' or 'Jane' in their name.
SELECT name
FROM Customers
WHERE name LIKE '%John%' OR name LIKE '%Jane%';

-- 24. Find all authors whose names end with 'ing'.
SELECT author_name
FROM Authors
WHERE author_name LIKE '%ing';

-- 25. Retrieve the names and nationalities of authors where the name contains exactly five letters.
SELECT author_name, nationality
FROM Authors
WHERE author_name LIKE '_____';