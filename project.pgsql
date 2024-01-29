-- CREATE DATABASE shop; 

-- №1. Таблица Категории (categories)

CREATE TABLE categories 
(
    category_id SERIAL PRIMARY KEY, 
    category_name VARCHAR(128) NOT NULL
);

-- №2. Таблица Производители товара (manufacturers)

CREATE TABLE manufacturers
(
    manufacturer_id SERIAL PRIMARY KEY, 
    manufacturer_name VARCHAR(128) NOT NULL
);

-- №3. Таблица Товары (products)
-- Связь с категориями и производителями - 1 ко многим

CREATE TABLE products
(
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(256)  NOT NULL,
    category_id INTEGER REFERENCES categories (category_id),
    manufacturer_id INTEGER REFERENCES manufacturers (manufacturer_id)
);

-- №4. Таблица Покупатели (customers)

CREATE TABLE customers
(
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(128) NOT NULL
);

-- №5. Таблица Заказы (orders)
-- Связь с покупателями - 1 ко многим

CREATE TABLE orders
(
    orders_id SERIAL PRIMARY KEY,
    orders_date DATE NOT NULL,
    customer_id INTEGER REFERENCES customers (customer_id)
);

-- №6. Таблица Детали заказов (orders_detalis)
-- Связь с заказами и товарами - многие ко многим

CREATE TABLE orders_detalis
(
    product_id INTEGER REFERENCES products (product_id),
    orders_id INTEGER REFERENCES orders (orders_id),
    PRIMARY KEY (product_id, orders_id),
    product_count INTEGER DEFAULT 0,
    product_price DECIMAL(10, 2)
);
