-- Use the BookstoreDB database
USE BookstoreDB;

-- 1. Data Retrieval: Retrieve customer order information including customer name, order date, book title, and quantity.
SELECT c.`Name` AS CustomerName, o.`OrderDate`, b.`Title` AS BookTitle, od.`Quantity`
FROM Customers
c
JOIN Orders
o ON c.`CustomerID` = o.`CustomerID`
JOIN OrderDetails
od ON o.`OrderID` = od.`OrderID`
JOIN Books
b ON od.`ISBN` = b.`ISBN`;

-- 2. Data Update: Update the price of a book and verify the change.
UPDATE Books SET Price = 8.99 WHERE ISBN = '9781234567890';

-- Verify that the price has been updated.
SELECT * FROM Books WHERE ISBN = '9781234567890';

-- 3. Data Deletion: Delete an order detail (e.g., remove one of the books from order 1) and verify.
DELETE FROM OrderDetails WHERE OrderID = 1 AND ISBN = '9780321765723';

-- Verify the deletion.
SELECT * FROM OrderDetails WHERE OrderID = 1;

-- 4. Books by Author: Retrieve a list of books and their corresponding authors.
SELECT a.`Name` AS AuthorName, b.`Title` AS BookTitle
FROM Authors
a
JOIN BookAuthors
ba ON a.`AuthorID` = ba.`AuthorID`
JOIN Books
b ON ba.`ISBN` = b.`ISBN`;

-- 5. Complex Query: Find customers who have ordered books by a specific author (e.g., Douglas Adams).
SELECT c.`Name` AS CustomerName
FROM Customers
c
JOIN Orders
o ON c.`CustomerID` = o.`CustomerID`
JOIN OrderDetails
od ON o.`OrderID` = od.`OrderID`
JOIN Books
b ON od.`ISBN` = b.`ISBN`
JOIN BookAuthors
ba ON b.`ISBN` = ba.`ISBN`
JOIN Authors
a ON ba.`AuthorID` = a.`AuthorID`
WHERE a.`Name` = 'Douglas Adams'; -- Change author name as needed