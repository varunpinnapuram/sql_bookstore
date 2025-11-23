-- sample_queries.sql
-- Useful queries to demonstrate SQL skills

-- 1) Show books with their authors
SELECT b.book_id, b.title, a.name AS author, b.price, b.stock
FROM books b
JOIN authors a ON b.author_id = a.author_id
ORDER BY b.title;

-- 2) Top-selling books (by total quantity sold)
SELECT b.title, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN books b ON oi.book_id = b.book_id
GROUP BY b.book_id
ORDER BY total_sold DESC;

-- 3) Customers and their orders
SELECT c.name, o.order_id, o.order_date, o.total
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.name, o.order_date;

-- 4) Low stock books (stock <= 5)
SELECT title, stock FROM books WHERE stock <= 5 ORDER BY stock ASC;

-- 5) Transaction example (update stock when creating an order)
-- Begin transaction; depending on your SQL environment, use appropriate BEGIN/COMMIT syntax.
-- This is a conceptual example for an order of 2 copies of book_id = 3:
BEGIN;
INSERT INTO orders(customer_id, order_date, total) VALUES (1, date('now'), 17.00);
-- suppose new order_id is X
-- INSERT INTO order_items(order_id, book_id, quantity, price_at_order) VALUES (X, 3, 2, 8.50);
-- UPDATE books SET stock = stock - 2 WHERE book_id = 3;
COMMIT;
