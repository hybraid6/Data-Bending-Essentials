--CREATING A NEW DATABSE
CREATE DATABASE Bookstore;
--CREATING AUTHORS TABLE
CREATE TABLE Authors
(Author_ID INT PRIMARY KEY, Author_Name VARCHAR(255), Nationality VARCHAR(255));

--CREATING BOOKS TABLE 
CREATE TABLE Books
(Book_ID INT PRIMARY KEY, Title VARCHAR(255), 
 Genre VARCHAR(255), Publication_Year INT, Author_ID INT FOREIGN KEY REFERENCES Authors(Author_ID)); 

--CREATING TABLE CUSTOMERS
CREATE TABLE CUSTOMERS(Customer_ID INT PRIMARY KEY, Name VARCHAR(255), Email VARCHAR(255) CONSTRAINT EUNIQUE UNIQUE, Birthdate DATE);

--CREATING ORDERS TABLE
CREATE TABLE 
Orders(Order_ID INT PRIMARY KEY, 
Customer_ID INT FOREIGN KEY REFERENCES Customers(Customer_ID), Book_ID INT FOREIGN KEY REFERENCES Books(Book_ID), Order_Date DATE);

--CREATING TABLE REVIEW
CREATE TABLE
Reviews(Review_ID INT PRIMARY KEY, 
Book_ID INT FOREIGN KEY REFERENCES Books(Book_ID),
Customer_ID INT FOREIGN KEY REFERENCES Customers(Customer_ID), Rating INT CHECK(Rating >= 1 AND Rating <= 5), Review_Text TEXT);

--TIME TO INSERT VALUES
INSERT INTO Authors VALUES
(1, 'J.K. Rowling', 'British'),
(2, 'George Orwell', 'British'),
(3, 'Agatha Christie', 'British'),
(4, 'Stephen King', 'American'),
(5, 'Chimamanda Ngozi Adichie', 'Nigerian'),
(6, 'Haruki Murakami', 'Japanese'),
(7, 'Gabriel Garcia Marquez', 'Colombian'),
(8, 'Ernest Hemingway', 'American'),
(9, 'Jane Austen', 'British'),
(10, 'Leo Tolstoy', 'Russian'),
(11, 'Fyodor Dostoevsky', 'Russian'),
(12, 'Mark Twain', 'American'),
(13, 'Paulo Coelho', 'Brazilian'),
(14, 'Virginia Woolf', 'British'),
(15, 'Toni Morrison', 'American');

INSERT INTO Books VALUES
(1, 'Harry Potter and the Sorcerer''s Stone', 'Fantasy', 1997, 1),
(2, '1984', 'Dystopian', 1949, 2),
(3, 'Murder on the Orient Express','Mystery', 1934, 3),
(4, 'The Shining', 'Horror', 1977, 4),
(5, 'Half of a Yellow Sun', 'Historical Fiction', 2006, 5),
(6, 'Norwegian Wood','Fiction', 1987, 6),
(7, 'One Hundred Years of Solitude','Magical Realism', 1967,7),
(8, 'The Old Man and the Sea', 'Fiction', 1952, 8),
(9, 'Pride and Prejudice', 'Romance', 1813, 9),
(10, 'War and Peace','Historical Fiction', 1869, 10),
(11, 'Crime and Punishment','Psychological Fiction', 1866, 11),
(12, 'The Adventures of Huckleberry Finn','Adventure', 1884, 12),
(13, 'The Alchemist','Fiction', 1988, 13),
(14, 'Mrs. Dalloway', 'Modernism', 1925, 14),
(15, 'Beloved', 'Historical Fiction', 1987, 15),
(16, 'Harry Potter and the Chamber of Secrets','Fantasy', 1998,1),
(17, 'Animal Farm', 'Dystopian', 1945, 2),
(18, 'And Then There Were None','Mystery', 1939, 3),
(19, 'The Dark Tower: The Gunslinger','Fantasy', 1982, 4),
(20, 'Americanah','Fiction', 2013, 5),
(21, 'Kafka on the Shore','Fiction', 2002, 6),
(22, 'Love in the Time of Cholera', 'Romance', 1985, 7),
(23, 'For Whom the Bell Tolls','Fiction', 1940, 8),
(24, 'Sense and Sensibility', 'Romance', 1811, 9),
(25, 'Anna Karenina', 'Fiction', 1877,10),
(26, 'The Brothers Karamazov','Philosophical Fiction', 1880,11),
(27, 'The Prince and the Pauper', 'Historical Fiction', 1881, 12),
(28, 'The Old Man and the Sea','Fiction', 1952, 8),
(29, 'One Hundred Years of Solitude','Magical Realism', 1967,7),
(30, 'Beloved', 'Historical Fiction', 1987,15);

