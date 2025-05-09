-- ***Solutions to Practice Questions for Data Query Language (DQL) Statements***

-- 1. Retrieve all authors.
SELECT * FROM Authors;

-- 2. Retrieve the names and email addresses of all customers.
SELECT name, email FROM Customers;

-- 3. List all books along with their authors' names.
SELECT Books.title, Authors.author_name
FROM Books
JOIN Authors ON Books.author_id = Authors.author_id;

-- 4. Find all books published before the year 2000.
SELECT title, publication_year
FROM Books
WHERE publication_year < 2000;

-- 5. Get the total number of books written by British authors.
SELECT COUNT(*)
FROM Books
JOIN Authors ON Books.author_id = Authors.author_id
WHERE Authors.nationality = 'British';

-- 6. Retrieve the titles of all books reviewed by 'John Doe'.
SELECT Books.title
FROM Reviews
JOIN Books ON Reviews.book_id = Books.book_id
JOIN Customers ON Reviews.customer_id = Customers.customer_id
WHERE Customers.name = 'John Doe';

-- 7. Find the average rating for each book.
SELECT Books.title, AVG(Reviews.rating) AS average_rating
FROM Books
JOIN Reviews ON Books.book_id = Reviews.book_id
GROUP BY Books.title;

-- 8. List all orders made in the year 2023.
SELECT * FROM Orders
WHERE YEAR(order_date) = 2023;

-- OR

SELECT * FROM Orders
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31';



-- 9. Retrieve the most recent review for each book.
SELECT B.title, R.review_text, O.order_date
FROM BOOKS B
JOIN Reviews R ON B.book_id = R.book_id
JOIN ORDERS O ON R.book_id = O.book_id
WHERE O.order_date IN (
SELECT MAX(O2.order_date) FROM ORDERS O2
GROUP BY O2.book_id
);

-- OR USING CTES (Common Table Expressions (CTEs)):

WITH LatestOrders AS (
	SELECT book_id, MAX(order_date) most_recent_order_date
	FROM ORDERS
	GROUP BY book_id
	)
	SELECT B.title, R.review_text, L.most_recent_order_date
	FROM BOOKS B
	JOIN REVIEWS R ON B.book_id = R.book_id
	JOIN LatestOrders L ON R.book_id = L.book_id
	ORDER BY L.most_recent_order_date DESC;


-- 10. Find all customers who have never placed an order.
SELECT Customers.name, Customers.email
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id
WHERE Orders.order_id IS NULL;

-- 11. List the top 5 highest-rated books based on average ratings.
SELECT TOP 5 Books.title, AVG(Reviews.rating) AS average_rating
FROM Books
JOIN Reviews ON Books.book_id = Reviews.book_id
GROUP BY Books.title
ORDER BY average_rating DESC;


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
SELECT Authors.author_name, COUNT(Books.book_id) AS book_count
FROM Authors
JOIN Books ON Authors.author_id = Books.author_id
GROUP BY Authors.author_name
HAVING COUNT(Books.book_id) > 1;

-- 16. Retrieve all books with the word 'the' in the title (case-insensitive).
SELECT title
FROM Books
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
SELECT author_name, nationality
FROM Authors
WHERE nationality = 'British'
UNION
SELECT author_name, nationality
FROM Authors
WHERE nationality = 'American';

-- 20. Retrieve the titles and publication years of books published after 2000 but not in 2023 using a set operator.
SELECT title, publication_year
FROM Books
WHERE publication_year > 2000
EXCEPT
SELECT title, publication_year
FROM Books
WHERE publication_year = 2023;

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
