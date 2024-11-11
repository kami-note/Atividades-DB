CREATE TABLE Customer_Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    restaurant_id INT,
    total_amount DECIMAL(10, 2),
    delivery_fee DECIMAL(10, 2),
    promo_id INT,
    delivery_status_id INT,
    payment_method_id INT,
    notes TEXT,
    change_amount DECIMAL(10, 2),
    address_id INT
);

CREATE TABLE Order_Items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Customer_Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Order_Item_Accompaniments (
    order_item_id INT,
    accompaniment_id INT,
    PRIMARY KEY (order_item_id, accompaniment_id),
    FOREIGN KEY (order_item_id) REFERENCES Order_Items(order_id),
    FOREIGN KEY (accompaniment_id) REFERENCES Accompaniments(id)
);

CREATE TABLE Addresses (
    address_id INT PRIMARY KEY,
    street VARCHAR(100),
    number VARCHAR(10),
    neighborhood VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    address_type VARCHAR(50)
);

CREATE TABLE Promotions (
    promo_id INT PRIMARY KEY,
    promo_name VARCHAR(100),
    discount_amount DECIMAL(10, 2),
    promo_code VARCHAR(50),
    expiration_date DATE
);

CREATE TABLE Ratings (
    rating_id INT PRIMARY KEY,
    score INT CHECK (score BETWEEN 1 AND 5),
    order_id INT,
    restaurant_id INT
);

CREATE TABLE Product_Accompaniments (
    product_id INT,
    accompaniment_id INT,
    PRIMARY KEY (product_id, accompaniment_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (accompaniment_id) REFERENCES Accompaniments(id)
);

CREATE TABLE Delivery_Statuses (
    delivery_status_id INT PRIMARY KEY,
    status_name VARCHAR(50)
);

CREATE TABLE Accompaniments (
    accompaniment_id INT PRIMARY KEY,
    accompaniment_name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2)
);

CREATE TABLE Restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    address_id INT,
    phone VARCHAR(15),
    category VARCHAR(50),
    working_hours TIME,
    is_pickup_available BOOLEAN
);

CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_type VARCHAR(50),
    category_name VARCHAR(100),
    description TEXT
);

CREATE TABLE Payment_Methods (
    payment_method_id INT PRIMARY KEY,
    payment_type VARCHAR(50)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    category_id INT,
    restaurant_id INT
);

CREATE TABLE Order_Delivery_History (
    history_id INT PRIMARY KEY,
    delivery_status_id INT,
    order_id INT,
    timestamp DATETIME,
    FOREIGN KEY (delivery_status_id) REFERENCES Delivery_Statuses(delivery_status_id),
    FOREIGN KEY (order_id) REFERENCES Customer_Orders(order_id)
);

CREATE TABLE Order_Payment_History (
    history_id INT PRIMARY KEY,
    payment_date DATE,
    payment_method_id INT,
    payment_amount DECIMAL(10, 2)
);

CREATE TABLE Restaurant_Payments (
    restaurant_id INT,
    payment_method_id INT,
    PRIMARY KEY (restaurant_id, payment_method_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id),
    FOREIGN KEY (payment_method_id) REFERENCES Payment_Methods(payment_method_id)
);
