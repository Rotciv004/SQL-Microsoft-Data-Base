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







-- lab 3


-- modify
GO
CREATE OR ALTER PROCEDURE setCustomerPhoneToBIGINT AS
BEGIN
    ALTER TABLE customers ALTER COLUMN phone BIGINT;
    PRINT 'Changed column type of phone to BIGINT in customers';
END;

GO
CREATE OR ALTER PROCEDURE revertCustomerPhoneToVARCHAR AS
BEGIN
    ALTER TABLE customers ALTER COLUMN phone VARCHAR(15);
    PRINT 'Reverted column type of phone to VARCHAR in customers';
END;


EXEC setCustomerPhoneToBIGINT;
EXEC revertCustomerPhoneToVARCHAR;

select * from employees
-- add/delete 
GO
CREATE OR ALTER PROCEDURE addEmployeeAgeColumn AS
BEGIN
    -- Verifică dacă coloana 'Age' nu există deja
    IF NOT EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_NAME = 'employees' AND COLUMN_NAME = 'Age'
    )
    BEGIN
        ALTER TABLE employees ADD Age INT;
        PRINT 'Added Age column to employees';
    END
    ELSE
    BEGIN
        PRINT 'Column Age already exists in employees';
    END
END;


GO
CREATE OR ALTER PROCEDURE removeEmployeeAgeColumn AS
BEGIN
    -- Verifică dacă coloana 'Age' există înainte de a încerca să o ștergi
    IF EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_NAME = 'employees' AND COLUMN_NAME = 'Age'
    )
    BEGIN
        ALTER TABLE employees DROP COLUMN Age;
        PRINT 'Removed Age column from employees';
    END
    ELSE
    BEGIN
        PRINT 'Column Age does not exist in employees';
    END
END;


EXEC addEmployeeAgeColumn;
EXEC removeEmployeeAgeColumn;



-- add/Remove A default Constraint
go
CREATE OR ALTER PROCEDURE addHireDateDefault AS
BEGIN
    -- Variabilă pentru numele constrângerii existente
    DECLARE @ConstraintName NVARCHAR(255);

    -- Caută numele constrângerii implicite legate de hire_date
    SELECT @ConstraintName = name
    FROM sys.default_constraints
    WHERE parent_object_id = OBJECT_ID('employees') AND parent_column_id = (
        SELECT column_id
        FROM sys.columns
        WHERE object_id = OBJECT_ID('employees') AND name = 'hire_date'
    );

    -- Dacă constrângerea există, o elimină
    IF @ConstraintName IS NOT NULL
    BEGIN
        EXEC('ALTER TABLE employees DROP CONSTRAINT ' + @ConstraintName);
        PRINT 'Dropped existing default constraint on hire_date';
    END;

    -- Adaugă constrângerea implicită
    ALTER TABLE employees ADD CONSTRAINT DF_HireDate DEFAULT GETDATE() FOR hire_date;
    PRINT 'Added default constraint for hire_date column';
END;



go
CREATE OR ALTER PROCEDURE removeHireDateDefault AS
BEGIN
    ALTER TABLE employees DROP CONSTRAINT DF_HireDate
    PRINT 'Removed default constraint for hire_date column'
END

EXEC addHireDateDefault;
EXEC removeHireDateDefault;


-- add/Remove a primaty key
go
CREATE OR ALTER PROCEDURE addPrimaryKeyToDepartments AS
BEGIN
    -- Variabilă pentru a stoca numele cheii primare
    DECLARE @PrimaryKeyName NVARCHAR(255);

    -- Verifică dacă există o cheie primară pe tabela 'departments'
    SELECT @PrimaryKeyName = name
    FROM sys.key_constraints
    WHERE parent_object_id = OBJECT_ID('departments') AND type = 'PK';

    -- Dacă nu există o cheie primară, o adaugă
    IF @PrimaryKeyName IS NULL
    BEGIN
        ALTER TABLE departments ADD CONSTRAINT PK_departments PRIMARY KEY (department_id);
        PRINT 'Added primary key to departments';
    END
    ELSE
    BEGIN
        PRINT 'Primary key already exists on departments';
    END
END;