INSERT INTO Customers VALUES
(1, 'John Doe', 'johndoe@example.com', '1985-03-15'),
(2, 'Jane Smith', 'janesmith@example.com', '1990-08-22'),
(3, 'David Johnson', 'davidjohnson@example.com', '1978-11-10'),
(4, 'Emily Brown', 'emilybrown@example.com', '1989-05-03'),
(5, 'Michael Lee', 'michaellee@example.com', '1982-09-28'),
(6, 'Sarah Wilson', 'sarahwilson@example.com', '1995-04-20'),
(7, 'James Miller', 'jamesmiller@example.com', '1974-12-08'),
(8, 'Olivia Davis', 'oliviadavis@example.com', '1992-07-17'),
(9, 'Daniel Taylor', 'danieltaylor@example.com', '1987-01-25'),
(10, 'Sophia Clark', 'sophiaclark@example.com', '1998-06-12'),
(11, 'Ethan Moore', 'ethanmoore@example.com', '1980-02-18'),
(12, 'Mia Anderson', 'miaanderson@example.com', '1993-10-05'),
(13, 'William White', 'williamwhite@example.com', '1976-06-30'),
(14, 'Isabella Garcia', 'isabellagarcia@example.com', '1991-03-24'),
(15, 'Noah Martinez', 'noahmartinez@example.com', '1984-08-19');

INSERT INTO Orders VALUES
(1, 1, 1, '2023-02-10'),
(2, 2, 2, '2023-05-18'),
(3, 3, 3, '2022-12-03'),
(4, 4, 4, '2024-01-22'),
(5, 5, 5, '2023-08-14'),
(6, 6, 6, '2022-10-30'),
(7, 7, 7, '2023-04-05'),
(8, 8, 8, '2024-03-12'),
(9, 9, 9, '2022-07-19'),
(10, 10, 10, '2023-11-26'),
(11, 11, 11, '2022-05-02'),
(12, 12, 12, '2024-04-08'),
(13, 13, 13, '2022-08-25'),
(14, 14, 14, '2023-06-15'),
(15, 15, 15, '2022-11-29'),
(16, 1, 1, '2023-03-20'),
(17, 2, 2, '2023-06-25'),
(18, 3, 3, '2022-12-28'),
(19, 4, 4, '2024-02-15'),
(20, 5, 5, '2023-09-10'),
(21, 6, 6, '2022-11-15'),
(22, 7, 7, '2023-05-20'),
(23, 1, 8, '2024-04-05'),
(24, 2, 9, '2022-08-19'),
(25, 3, 10, '2023-12-10'),
(26, 4, 11, '2022-06-05'),
(27, 5, 12, '2024-05-08'),
(28, 6, 13, '2022-09-30'),
(29, 7, 14, '2023-07-20'),
(30, 1, 15, '2023-01-15');

INSERT INTO Reviews VALUES
(1, 1, 1, 5, 'Loved the magical world!'),
(2, 2, 2, 4, 'Thought-provoking and unsettling.'),
(3, 3, 3, 5, 'Classic Christie mystery.'),
(4, 4, 4, 4, 'Absolutely terrifying!'),
(5, 5, 5, 5, 'Beautifully written and emotional.'),
(6, 6, 6, 4, 'Melancholic and deeply moving.'),
(7, 7, 7, 5, 'Magical realism at its best.'),
(8, 8, 8, 4, 'A timeless tale of perseverance.'),
(9, 9, 9, 5, 'A delightful and witty romance.'),
(10, 10, 10, 5, 'Epic and enthralling.'),
(11, 11, 11, 4, 'Intense and philosophical.'),
(12, 12, 12, 5, 'A grand adventure with heart.'),
(13, 13, 13, 4, 'Inspirational and thought-provoking.'),
(14, 14, 14, 4, 'A masterful depiction of one day.'),
(15, 15, 15, 5, 'Powerful and haunting.'),
(16, 1, 1, 4, 'Enjoyed the characters and storyline.'),
(17, 2, 2, 3, 'Interesting read but not my favorite.'),
(18, 3, 3, 4, 'Another great mystery from Christie.'),
(19, 4, 4, 3, 'Kept me on the edge of my seat.'),
(20, 5, 5, 4, 'Captivating and thought-provoking.'),
(21, 6, 6, 3, 'Well-written but a bit depressing.'),
(22, 7, 7, 4, 'Magical realism adds depth to the story.'),
(23, 8, 8, 3, 'Found it a bit slow-paced.'),
(24, 9, 9, 4, 'Charming and humorous.'),
(25, 10, 10, 4, 'Sweeping epic with memorable characters.'),
(26, 11, 11, 3, 'Complex and challenging.'),
(27, 12, 12, 4, 'Exciting adventure with a meaningful message.'),
(28, 13, 13, 3, 'Interesting concepts but didn''t fully connect.'),
(29, 14, 14, 3, 'Detailed exploration of human experience.'),
(30, 15, 15, 4, 'Emotionally impactful and beautifully written.');

