-- Create the database
CREATE DATABASE DutyFreeShop;

USE DutyFreeShop;



-- Table for categories of products
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

INSERT INTO categories (category_id, category_name)
VALUES 
(1, 'Cosmetics'), 
(2, 'Electronics'), 
(3, 'Perfumes'), 
(4, 'Alcohol'), 
(5, 'Tobacco'), 
(6, 'Luxury Watches');



-- Table for suppliers
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(255) NOT NULL,
    contact_email VARCHAR(255)
);

INSERT INTO suppliers (supplier_id, supplier_name, contact_email)
VALUES 
(1, 'L Oréal', 'contact@loreal.com'),  
(2, 'Apple', 'support@apple.com'),     
(3, 'Chanel', 'info@chanel.com'),       
(4, 'Johnnie Walker', 'sales@johnniewalker.com'), 
(5, 'Philip Morris', 'support@philipmorris.com'), 
(6, 'Rolex', 'info@rolex.com');    



-- Table for products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    quantity_in_stock INT NOT NULL,
    category_id INT,
    supplier_id INT,
    shelf_id INT,
    warehouse_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
    FOREIGN KEY (shelf_id) REFERENCES shelves(shelf_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

INSERT INTO products (product_id, product_name, price, quantity_in_stock, category_id, supplier_id, shelf_id, warehouse_id)
VALUES 
(1, 'Lipstick', 20.50, 100, 1, 1, 1, 1),
(2, 'Smartphone', 999.99, 50, 2, 2, 2, 2),
(3, 'Eau de Parfum', 75.00, 200, 3, 3, 3, 1),
(4, 'Whiskey 18y', 150.00, 60, 4, 4, 4, 2),
(5, 'Cigarettes Pack', 10.00, 300, 5, 5, 5, 1),
(6, 'Luxury Watch', 5000.00, 10, 6, 6, 5, 2),
(7, 'Foundation', 35.00, 120, 1, 1, 1, 1),
(8, 'Tablet', 750.00, 45, 2, 2, 2, 2);



-- Table for employees
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    hire_date DATE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, department_id)
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com', '2020-01-15', 1),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '2021-05-22', 2),
(3, 'Paul', 'Jones', 'paul.jones@example.com', '2023-03-01', 1),
(4, 'Emily', 'Clark', 'emily.clark@example.com', '2019-11-30', 3),
(5, 'Michael', 'Brown', 'michael.brown@example.com', '2020-07-10', 2),
(6, 'Sophie', 'White', 'sophie.white@example.com', '2022-09-12', 3);



-- Table for departments
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);

INSERT INTO departments (department_id, department_name)
VALUES 
(1, 'Sales'), 
(2, 'Customer Service'), 
(3, 'Management'), 
(4, 'Logistics'), 
(5, 'HR');



-- Table for customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(15)
);

INSERT INTO customers (customer_id, first_name, last_name, email, phone)
VALUES 
(1, 'Alice', 'Brown', 'alice.brown@example.com', '1234567890'), 
(2, 'Bob', 'Johnson', 'bob.johnson@example.com', '0987654321'),
(3, 'Charlie', 'Davis', 'charlie.davis@example.com', '1231231234'),
(4, 'Diana', 'Wilson', 'diana.wilson@example.com', '3213214321'),
(5, 'Eve', 'Martinez', 'eve.martinez@example.com', '5554443333'),
(6, 'Frank', 'Taylor', 'frank.taylor@example.com', '6667778888');



-- Table for shelves
CREATE TABLE shelves (
    shelf_id INT PRIMARY KEY,
    shelf_location VARCHAR(255) NOT NULL
);

INSERT INTO shelves (shelf_id, shelf_location)
VALUES 
(1, 'Aisle 1 - Top Shelf'), 
(2, 'Aisle 2 - Middle Shelf'), 
(3, 'Aisle 3 - Bottom Shelf'),
(4, 'Aisle 4 - Corner Shelf'),
(5, 'Aisle 5 - Main Display');


-- Table for warehouses
CREATE TABLE warehouses (
    warehouse_id INT PRIMARY KEY,
    warehouse_location VARCHAR(255) NOT NULL
);

INSERT INTO warehouses (warehouse_id, warehouse_location)
VALUES 
(1, 'Main Warehouse'), 
(2, 'Overflow Warehouse'), 
(3, 'Remote Storage Unit');



