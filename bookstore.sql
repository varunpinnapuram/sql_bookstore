-- bookstore.sql
-- Simple Bookstore Inventory schema + sample data (SQLite-compatible)
PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS authors (
    author_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    country TEXT
);

CREATE TABLE IF NOT EXISTS books (
    book_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    price REAL NOT NULL CHECK(price >= 0),
    stock INTEGER NOT NULL DEFAULT 0 CHECK(stock >= 0),
    published_year INTEGER,
    FOREIGN KEY(author_id) REFERENCES authors(author_id)
);

CREATE TABLE IF NOT EXISTS customers (
    customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE
);

CREATE TABLE IF NOT EXISTS orders (
    order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER NOT NULL,
    order_date TEXT DEFAULT (date('now')),
    total REAL DEFAULT 0,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE IF NOT EXISTS order_items (
    order_item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER NOT NULL,
    book_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL CHECK(quantity > 0),
    price_at_order REAL NOT NULL,
    FOREIGN KEY(order_id) REFERENCES orders(order_id),
    FOREIGN KEY(book_id) REFERENCES books(book_id)
);

-- Sample data
INSERT INTO authors(name, country) VALUES
('George Orwell','United Kingdom'),
('Jane Austen','United Kingdom'),
('Yuval Noah Harari','Israel');

INSERT INTO books(title, author_id, price, stock, published_year) VALUES
('1984', 1, 9.99, 12, 1949),
('Animal Farm', 1, 7.99, 5, 1945),
('Pride and Prejudice', 2, 8.50, 3, 1813),
('Sapiens', 3, 14.99, 7, 2011);

INSERT INTO customers(name, email) VALUES
('Alice Kumar', 'alice@example.com'),
('Rahul Singh', 'rahul@example.com');

-- Example orders
INSERT INTO orders(customer_id, order_date, total) VALUES (1, '2025-11-01', 17.98);
INSERT INTO order_items(order_id, book_id, quantity, price_at_order) VALUES (1, 1, 1, 9.99);
INSERT INTO order_items(order_id, book_id, quantity, price_at_order) VALUES (1, 2, 1, 7.99);

INSERT INTO orders(customer_id, order_date, total) VALUES (2, '2025-11-15', 14.99);
INSERT INTO order_items(order_id, book_id, quantity, price_at_order) VALUES (2, 4, 1, 14.99);

-- Helpful indices
CREATE INDEX IF NOT EXISTS idx_books_author ON books(author_id);
CREATE INDEX IF NOT EXISTS idx_order_customer ON orders(customer_id);