GO
CREATE OR ALTER PROCEDURE removePrimaryKeyFromDepartments AS
BEGIN
    -- Variabile pentru numele cheilor
    DECLARE @PrimaryKeyName NVARCHAR(255);
    DECLARE @ForeignKeyName NVARCHAR(255);
    DECLARE @SQL NVARCHAR(MAX);

    -- Găsește numele cheii primare
    SELECT @PrimaryKeyName = name
    FROM sys.key_constraints
    WHERE parent_object_id = OBJECT_ID('departments') AND type = 'PK';

    -- Găsește numele cheii externe care depinde de cheia primară
    SELECT @ForeignKeyName = name
    FROM sys.foreign_keys
    WHERE referenced_object_id = OBJECT_ID('departments');

    -- Elimină cheia externă dacă există
    IF @ForeignKeyName IS NOT NULL
    BEGIN
        SET @SQL = 'ALTER TABLE employees DROP CONSTRAINT ' + QUOTENAME(@ForeignKeyName);
        EXEC sp_executesql @SQL;
        PRINT 'Dropped foreign key constraint: ' + @ForeignKeyName;
    END

    -- Elimină cheia primară dacă există
    IF @PrimaryKeyName IS NOT NULL
    BEGIN
        SET @SQL = 'ALTER TABLE departments DROP CONSTRAINT ' + QUOTENAME(@PrimaryKeyName);
        EXEC sp_executesql @SQL;
        PRINT 'Removed primary key from departments';
    END
    ELSE
    BEGIN
        PRINT 'No primary key exists on departments';
    END
END;




EXEC addPrimaryKeyToDepartments;
EXEC removePrimaryKeyFromDepartments;




-- add/remove a Candidate Key
go
CREATE OR ALTER PROCEDURE addCustomerEmailUnique AS
BEGIN
    -- Variabilă pentru a stoca numele constrângerii unice
    DECLARE @ConstraintName NVARCHAR(255);

    -- Caută constrângerea unică pentru coloana 'email' în tabelul 'customers'
    SELECT @ConstraintName = name
    FROM sys.key_constraints
    WHERE parent_object_id = OBJECT_ID('customers') AND type = 'UQ' AND name = 'UQ_CustomerEmail';

    -- Dacă constrângerea nu există, o adaugă
    IF @ConstraintName IS NULL
    BEGIN
        ALTER TABLE customers ADD CONSTRAINT UQ_CustomerEmail UNIQUE (email);
        PRINT 'Added unique constraint to email column in customers';
    END
    ELSE
    BEGIN
        PRINT 'Unique constraint UQ_CustomerEmail already exists on customers';
    END
END;



go
CREATE OR ALTER PROCEDURE removeCustomerEmailUnique AS
BEGIN
    -- Variabilă pentru a stoca numele constrângerii unice
    DECLARE @ConstraintName NVARCHAR(255);

    -- Caută constrângerea unică pentru coloana 'email' în tabelul 'customers'
    SELECT @ConstraintName = name
    FROM sys.key_constraints
    WHERE parent_object_id = OBJECT_ID('customers') AND type = 'UQ' AND name = 'UQ_CustomerEmail';

    -- Dacă constrângerea există, o elimină
    IF @ConstraintName IS NOT NULL
    BEGIN
        ALTER TABLE customers DROP CONSTRAINT UQ_CustomerEmail;
        PRINT 'Removed unique constraint from email column in customers';
    END
    ELSE
    BEGIN
        PRINT 'Unique constraint UQ_CustomerEmail does not exist on customers';
    END
END;



EXEC addCustomerEmailUnique;
EXEC removeCustomerEmailUnique;




-- Add/remove a foreign key
go
CREATE OR ALTER PROCEDURE addProductCategoryForeignKey AS
BEGIN
    ALTER TABLE products ADD CONSTRAINT FK_ProductCategory FOREIGN KEY (category_id) REFERENCES categories(category_id)
    PRINT 'Added foreign key between products and categories'
END


go
CREATE OR ALTER PROCEDURE removeProductCategoryForeignKey AS
BEGIN
    ALTER TABLE products DROP CONSTRAINT FK_ProductCategory
    PRINT 'Removed foreign key between products and categories'
END

EXEC addProductCategoryForeignKey;
EXEC removeProductCategoryForeignKey;



