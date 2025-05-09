-- ============================================
-- Objective
-- ============================================
-- This project is aimed at practicing advanced SQL queries using a commercial database schema.
-- It involves querying, filtering, aggregating, and manipulating data based on real-world scenarios.

-- ============================================
-- Database Schema Description
-- ============================================

-- Tables and their structures:

-- CATEGORIES (CATEGORY_CODE, CATEGORY_NAME, DESCRIPTION)
-- CUSTOMERS (CUSTOMER_CODE, COMPANY, ADDRESS, CITY, POSTAL_CODE, COUNTRY, PHONE, FAX)
-- ORDERS (ORDER_NUMBER, CUSTOMER_CODE#, EMPLOYEE_NUMBER#, ORDER_DATE, SHIP_DATE, SHIPPING_COST)
-- ORDER_DETAILS (ORDER_NUMBER#, PRODUCT_REF#, UNIT_PRICE, QUANTITY, DISCOUNT)
-- EMPLOYEES (EMPLOYEE_NUMBER, REPORTS_TO#, LAST_NAME, FIRST_NAME, POSITION, TITLE, BIRTH_DATE, HIRE_DATE, SALARY, COMMISSION)
-- SUPPLIERS (SUPPLIER_NUMBER, COMPANY, ADDRESS, CITY, POSTAL_CODE, COUNTRY, PHONE, FAX)
-- PRODUCTS (PRODUCT_REF, PRODUCT_NAME, SUPPLIER_NUMBER#, CATEGORY_CODE#, QUANTITY, UNIT_PRICE, UNITS_IN_STOCK, UNITS_ON_ORDER, UNAVAILABLE)

-- Notes:
-- COMPANY: Name of the customer or supplier company
-- SHIPPING_COST: Shipping charges
-- REPORTS_TO: Supervisor’s employee number
-- QUANTITY: Packaging type (e.g., boxes, bottles, cartons)
-- UNITS_IN_STOCK: Available quantity
-- UNITS_ON_ORDER: Quantity ordered
-- UNAVAILABLE: 0 for available products, -1 if not available

-- ============================================
-- Instructions
-- ============================================

-- 0. Execute the script ➡️ commercial.sql

-- 1. Display male employees in descending order of seniority 
--    whose net salary (salary + commission) is >= 8000.
--    Columns: Employee Number, First Name, Last Name, Age, Seniority

-- 2. Display products where:
--    C1: quantity includes 'bottle(s)'
--    C2: third character of name is 't' or 'T'
--    C3: supplier number is 1, 2, or 3
--    C4: unit price between 70 and 200
--    C5: units ordered is NOT NULL
--    Columns: product number, product name, supplier number, units ordered, unit price

-- 3. Display customers in same region as supplier 1 
--    (same country, city, and last 3 digits of postal code).
--    Use a single subquery. Return all columns from CUSTOMERS.

-- 4. For each order number between 10998 and 11003:
--    - Display new discount rate based on:
--         0% if total <= 2000
--         5% if 2001–10000
--         10% if 10001–40000
--         15% if 40001–80000
--         20% otherwise
--    - Add message:
--         "apply old discount rate" if order number is 10000–10999
--         "apply new discount rate" otherwise
--    Columns: order number, new discount rate, discount rate application note

-- 5. Display suppliers of beverage products.
--    Columns: supplier number, company, address, phone number

-- 6. Display customers from Berlin who ordered at most 1 dessert product.
--    Column: customer code

-- 7. Display customers in France and total order amounts 
--    for Mondays in April 1998.
--    Include those with no orders.
--    Columns: customer number, company name, phone number, total amount, country

-- 8. Display customers who ordered all products.
--    Columns: customer code, company name, telephone number

-- 9. Display for each customer from France the number of orders placed.
--    Columns: customer code, number of orders

-- 10. Display the number of orders in 1996 and 1997, and the difference.
--     Columns: orders in 1996, orders in 1997, difference

-- ============================================
-- End of Description
-- ============================================

-- Now you can begin writing the SQL queries below.
