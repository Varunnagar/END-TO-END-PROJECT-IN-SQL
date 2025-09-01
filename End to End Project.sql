drop table if exists Books;
create table Books(
Book_ID int primary key not null,
Title varchar(100) not null,
Author varchar(50) not null,
Genre varchar(20) not null,
Published_Year int not null,
Price numeric (10,2) not null,
Stock int not null
);

drop table if exists Customers;
Create table Customers(
Customer_ID int primary key not null,
Name varchar(100)not null,
Email varchar(100) not null,
Phone varchar(20) not null,
City varchar(100) not null,
Country varchar(100) not null
);


drop table if exists Orders;
Create table Orders(
Order_ID int primary key not null,
Customer_ID int not null,
Book_ID int not null,
Order_Date date not null,
Quantity int not null,
Amount numeric(10,2)
);
select * from Books;
select * from Customers;
Select * from Orders;

-- Q1-Retreive all books in the 'Fiction' genre 
select Book_ID, Title from Books 
where Genre = 'Fiction';

--Q2- Find Books published after year 1950
select * from Books 
where Published_Year = '1950';

--Q3- List all Customers from Canada
Select * from Customers
where Country = 'Canada';

--Q4- Show orders Placed in november 2023
select * from Orders
where Order_Date between '11/01/2023' and '11/30/2023';

--Q5- Retrieve the total stock of books available
select Sum(Stock) from Books;

--Q6- Find the details of the most expensive book
select * from Books
where Price = (Select max(Price) from Books);

--Q7- Show all the customers who ordered  more than 1 quantity of a book
select* from Orders
where Quantity > 1;

--Q8- Retrieve all the orders where total amount excedes $20
select * from Orders
where Amount > 20;

--Q9- list all the genre available in the books
select distinct Genre from Books; 

--Q10- Find the book with the lowest stock
Select Title, Stock from Books
where Stock = (select min(Stock) from Books);

--Q11- Calculate the Total Revenue Generated from all the orders
Select sum(Amount)
from Orders;
