-- Create/Drop a Table
go
CREATE OR ALTER PROCEDURE createCustomerBackupTable AS
BEGIN
    CREATE TABLE CustomerBackup (
        customer_id INT PRIMARY KEY,
        first_name VARCHAR(255),
        last_name VARCHAR(255),
        email VARCHAR(255),
        phone VARCHAR(15)
    )
    PRINT 'Created CustomerBackup table'
END

go
CREATE OR ALTER PROCEDURE dropCustomerBackupTable AS
BEGIN
    -- Verifică dacă tabelul 'CustomerBackup' există
    IF EXISTS (
        SELECT 1 -- nu tinem cont de datele din tabel doar vrem sa verificam existenta tabelelor
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_NAME = 'CustomerBackup' AND TABLE_SCHEMA = 'dbo'
    )
    BEGIN
        DROP TABLE CustomerBackup;
        PRINT 'Dropped CustomerBackup table';
    END
    ELSE
    BEGIN
        PRINT 'CustomerBackup table does not exist';
    END
END;



EXEC createCustomerBackupTable;
EXEC dropCustomerBackupTable;



--Version Setup
GO
CREATE OR ALTER PROCEDURE dropVersioningTable AS
BEGIN
    -- Verifică dacă tabelul 'VersioningTable' există
    IF EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_NAME = 'VersioningTable' AND TABLE_SCHEMA = 'dbo'
    )
    BEGIN
        DROP TABLE VersioningTable;
        PRINT 'Dropped VersioningTable';
    END
    ELSE
    BEGIN
        PRINT 'VersioningTable does not exist';
    END
END;


GO
CREATE OR ALTER PROCEDURE createVersioningTable AS
BEGIN
    -- Verifică dacă tabelul 'VersioningTable' există
    IF NOT EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_NAME = 'VersioningTable' AND TABLE_SCHEMA = 'dbo'
    )
    BEGIN
        CREATE TABLE VersioningTable (
            Current_Procedure VARCHAR(100),
            Previous_Procedure VARCHAR(100),
            versionTO INT UNIQUE
        );
        PRINT 'Created VersioningTable';
    END
    ELSE
    BEGIN
        PRINT 'VersioningTable already exists';
    END
END;


GO
CREATE OR ALTER PROCEDURE insertIntoVersioningTable AS
BEGIN
    -- Inserează datele dacă tabelul există
    IF EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_NAME = 'VersioningTable' AND TABLE_SCHEMA = 'dbo'
    )
    BEGIN
        -- Șterge înregistrările existente pentru a evita duplicările (opțional)
        DELETE FROM VersioningTable;

        -- Inserează valorile specificate
        INSERT INTO VersioningTable (Current_Procedure, Previous_Procedure, versionTO)
		VALUES
		('setCustomerPhoneToBIGINT', 'revertCustomerPhoneToVARCHAR', 1),       -- Modifică telefonul în customers
		('addEmployeeAgeColumn', 'removeEmployeeAgeColumn', 2),               -- Adaugă/șterge coloana Age
		('addHireDateDefault', 'removeHireDateDefault', 3),                   -- Adaugă/șterge constrângerea implicită pe hire_date
		('addPrimaryKeyToDepartments', 'removePrimaryKeyFromDepartments', 4), -- Adaugă/șterge cheia primară în departments
		('addCustomerEmailUnique', 'removeCustomerEmailUnique', 5),           -- Adaugă/șterge constrângerea unică pe email
		('addProductCategoryForeignKey', 'removeProductCategoryForeignKey', 6), -- Adaugă/șterge cheia externă între products și categories
		('createCustomerBackupTable', 'dropCustomerBackupTable', 7);          -- Creează/șterge tabelul de backup CustomerBackup


        PRINT 'Inserted data into VersioningTable';
    END
    ELSE
    BEGIN
        PRINT 'VersioningTable does not exist. Cannot insert data.';
    END
END;

EXEC dropVersioningTable;
EXEC createVersioningTable;
EXEC insertIntoVersioningTable;


CREATE TABLE CurrentVersion (
    currentVersion INT DEFAULT 0
)

INSERT INTO CurrentVersion VALUES (0)

