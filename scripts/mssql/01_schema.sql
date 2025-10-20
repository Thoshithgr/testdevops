IF DB_ID('retail') IS NULL
BEGIN
  CREATE DATABASE retail;
END
GO

USE retail;
GO

IF OBJECT_ID('customers') IS NULL
BEGIN
  CREATE TABLE customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name NVARCHAR(100) NOT NULL,
    last_name NVARCHAR(100) NOT NULL,
    email NVARCHAR(255) UNIQUE,
    created_at DATETIME2 DEFAULT SYSUTCDATETIME()
  );
END
GO

IF OBJECT_ID('products') IS NULL
BEGIN
  CREATE TABLE products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(200) NOT NULL,
    category NVARCHAR(100),
    price DECIMAL(10,2) NOT NULL,
    created_at DATETIME2 DEFAULT SYSUTCDATETIME()
  );
END
GO

IF OBJECT_ID('orders') IS NULL
BEGIN
  CREATE TABLE orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    status NVARCHAR(50) NOT NULL,
    total DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
  );
END
GO

IF OBJECT_ID('order_items') IS NULL
BEGIN
  CREATE TABLE order_items (
    order_item_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
  );
END
GO
