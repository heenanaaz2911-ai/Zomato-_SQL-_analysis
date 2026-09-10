# Zomato SQL Analysis - Patna & Ranchi
By Heena Naaz | JRU MCA 2026

## Project Overview
Analyzed Zomato delivery data using MySQL.
3 Tables: restaurants, users, orders
16 Business Queries solved.

## Database
- 5 Restaurants (Biryani House, Litti King etc)
- 8 Users (Patna/Ranchi)
- 7 Orders

## Key Queries
1. Total Revenue: SELECT SUM(order_amount) FROM orders;
2. City-wise Orders: SELECT city, COUNT(*) FROM users GROUP BY city;
3. Top Restaurant: SELECT restaurant_id, SUM(amount) GROUP BY... ORDER BY DESC

## Tools
MySQL Workbench, GitHub