GO
CREATE OR ALTER PROCEDURE goToVersion(@version INT)
AS
BEGIN
    DECLARE @currentVersion INT;
    DECLARE @currentProcedure NVARCHAR(255); -- Variabilă pentru stocarea numelui procedurii

    -- Verificare validitate versiune
    IF @version < 0 OR @version > 7   
    BEGIN
        RAISERROR('Invalid version number!', 17, 1);
        RETURN;
    END;

    -- Obține versiunea curentă
    SELECT @currentVersion = currentVersion FROM CurrentVersion;

    -- Evită executarea redundantă
    IF @currentVersion = @version
    BEGIN
        PRINT 'Already at version ' + CAST(@version AS NVARCHAR(10));
        RETURN;
    END;

    -- Dacă mergem înainte
    IF @version > @currentVersion
    BEGIN
        WHILE @currentVersion < @version
        BEGIN
            -- Obține procedura curentă
            SELECT @currentProcedure = Current_Procedure
            FROM VersioningTable
            WHERE versionTO = @currentVersion + 1;

            -- Execută procedura curentă
            EXEC sp_executesql @currentProcedure;

            -- Actualizează versiunea curentă
            SET @currentVersion = @currentVersion + 1;
        END;
    END
    -- Dacă mergem înapoi
    ELSE IF @version < @currentVersion
    BEGIN
        WHILE @currentVersion > @version
        BEGIN
            -- Obține procedura anterioară
            SELECT @currentProcedure = Previous_Procedure
            FROM VersioningTable
            WHERE versionTO = @currentVersion;

            -- Execută procedura anterioară
            EXEC sp_executesql @currentProcedure;

            -- Actualizează versiunea curentă
            SET @currentVersion = @currentVersion - 1;
        END;
    END;

    -- Actualizează tabelul CurrentVersion
    UPDATE CurrentVersion SET currentVersion = @currentVersion;

    -- Confirmă schimbarea versiunii
    PRINT 'Current version updated to: ' + CAST(@currentVersion AS NVARCHAR(10));
END;





SELECT * 
FROM sys.objects 
WHERE object_id = OBJECT_ID(N'goToVersion') 
  AND type IN (N'P', N'PC');


UPDATE CurrentVersion SET currentVersion = 0;

EXEC goToVersion 1;
EXEC goToVersion 0;
EXEC goToVersion 7;






--lab 4

SELECT 
    fk.name AS foreign_key_name,
    tp.name AS parent_table,
    cp.name AS parent_column,
    tr.name AS referenced_table,
    cr.name AS referenced_column
FROM 
    sys.foreign_keys AS fk
INNER JOIN 
    sys.foreign_key_columns AS fkc ON fk.object_id = fkc.constraint_object_id
INNER JOIN 
    sys.tables AS tp ON fkc.parent_object_id = tp.object_id
INNER JOIN 
    sys.columns AS cp ON fkc.parent_object_id = cp.object_id AND fkc.parent_column_id = cp.column_id
INNER JOIN 
    sys.tables AS tr ON fkc.referenced_object_id = tr.object_id
INNER JOIN 
    sys.columns AS cr ON fkc.referenced_object_id = cr.object_id AND fkc.referenced_column_id = cr.column_id
WHERE 
    tr.name = 'TestRunsTables';

ALTER TABLE TestRunTables DROP CONSTRAINT FK__TestRunTa__test___1DD065E0;
ALTER TABLE TestRunViews DROP CONSTRAINT FK__TestRunVi__test___21A0F6C4;


drop table TestRunViews;


-- Tabele pentru gestionarea testelor
CREATE TABLE TestRuns (
    TestRunID INT PRIMARY KEY IDENTITY(1, 1),
    Description NVARCHAR(2000),
    StartAt DATETIME2,
    EndAt DATETIME2
);

CREATE TABLE TestTables (
    TestID INT NOT NULL,
    TableID NVARCHAR(255),
    NoOfRows INT NOT NULL,
    Position INT NOT NULL,
    PRIMARY KEY (TestID, TableID)
);

CREATE TABLE TestViews (
    TestID INT NOT NULL,
    ViewName NVARCHAR(255),
    PRIMARY KEY (TestID, ViewName)
);

CREATE TABLE Tests (
    TestID INT PRIMARY KEY IDENTITY(1, 1),
    Name NVARCHAR(255) NOT NULL
);



