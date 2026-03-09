[README (1).md](https://github.com/user-attachments/files/24498437/README.1.md)
# 🛒 Amazon Sales Analysis – SQL Project

![Amazon Banner](https://upload.wikimedia.org/wikipedia/commons/a/a9/Amazon_logo.svg)


## 📌 Project Overview
This project is a **SQL-based analysis of an Amazon-like e-commerce system**.  
The focus is on **database design, data understanding, and business-ready data modeling** using a relational database approach.

The project includes:
- Well-structured relational schema
- Clean and normalized tables
- Clear entity relationships
- Business-ready data foundation for analysis

---

## 🧱 Database Tables & Data Description

### 1️⃣ customers
Stores customer-level information.

| Column | Description |
|------|------------|
| customer_id | Unique customer identifier |
| first_name | Customer first name |
| last_name | Customer last name |
| state | Customer state/location |

📌 **Purpose:** Identify customers and perform region-based analysis.

---

### 2️⃣ sellers
Stores seller/vendor information.

| Column | Description |
|------|------------|
| seller_id | Unique seller identifier |
| seller_name | Seller name |
| origin | Seller origin/location |

📌 **Purpose:** Analyze seller performance and fulfillment.

---

### 3️⃣ category
Stores product category details.

| Column | Description |
|------|------------|
| category_id | Unique category identifier |
| category_name | Product category name |

📌 **Purpose:** Group products for category-level analysis.

---

### 4️⃣ products
Stores product master data.

| Column | Description |
|------|------------|
| product_id | Unique product identifier |
| product_name | Product name |
| price | Selling price |
| cogs | Cost of goods sold |
| category_id | Category reference |

📌 **Purpose:** Core product information for sales analysis.

---

### 5️⃣ orders
Stores order-level information.

| Column | Description |
|------|------------|
| order_id | Unique order identifier |
| order_date | Date of order |
| order_status | Order status (Completed, Cancelled, etc.) |
| customer_id | Linked customer |
| seller_id | Linked seller |

📌 **Purpose:** Central transactional table.

---

### 6️⃣ orders_items
Stores product-level order details (junction table).

| Column | Description |
|------|------------|
| order_item_id | Unique order item ID |
| order_id | Related order |
| product_id | Related product |
| quantity | Quantity ordered |
| price_per_unit | Price per unit |

📌 **Purpose:** Resolve many-to-many relationship between orders and products.

---

### 7️⃣ payments
Stores payment transaction details.

| Column | Description |
|------|------------|
| payment_id | Unique payment ID |
| payment_date | Date of payment |
| payment_status | Success / Failed / Pending |
| order_id | Related order |

📌 **Purpose:** Payment success and transaction analysis.

---

### 8️⃣ shipping
Stores shipping and return information.

| Column | Description |
|------|------------|
| shipping_id | Unique shipping ID |
| order_id | Related order |
| shipping_date | Shipping date |
| return_date | Return date (if returned) |
| shipping_provider | Delivery partner |
| delivery_status | Delivery status |

📌 **Purpose:** Delivery performance and return analysis.

---
## 🧹 Data Cleaning & Validation
- Converted VARCHAR date fields to DATE
- Replaced empty strings with NULL
- Validated foreign key relationships

## 📐 Entity Relationship Diagram (ERD)
![erd ](https://github.com/user-attachments/assets/e6401120-53a2-4630-86d5-b85d04fe3ed5)

📌 The ERD illustrates:
- One-to-many and many-to-many relationships
- Proper normalization
- Foreign key constraints ensuring data integrity

---

## 🛠 Tools & Technologies
- **MySQL**
- **MySQL Workbench**
- **SQL (DDL & DML)**
- **ER Diagram for schema visualization**

---

## 📊 Business Questions Solved (Q1–Q10)
1. Top 10 products by sales
2. Revenue by category with percentage
3. Average Order Value (AOV)
4. Monthly sales with previous month comparison
5. Customers with no orders
6. Least-selling category by state
7. Customer Lifetime Value (CLTV)
8. Low-stock products
9. Payment success rate
10. Top returned products and return rate

## 🔍 Additional Insights
- Order cancellation rate by state
- Revenue contribution by state
- Average delivery time by shipping provider

## 🛠 Tools Used
- MySQL
- SQL (joins, window functions, subqueries)
- ERD for schema visualization

## ✅ Conclusion
This project establishes a **strong SQL data foundation** for analyzing an Amazon-style e-commerce system.  
The schema supports scalable analytics, clean joins, and real-world business use cases.

---

📌 *This repository focuses on data design and understanding, serving as a base for advanced SQL analytics and visualization.*