-- Table for orders (placed by customers)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT,
    employee_id INT,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO orders (order_id, order_date, customer_id, employee_id, total_amount)
VALUES 
(1, '2024-10-22', 1, 1, 120.50), 
(2, '2024-10-21', 2, 2, 75.00),
(3, '2024-10-20', 3, 3, 200.00),
(4, '2024-10-19', 4, 4, 450.00),
(5, '2024-10-18', 5, 5, 30.00),
(6, '2024-10-17', 6, 6, 600.00);



-- Table for order items (link between products and orders)
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price)
VALUES 
(1, 1, 1, 2, 20.50), 
(2, 2, 3, 1, 75.00),
(3, 3, 4, 1, 150.00),
(4, 4, 6, 1, 5000.00),
(5, 5, 5, 3, 10.00),
(6, 6, 2, 1, 999.99),
(7, 6, 7, 1, 35.00);


-- Update product prices, setting a 10% discount for products in stock greater than 50, except for 'Luxury Watches'
UPDATE products
SET price = price * 0.9
WHERE quantity_in_stock > 50
AND product_name NOT LIKE '%Watch%';

-- Delete orders made by customers whose first name starts with 'B' or 'D' and placed on or before '2024-10-20'
DELETE FROM orders
WHERE customer_id IN (
    SELECT customer_id
    FROM customers
    WHERE first_name LIKE 'B%' OR first_name LIKE 'D%'
)
AND order_date <= '2024-10-20';

-- a.1 UNION with OR
SELECT customer_id, first_name, last_name
FROM customers
WHERE first_name LIKE 'A%'
UNION
SELECT customer_id, first_name, last_name
FROM customers
WHERE last_name LIKE 'B%';

-- a.2 UNION ALL with OR
SELECT product_name, price
FROM products
WHERE price > 10
UNION ALL
SELECT product_name, price
FROM products
WHERE quantity_in_stock < 100;


-- b.1 INTERSECT with IN
SELECT product_name
FROM products
WHERE category_id IN (1, 3)
INTERSECT
SELECT product_name
FROM products
WHERE supplier_id IN (1, 3);

-- b.2 INTERSECT with IN
SELECT order_id
FROM order_items
WHERE quantity >= 2
INTERSECT
SELECT order_id
FROM orders
WHERE total_amount > 100;


-- c.1 EXCEPT with NOT IN
SELECT product_id
FROM products
WHERE category_id = 1
EXCEPT
SELECT product_id
FROM order_items
WHERE order_id NOT IN (1, 3);

-- c.2 NOT IN
SELECT customer_id
FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders WHERE total_amount > 200);


-- d.1 INNER JOIN with 3 tables
SELECT o.order_id, c.first_name, e.first_name, p.product_name
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id;

-- d.2 LEFT JOIN with many-to-many relationships
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

-- d.3 RIGHT JOIN
SELECT p.product_name, s.supplier_name
FROM products p
RIGHT JOIN suppliers s ON p.supplier_id = s.supplier_id;

-- d.4 FULL JOIN (for databases supporting FULL JOIN)
SELECT c.first_name, o.order_id
FROM customers c
FULL JOIN orders o ON c.customer_id = o.customer_id;


-- e.1 Simple IN with subquery in WHERE clause
SELECT customer_id, first_name, last_name
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders WHERE total_amount > 100);

-- e.2 Nested subquery in WHERE clause
SELECT product_id, product_name
FROM products
WHERE product_id IN (
    SELECT product_id
    FROM order_items
    WHERE order_id IN (
        SELECT order_id
        FROM orders
        WHERE total_amount > 100
    )
);


-- f.1 EXISTS with WHERE clause
SELECT first_name, last_name
FROM employees
WHERE EXISTS (SELECT * FROM orders WHERE orders.employee_id = employees.employee_id);

-- f.2 EXISTS with WHERE clause and a subquery
SELECT product_name
FROM products p
WHERE EXISTS (SELECT * FROM order_items oi WHERE oi.product_id = p.product_id AND oi.quantity > 1);


-- g.1 Subquery in FROM clause
SELECT avg_price
FROM (SELECT AVG(price) as avg_price FROM products) as product_avg;