CREATE OR ALTER PROCEDURE AddToTestTables (
    @TestID INT,
    @TableName NVARCHAR(255),
    @NoOfRows INT,
    @Position INT
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @TableName)
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM TestTables WHERE TableID = @TableName AND TestID = @TestID)
        BEGIN
            INSERT INTO TestTables (TestID, TableID, NoOfRows, Position)
            VALUES (@TestID, @TableName, @NoOfRows, @Position);
            PRINT CONCAT('Table ', @TableName, ' added to TestTables.');
        END
        ELSE
        BEGIN
            PRINT CONCAT('Table ', @TableName, ' already exists in TestTables.');
        END
    END
    ELSE
    BEGIN
        PRINT CONCAT('Table ', @TableName, ' does not exist in the database.');
    END
END;
GO





CREATE OR ALTER PROCEDURE AddToTestViews (
    @TestID INT,
    @ViewName NVARCHAR(255)
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = @ViewName)
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM TestViews WHERE ViewName = @ViewName AND TestID = @TestID)
        BEGIN
            INSERT INTO TestViews (TestID, ViewName)
            VALUES (@TestID, @ViewName);
            PRINT CONCAT('View ', @ViewName, ' added to TestViews.');
        END
        ELSE
        BEGIN
            PRINT CONCAT('View ', @ViewName, ' already exists in TestViews.');
        END
    END
    ELSE
    BEGIN
        PRINT CONCAT('View ', @ViewName, ' does not exist in the database.');
    END
END;
GO




CREATE OR ALTER PROCEDURE AddToTests (
    @TestName NVARCHAR(255)
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Tests WHERE Name = @TestName)
    BEGIN
        PRINT CONCAT('Test ', @TestName, ' already exists.');
    END
    ELSE
    BEGIN
        INSERT INTO Tests (Name)
        VALUES (@TestName);
        PRINT CONCAT('Test ', @TestName, ' added successfully.');
    END
END;
GO





CREATE OR ALTER PROCEDURE RunTest (
    @TestName NVARCHAR(255)
)
AS
BEGIN
    DECLARE @TestID INT, @TableID NVARCHAR(255), @ViewName NVARCHAR(255);
    DECLARE @StartAt DATETIME2, @EndAt DATETIME2, @Description NVARCHAR(2000);
    DECLARE @TestRunID INT;

    SELECT @TestID = TestID FROM Tests WHERE Name = @TestName;
    IF @TestID IS NULL
    BEGIN
        PRINT CONCAT('Test ', @TestName, ' not found.');
        RETURN;
    END

    -- Creare test run
    SET @StartAt = SYSDATETIME();
    SET @Description = CONCAT('Test results for: ', @TestName);
    INSERT INTO TestRuns (Description, StartAt) 
    VALUES (@Description, @StartAt);

    SELECT @TestRunID = SCOPE_IDENTITY();

    -- Procesare tabele
    IF EXISTS (SELECT 1 FROM TestTables WHERE TestID = @TestID)
    BEGIN
        DECLARE TableCursor CURSOR FOR
            SELECT TableID FROM TestTables WHERE TestID = @TestID ORDER BY Position;

        OPEN TableCursor;
        FETCH NEXT FROM TableCursor INTO @TableID;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            PRINT CONCAT('Processing table: ', @TableID);
            FETCH NEXT FROM TableCursor INTO @TableID;
        END

        CLOSE TableCursor;
        DEALLOCATE TableCursor;
    END
    ELSE
    BEGIN
        PRINT 'No tables associated with this test.';
    END

    -- Procesare vizualizări
    IF EXISTS (SELECT 1 FROM TestViews WHERE TestID = @TestID)
    BEGIN
        DECLARE ViewCursor CURSOR FOR
            SELECT ViewName FROM TestViews WHERE TestID = @TestID;

        OPEN ViewCursor;
        FETCH NEXT FROM ViewCursor INTO @ViewName;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            PRINT CONCAT('Executing view: ', @ViewName);
            EXEC('SELECT * FROM ' + @ViewName);
            FETCH NEXT FROM ViewCursor INTO @ViewName;
        END

        CLOSE ViewCursor;
        DEALLOCATE ViewCursor;
    END
    ELSE
    BEGIN
        PRINT 'No views associated with this test.';
    END

    -- Finalizare test run
    SET @EndAt = SYSDATETIME();
    UPDATE TestRuns SET EndAt = @EndAt WHERE TestRunID = @TestRunID;
    PRINT CONCAT('Test ', @TestName, ' completed.');