--MODIFYING MY TABLES
ALTER TABLE Customers ADD Phone_Number VARCHAR(15);

ALTER TABLE Reviews ALTER COLUMN Rating FLOAT;
--NEED TO DROP MY CHECK CONSTRAINT FIRST
ALTER TABLE Reviews
DROP CONSTRAINT CK__Reviews__Rating__59063A47;
--TIME TO ALTER THE TABLE
ALTER TABLE Reviews
ALTER COLUMN Rating FLOAT;

--Drop the genre column from the Books table.
ALTER TABLE Books DROP COLUMN Genre;
SELECT*FROM Books;

--CONSTRAINTS
--Add a NOT NULL constraint to the author_name column in the Authors table
ALTER TABLE Authors
ALTER COLUMN Author_Name VARCHAR(255) NOT NULL;

--Add a CHECK constraint to ensure that the rating column in the Reviews table is between 1 and 5.
ALTER TABLE Reviews
ADD CONSTRAINT CK__Reviews__Rating__59063A47
CHECK (Rating BETWEEN 1 AND 5);

--Write a SQL statement to drop the Reviews table.
DROP TABLE Reviews;
--Write a SQL statement to drop the Orders table.
DROP TABLE Orders;

--Insert a new author into the Authors table.
SELECT*FROM Authors;
INSERT INTO Authors VALUES(16,' Williams Jane', 'Nigerian');

-- Insert a new book into the Books table associated with the author you just added.
SELECT*FROM Books;
INSERT INTO Books VALUES (31,'All Men Do Is Lie', 2024, 16);

---- Insert a new customer into the Customers table.
SELECT*FROM Customers;
INSERT INTO Customers VALUES (16,'Fadairo Shaki', 'Fadairoshaki@example.com', '2000-08-21', '');

---- Insert a new order into the Orders table for the customer and book you just added.
SELECT *FROM Orders;
INSERT INTO Orders VALUES (31,16,31, '2025-01-06');

--Insert a new review for the book and customer you just added.
SELECT*FROM Reviews;
INSERT INTO Reviews VALUES(31,31,16,5, 'So Apt and Realistic');

--UPDATES QUESTIONS
-- Update the name of a customer in the Customers table.
UPDATE Customers
SET Name = 'Emily Red'
WHERE Customer_ID = 4;

-- Update the title of a book in the Books table.
UPDATE Books 
SET Title = 'War and Peace'
WHERE Book_ID = 10;

---- Update the rating of a review in the Reviews table.
UPDATE Reviews
SET Rating = 3
WHERE Review_ID =5;

---- Increase the publication_year of all books in the Books table by 1 year.
UPDATE Books
SET Publication_Year = Publication_Year + 1;

--Deletes:**
-- Delete a review from the Reviews table.
DELETE FROM Reviews
WHERE Review_ID = 1;

-- Delete an order from the Orders table.
SELECT*FROM Orders
DELETE FROM Orders
WHERE Order_ID = 2;

-- Delete a customer from the Customers table.
SELECT*FROM Customers
ALTER TABLE Reviews
DROP CONSTRAINT FK__Reviews__Custome__619B8048;

ALTER TABLE Reviews
ADD CONSTRAINT FK__Reviews__Custome__619B8048
FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
ON DELETE CASCADE;

DELETE FROM Customers
WHERE Customer_ID =3;

--Delete a book from the Books table.
SELECT *FROM Books
DELETE FROM Books
WHERE Title= 'The Shinning';


