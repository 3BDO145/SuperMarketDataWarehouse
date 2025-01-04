CREATE DATABASE Super_market ;
USE Super_market;


CREATE TABLE Branch_Dimension (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(255),
    city VARCHAR(255)
);


CREATE TABLE Customer_Dimension (
    customer_id INT PRIMARY KEY,
    customer_type VARCHAR(50),
    gender VARCHAR(10)
);


CREATE TABLE Product_Line_Dimension (
    product_line_id INT PRIMARY KEY,
    product_line_name VARCHAR(200)
);


CREATE TABLE Payment_Dimension (
    payment_id INT PRIMARY KEY,
    payment_method VARCHAR(50)
);


CREATE TABLE Date_Dimension (
    date_id INT PRIMARY KEY,
    date DATE,
    month INT,
    year INT,
    quarter INT,
    day_of_week INT
);


CREATE TABLE Sales_Fact (
    invoice_id INT PRIMARY KEY,
    branch_id int,
    customer_id INT,
    product_line_id INT,
    payment_id INT,
    date_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    tax_5_percent DECIMAL(10, 2),
    total DECIMAL(10, 2),
    cogs DECIMAL(10, 2),
    gross_income DECIMAL(10, 2),
    gross_margin_percentage DECIMAL(10, 2),
    rating DECIMAL(3, 2),
    FOREIGN KEY (branch_id) REFERENCES Branch_Dimension(branch_id),
    FOREIGN KEY (customer_id) REFERENCES Customer_Dimension(customer_id),
    FOREIGN KEY (product_line_id) REFERENCES Product_Line_Dimension(product_line_id),
    FOREIGN KEY (payment_id) REFERENCES Payment_Dimension(payment_id),
    FOREIGN KEY (date_id) REFERENCES Date_Dimension(date_id)
);
ALTER TABLE Sales_Fact MODIFY COLUMN Invoice_ID VARCHAR(255);
ALTER TABLE Sales_Fact MODIFY COLUMN Rating DECIMAL(3,1);