END;
GO







CREATE OR ALTER VIEW CategoriesView AS
SELECT * FROM categories;
GO


EXEC AddToTests 'Test Categories';
DECLARE @TestID INT;
SELECT @TestID = TestID FROM Tests WHERE Name = 'Test Categories';

EXEC AddToTestTables @TestID, 'categories', 100, 1;
EXEC AddToTestViews @TestID, 'CategoriesView';


EXEC RunTest 'Test Categories';



CREATE OR ALTER VIEW ProductsAndSuppliers AS
SELECT p.product_name, s.supplier_name
FROM products p
INNER JOIN suppliers s ON p.supplier_id = s.supplier_id;
GO


EXEC AddToTests 'Test Products and Suppliers';
DECLARE @TestID INT;
SELECT @TestID = TestID FROM Tests WHERE Name = 'Test Products and Suppliers';

EXEC AddToTestTables @TestID, 'products', 50, 2;
EXEC AddToTestTables @TestID, 'suppliers', 20, 3;
EXEC AddToTestViews @TestID, 'ProductsAndSuppliers';


EXEC RunTest 'Test Products and Suppliers';


SELECT * FROM TestRuns;
SELECT * FROM TestTables;
SELECT * FROM TestViews;






-- tema 5



CREATE TABLE Ta (
    aid INT PRIMARY KEY, -- clustered index
    a2 INT UNIQUE	-- index unic
);


--inseram valori pentru Ta
DECLARE @i INT = 1;
WHILE @i <= 1000
BEGIN
    INSERT INTO Ta (aid, a2)
    VALUES (@i, @i * 10); 
    SET @i = @i + 1;
END;

SELECT COUNT(*) AS TotalRows_Ta FROM Ta;
SELECT * FROM Ta;

CREATE TABLE Tb (
    bid INT PRIMARY KEY, --clustered index
    b2 INT
);

--inseram date in Tb
DECLARE @j INT = 1;
WHILE @j <= 1000
BEGIN
    INSERT INTO Tb (bid, b2)
    VALUES (@j, @j * 5); 
    SET @j = @j + 1;
END;

SELECT COUNT(*) AS TotalRows_Tb FROM Tb;
SELECT * FROM Tb;


CREATE TABLE Tc (
    cid INT PRIMARY KEY, --clustered index
    aid INT,
    bid INT,
    FOREIGN KEY (aid) REFERENCES Ta(aid),
    FOREIGN KEY (bid) REFERENCES Tb(bid)
);
-- inseram date in Tc
DECLARE @k INT = 1;
WHILE @k <= 1000
BEGIN
    INSERT INTO Tc (cid, aid, bid)
    VALUES (@k, @k, @k); 
    SET @k = @k + 1;
END;


SELECT COUNT(*) AS TotalRows_Tc FROM Tc;
SELECT * FROM Tb;


--clustered index creat implicit prin declarare in tabela Ta
SELECT * FROM Ta ORDER BY aid;

--clustered index seek pe o cautarte specifica in tabelul Ta
SELECT * FROM Ta WHERE aid = 2;

--non clustered index facut pe tabela Ta pe coloana a2
CREATE NONCLUSTERED INDEX IDX_Ta_a2 ON Ta(a2);

SELECT * FROM Ta WHERE a2 BETWEEN 100 AND 300;

--non clustered index pe o valoare specifica
SELECT * FROM Ta WHERE a2 = 200;



--tabela Tb

SELECT * FROM Tb WHERE b2 = 500;


CREATE NONCLUSTERED INDEX IDX_Tb_b2 ON Tb(b2);
SELECT * FROM Tb WHERE b2 = 500;


-- view care uneste Ta cu Tc
CREATE OR ALTER VIEW V_Ta_Tc AS
SELECT Ta.aid, Ta.a2, Tc.cid, Tc.bid
FROM Ta
INNER JOIN Tc ON Ta.aid = Tc.aid;

SELECT * FROM V_Ta_Tc ORDER BY a2;


CREATE NONCLUSTERED INDEX IDX_Tc_aid ON Tc(aid);
CREATE NONCLUSTERED INDEX IDX_Tc_bid ON Tc(bid);

SELECT * FROM V_Ta_Tc ORDER BY a2;