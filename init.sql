-- Create user
CREATE USER IF NOT EXISTS 'myuser'@'%' IDENTIFIED BY 'mypassword';

-- Grant all privileges to the user
GRANT ALL PRIVILEGES ON *.* TO 'myuser'@'%';


-- -- Create the databases under root
CREATE DATABASE IF NOT EXISTS order_ms;
CREATE DATABASE IF NOT EXISTS product_ms;
CREATE DATABASE IF NOT EXISTS user_ms;
CREATE DATABASE IF NOT EXISTS payment_service;

-- -- Grant ownership of the databases to myuser
GRANT ALL PRIVILEGES ON order_ms.* TO 'myuser'@'%';
GRANT ALL PRIVILEGES ON product_ms.* TO 'myuser'@'%';
GRANT ALL PRIVILEGES ON user_ms.* TO 'myuser'@'%';
GRANT ALL PRIVILEGES ON payment_service.* TO 'myuser'@'%';

-- -- Use the product_ms database
USE product_ms;

-- Create categories table
CREATE TABLE categories (
  id BIGINT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255),
  PRIMARY KEY (id)
);

-- Create products table
CREATE TABLE products (
  id BIGINT NOT NULL AUTO_INCREMENT,
  available_quantity INT NOT NULL,
  description VARCHAR(255),
  image VARCHAR(255),
  price DOUBLE NOT NULL,
  title VARCHAR(255),
  category_id BIGINT,
  PRIMARY KEY (id),
  FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Inserting values into categories table
INSERT INTO categories (name) VALUES 
('Electronics'),
('Fashion'),
('Home Decor'),
('Sports'),
('Toys'),
('Beauty & Personal Care'),
('Health & Wellness'),
('Food & Beverages'),
('Pet Care'),
('Outdoor & Travel');

-- Inserting values into products table
INSERT INTO products (available_quantity, description, image, price, title, category_id) VALUES 
(50, 'High-performance gaming laptop', 'gaminglaptop.jpg', 120000.00, 'Gaming Laptop', 1),
(100, 'Advanced smartwatch with fitness tracking', 'smartwatch.jpg', 25000.00, 'Smartwatch', 1),
(20, 'Stylish leather jacket for men', 'leatherjacket.jpg', 8000.00, 'Leather Jacket', 2),
(75, 'High-quality football for sports enthusiasts', 'football.jpg', 1500.00, 'Football', 4),
(150, 'Soft and cuddly teddy bear for kids', 'teddybear.jpg', 500.00, 'Teddy Bear', 5),
(25, 'Wireless and noise-cancelling headphones', 'wirelessheadphones.jpg', 10000.00, 'Wireless Headphones', 1),
(50, 'Comfortable running shoes for men', 'runningshoes.jpg', 6000.00, 'Running Shoes', 4),
(30, 'Luxurious and long-lasting perfume for women', 'perfume.jpg', 5000.00, 'Perfume', 6),
(10, 'Stylish and durable coffee table for home decor', 'coffeetable.jpg', 20000.00, 'Coffee Table', 3),
(100, 'Durable and fun dog toy for pets', 'dogtoy.jpg', 500.00, 'Dog Toy', 9),
(20, 'Waterproof and spacious tent for camping', 'tent.jpg', 25000.00, 'Tent', 10);

-- -- Apply the changes
FLUSH PRIVILEGES;