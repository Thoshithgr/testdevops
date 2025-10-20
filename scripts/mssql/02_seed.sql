USE retail;
GO

INSERT INTO customers (first_name, last_name, email) VALUES
('Alice', 'Anderson', 'alice@example.com'),
('Bob', 'Baker', 'bob@example.com'),
('Carol', 'Clark', 'carol@example.com');
GO

INSERT INTO products (name, category, price) VALUES
('Coffee Beans', 'Grocery', 12.99),
('Tea Pack', 'Grocery', 7.49),
('Espresso Machine', 'Appliances', 199.99),
('Mug', 'Kitchen', 9.99);
GO

INSERT INTO orders (customer_id, order_date, status, total) VALUES
(1, '2024-10-01', 'paid', 222.97),
(2, '2024-10-03', 'paid', 30.47),
(3, '2024-10-05', 'pending', 19.98);
GO

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 3, 1, 199.99),
(1, 1, 1, 12.99),
(1, 4, 1, 9.99),
(2, 1, 2, 12.99),
(2, 2, 2, 7.49),
(3, 4, 2, 9.99);
GO
