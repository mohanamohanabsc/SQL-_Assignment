
CREATE DATABASE Amazon_db;
USE amazon_db;
CREATE TABLE Users(
    User_id INT AUTO_INCREMENT PRIMARY key,
    Name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    registered_date DATE NOT NULL,
    membership ENUM('Basic', 'Prime') DEFAULT 'Basic'
);

show columns in Users;

CREATE TABLE Products(
    Product_id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(200) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Category VARCHAR(100) NOT NULL,
    Stock INT NOT NULL
);

CREATE TABLE Orders(
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    User_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (User_id) REFERENCES Users (User_id)
);

CREATE TABLE OrderDetails(
    order_details_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    Product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders (order_id),
    FOREIGN KEY (Product_id) REFERENCES Products (Product_id)
);

SHOW TABLES IN amazon_db;




INSERT INTO Users(Name, email, registered_date, membership)
VALUES
('Alice Johnson', 'alice.j@example.com', '2024-01-15', 'Prime'),
('Bob Smith', 'bob.s@example.com', '2024-02-01', 'Basic'),
('Charlie Brown', 'charlie.b@example.com', '2024-03-10', 'Prime'),
('Daisy Ridley', 'daisy.r@example.com', '2024-04-12', 'Basic');

select * from Users;

INSERT INTO Products(name, price, category, stock)
VALUES
('Echo Dot', 49.99, 'Electronics', 120),
('Kindle Paperwhite', 129.99, 'Books', 50),
('Fire Stick', 39.99, 'Electronics', 80),
('Yoga Mat', 19.99, 'Fitness', 200),
('Wireless Mouse', 24.99, 'Electronics', 150);

select * from products;

INSERT INTO Orders(user_id, order_date, total_amount)
VALUES
(1, '2024-05-01', 79.98),
(2, '2024-05-03', 129.99),
(1, '2024-05-04', 49.99),
(3, '2024-05-05', 24.99);

SELECT * FROM orders;

INSERT INTO OrderDetails (order_id, product_id, quantity)
VALUES
(1, 1, 2),
(2, 2, 1),
(3, 1, 1),
(4, 5, 1);




