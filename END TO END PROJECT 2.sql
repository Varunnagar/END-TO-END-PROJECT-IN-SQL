--Advanced Queries
--Q1- Retrieve total number of books sold for each genre
select b.Genre, Sum(o.Quantity) as Total_Books_Sold
from Orders O
Join Books b on o.Book_ID = b.Book_ID
Group by Genre;

--Q2- Find the avg price of books in fantasy genre
SELECT AVG(price) AS Average_Price
FROM Books
WHERE Genre = 'Fantasy';

--Q3- List customers who placed atleast 2 orders
select c.Name, c.Customer_ID, o.Quantity from Orders o
join Customers c on c.Customer_ID = o.Order_ID
where o.Quantity >= 2;

--Q4- Find the most frequent ordred book
SELECT o.Book_id, b.title, COUNT(o.order_id) AS ORDER_COUNT
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY o.book_id, b.title
ORDER BY ORDER_COUNT DESC LIMIT 1;

--Q5- Show the top 3 most expensive books of 'Fantasy' Genre
select Title, Genre, Price from Books
where Genre = 'Fantasy'
Order by Price desc limit 3;

--Q6- Retrieve the total quantity of books sold by each author
select b.Author, sum(o.Quantity) as Total_Books_Sold
from Orders o
join Books b on b.Book_ID = o.Order_ID
Group by Author;

--Q7- List the cities where customers who spent over $30 are located
select c.City, Amount
from Orders o
join Customers c on c.Customer_ID = o.Order_ID
where Amount > 30 order by Amount asc;

--Q8- Find the customer who spent the most on orders:
select c.Name, o.Amount
from Orders o
join Customers c on c.Customer_ID = o.Order_ID
Group by o.Amount , c.Name
Order by Amount Desc Limit 1;

--Q9- Calculate the stock remaining after fulfilling all orders:
select b.Book_ID, b.Title, b.Stock, coalesce(sum(o.Quantity),0) as order_quantity,
	b.Stock - Coalesce(sum(o.Quantity), 0) as remaining_quantity
from Books b
Left join Orders o on b.Book_ID = o.Book_ID
Group by b.Book_ID
Order by b.Book_ID;


































