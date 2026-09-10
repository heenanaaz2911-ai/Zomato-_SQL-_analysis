use zomato_db;
create table restaurants(restaurant_id Int primary key, restaurant_name  varchar(50), city varchar(50), cuisine varchar(20), rating Decimal(2));
 Create table users ( user_id Int primary key, user_name varchar(50), city Varchar(20));
create table orders(order_id int primary key, user_id int, restaurant_id int , Order_amount int,Order_date int, delivery_time_mins Int, foreign key (user_id)references users(user_id), foreign key (restaurant_id)references restaurants(restaurant_id));
Insert into restaurants values
 (1, "Biryani House", "Patna", "Biryani", 4.5),
(2,"Litti King", "Patna","Bihari", 4.3),
 (3, "Cafe Ranchi", "Ranchi", "Cafe", 4.4),
 (4,"Dosa Plaza", "Patna", "South Indian", 4.4),
(5, "Punjabi Tadka", "Ranchi", "North Indian", 4.6);
iNSERT INTO users VALUES
(101, 'Heena', 'Patna'),
(102, 'Aman', 'Patna'),
(103, 'Priya', 'Ranchi'),
(104, 'Rahul', 'Patna');

INSERT INTO orders VALUES
(1, 101, 1, 450, '2026-09-01', 30),
(2, 101, 2, 200, '2026-09-02', 25),
(3, 102, 1, 600, '2026-09-02', 35),
(4, 103, 3, 350, '2026-09-03', 40),
(5, 104, 4, 300, '2026-09-04', 28),
(6, 101, 5, 800, '2026-09-05', 32),
(7, 102, 2, 150, '2026-09-05', 22);
 show tables;
 select * from orders;
 select* from users;
 select* from restaurants;
 
 SELECT SUM(order_amount) AS total_money FROM orders;

-- Q3. Which city ordered more?
SELECT city, COUNT(*) AS total_orders FROM users 
GROUP BY city;

-- Q4. Top restaurant (made most money)
SELECT restaurant_id, SUM(order_amount) AS money 
FROM orders GROUP BY restaurant_id ORDER BY money DESC LIMIT 1;

-- Q5. Patna customers only
SELECT * FROM users WHERE city = 'Patna';

-- Q6. Fastest delivery order
SELECT * FROM orders ORDER BY delivery_time_mins ASC LIMIT 1;

-- Q7. How many restaurants in Patna?
SELECT COUNT(*) AS patna_restaurants FROM restaurants WHERE city='Patna';

-- Q8. All Biryani restaurants
SELECT * FROM restaurants WHERE cuisine='Biryani';

-- Q9. Customer who spent the most in one order
SELECT user_id, MAX(order_amount) AS biggest_order FROM orders GROUP BY user_id ORDER BY biggest_order DESC LIMIT 1;

-- Q10. Orders on 2026-09-02
SELECT * FROM orders WHERE order_date='2026-09-02';

-- Q11. Users + their orders (Simple JOIN)
SELECT u.user_name, o.order_amount 
FROM users u JOIN orders o ON u.user_id=o.user_id;

-- Q12. Restaurants with rating more than 4.4
SELECT restaurant_name, rating FROM restaurants WHERE rating > 4.4;

-- Q13. Total orders by Heena
SELECT COUNT(*) AS my_orders FROM orders WHERE user_id=101;

-- Q14. Cheapest order
SELECT MIN(order_amount) AS cheapest FROM orders;

SELECT COUNT(*) AS patna_orders FROM users u 
JOIN orders o ON u.user_id=o.user_id WHERE u.city='Patna';
SELECT AVG(delivery_time_mins) AS avg_time FROM orders;

SELECT r.restaurant_name, SUM(o.order_amount) AS revenue
FROM orders o JOIN restaurants r ON o.restaurant_id=r.restaurant_id
GROUP BY r.restaurant_name ORDER BY revenue DESC LIMIT 3;

-- Q15. All orders sorted high to low
SELECT * FROM orders ORDER BY order_amount DESC;

-- Q16. Which restaurant got how many orders?
SELECT restaurant_id, COUNT(*) AS total_orders 
FROM orders GROUP BY restaurant_id;

SELECT r.city, SUM(o.order_amount) AS city_revenue, COUNT(*) AS orders
FROM orders o JOIN restaurants r ON o.restaurant_id=r.restaurant_id
GROUP BY r.city;

SELECT cuisine, AVG(rating) AS avg_rating, COUNT(*) AS total_rest
FROM restaurants GROUP BY cuisine ORDER BY avg_rating DESC;

SELECT DISTINCT u.user_name, o.order_amount 
FROM users u JOIN orders o ON u.user_id=o.user_id 
WHERE o.order_amount > 500;

SELECT order_date, SUM(order_amount) AS daily_revenue 
FROM orders GROUP BY order_date ORDER BY order_date;

SELECT u.user_name, SUM(o.order_amount) AS total_spent
FROM users u JOIN orders o ON u.user_id=o.user_id
GROUP BY u.user_name HAVING SUM(o.order_amount) > 700
ORDER BY total_spent DESC;

SELECT r.restaurant_name, revenue.rev
FROM revenue JOIN restaurants r ON revenue.restaurant_id=r.restaurant_id
WHERE revenue.rev > (SELECT AVG(rev) FROM revenue);

SELECT r.restaurant_name, 
AVG(o.delivery_time_mins) AS avg_time,
MIN(o.delivery_time_mins) AS fastest,
MAX(o.delivery_time_mins) AS slowest
FROM restaurants r JOIN orders o ON r.restaurant_id=o.restaurant_id
GROUP BY r.restaurant_name ORDER BY avg_time ASC;