-- g.2 Subquery with additional calculations in FROM clause
SELECT category_id, total_stock
FROM (SELECT category_id, SUM(quantity_in_stock) as total_stock FROM products GROUP BY category_id) as category_stock
WHERE total_stock > 50;


-- h.1 Group by category with COUNT
SELECT category_id, COUNT(product_id) AS product_count
FROM products
GROUP BY category_id;

-- h.2 Group by supplier and HAVING with subquery
SELECT supplier_id, COUNT(product_id) AS product_count
FROM products
GROUP BY supplier_id
HAVING product_count > (SELECT AVG(quantity_in_stock) FROM products);

-- h.3 Group by warehouse and HAVING with MAX and subquery
SELECT warehouse_id, MAX(price) as max_price
FROM products
GROUP BY warehouse_id
HAVING MAX(price) > (SELECT AVG(price) FROM products);

-- h.4 Group by department with SUM and HAVING
SELECT department_id, SUM(total_amount) as department_sales
FROM orders
GROUP BY department_id
HAVING SUM(total_amount) > 100;


-- i.1 Using ANY with subquery
SELECT product_name, price
FROM products
WHERE price > ANY (SELECT price FROM products WHERE category_id = 3);

-- i.2 Using ALL with subquery
SELECT product_name, price
FROM products
WHERE price < ALL (SELECT price FROM products WHERE category_id = 2);

-- i.3 Rewriting ANY query using aggregation
SELECT product_name, price
FROM products
WHERE price > (SELECT MIN(price) FROM products WHERE category_id = 3);

-- i.4 Rewriting ALL query using aggregation
SELECT product_name, price
FROM products
WHERE price < (SELECT MAX(price) FROM products WHERE category_id = 2);


-- Using DISTINCT and ORDER BY
SELECT DISTINCT supplier_id, price
FROM products
ORDER BY price DESC;

-- Using TOP with DISTINCT
SELECT DISTINCT TOP 3 product_name, price
FROM products
WHERE quantity_in_stock > 50
ORDER BY price DESC;

-- Another TOP with arithmetic expression
SELECT TOP 5 product_name, price * 0.9 AS discounted_price
FROM products
WHERE category_id = 1
ORDER BY discounted_price ASC;









-- Procedura pentru a adăuga un test nou
CREATE PROCEDURE AddTest (
    test_name VARCHAR(255),
    description TEXT
)
BEGIN
    INSERT INTO Tests (Name, Description)
    VALUES (test_name, description);
END;

-- Procedura pentru a adăuga tabele implicate într-un test
CREATE PROCEDURE AddTestTable (
    test_id INT,
    table_id INT,
    position INT,
    no_of_rows INT
)
BEGIN
    INSERT INTO TestTables (TestID, TableID, NoOfRows, Position)
    VALUES (test_id, table_id, no_of_rows, position);
END;

-- Procedura pentru a adăuga o vizualizare într-un test
CREATE PROCEDURE AddTestView (
    test_id INT,
    view_id INT
)
BEGIN
    INSERT INTO TestViews (TestID, ViewID)
    VALUES (test_id, view_id);
END;

-- Procedura pentru a rula un test
CREATE PROCEDURE RunTest (
    test_id INT
)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE table_id INT;
    DECLARE no_of_rows INT;
    DECLARE cur CURSOR FOR
        SELECT TableID, NoOfRows FROM TestTables WHERE TestID = test_id ORDER BY Position DESC;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Șterge datele din tabele în ordinea specificată
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO table_id, no_of_rows;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SET @sql = CONCAT('DELETE FROM ', (SELECT Name FROM Tables WHERE TableID = table_id));
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END LOOP;
    CLOSE cur;

    -- Inserează date în tabele în ordinea inversă
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO table_id, no_of_rows;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SET @sql = CONCAT('INSERT INTO ', (SELECT Name FROM Tables WHERE TableID = table_id), ' SELECT * FROM ', (SELECT Name FROM Tables WHERE TableID = table_id), '_backup LIMIT ', no_of_rows);
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END LOOP;
    CLOSE cur;

    -- Evaluare vizualizări
    INSERT INTO TestRuns (TestID, StartAt) VALUES (test_id, NOW());
    SET @run_id = LAST_INSERT_ID();
    INSERT INTO TestRunViews (TestRunID, ViewID, StartAt)
    SELECT @run_id, ViewID, NOW() FROM TestViews WHERE TestID = test_id;
END;
