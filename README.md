# 📊 Olist E-Commerce Data Analysis (SQL + Excel)

## 📌 Project Overview

This project performs an in-depth **Exploratory Data Analysis (EDA)** on the Brazilian Olist e-commerce dataset.
The analysis is conducted using **MySQL for data processing** and **Microsoft Excel for visualization**.

The primary objective is to uncover patterns in **customer behavior, order trends, delivery performance, and product satisfaction**, and translate them into meaningful business insights.

---

## 🛠️ Tools & Technologies

* **MySQL** – Data cleaning, transformation, and analysis
* **Microsoft Excel** – Data visualization (charts & graphs)
* **GitHub** – Project version control and presentation

---

## 🗂️ Dataset Description

The dataset contains transactional data from an e-commerce platform, including:

* Customers
* Orders
* Order Items
* Payments
* Reviews
* Products
* Sellers
* Geolocation

These tables are interconnected and enable multi-dimensional analysis.

---

## 🧩 Database Schema

<img width="2486" height="1496" alt="image" src="https://github.com/user-attachments/assets/e40c0f3c-5b11-4254-a105-a286ec137bb0" />


### Key Relationships:

* Customers → Orders (via `customer_id`)
* Orders → Order Items (via `order_id`)
* Order Items → Products & Sellers
* Orders → Reviews & Payments
* Geolocation mapped via zip codes

Understanding these relationships was essential for performing accurate joins and analysis.

---

## 🧹 Data Cleaning & Preparation

The following preprocessing steps were performed:

* Handled missing values:

  * Preserved NULLs where they represent real-world scenarios (e.g., undelivered orders)
  * Replaced categorical missing values with `"Unknown"` where appropriate
* Converted date columns from string to proper date format
* Removed inconsistencies and ensured referential integrity
* Created derived features:

  * **Delivery Status (Late / On-Time)**
  * **Delivery Days (time difference between purchase and delivery)**
* Addressed outliers in delivery time (filtered extreme values for analysis)

---

## 📊 Exploratory Data Analysis (EDA)

The analysis was structured into multiple layers:

---

### 📈 1. Order Trends Over Time

* Orders show a steady upward trend from 2016 to 2018
* Peak activity observed in late 2017

📌 *Insight:* Platform adoption increased significantly over time.

---

### 👥 2. Customer Acquisition & Retention

* New customer trend closely follows total orders
* Majority of customers are **one-time buyers**

📌 *Insight:*
Low customer retention → opportunity for loyalty programs and retention strategies.

---

### 🌍 3. Geographic Distribution

* São Paulo dominates order volume
* Orders are concentrated in major metropolitan regions

📌 *Insight:*
Business is heavily dependent on a few high-density cities.

---

### 🚚 4. Delivery Performance Analysis

* Most deliveries occur within **5–15 days**
* Peak delivery time around **7–10 days**
* Majority of orders are delivered on time

📌 *Insight:*
Delivery operations are efficient, but outliers indicate occasional delays.

---

### ⭐ 5. Product Pricing vs Customer Satisfaction

* Average ratings remain consistent across price ranges

📌 *Insight:*
Higher price does not necessarily translate to better customer satisfaction.

---

### 📦 6. Delivery Time Distribution

* Right-skewed distribution with a long tail
* Few extreme delays (>60 days) identified as outliers

📌 *Insight:*
Most deliveries are timely, but rare delays impact customer experience.

---

## 📈 Visualizations

### 📊 Orders Over Time
<p align="center">
  <img src="https://github.com/user-attachments/assets/54f5cfdf-dabb-4771-a187-f7cbaf1955ec" width="600"/>
</p>


---


### 📊 New Customers Trend
<p align="center">
  <img src="https://github.com/user-attachments/assets/9238b9cc-89e3-40c2-a035-e5e43510d1eb" width="600"/>
</p>

---

### 📊 Top Cities by Orders
<p aligh="center">
  <img src="https://github.com/user-attachments/assets/47634b57-310a-416d-ae42-c37986df0d2b" width="600"/>
</p>


---

### 📊 Delivery Time Distribution
<p align="center">
  <img src="https://github.com/user-attachments/assets/3c2b84e7-d8c2-43e2-a39d-01d42ad75daa" width="600"/>
</p>

---

### 📊 Price vs Rating
<p align="center">
  <img src="https://github.com/user-attachments/assets/5328bc5e-4627-458f-9cf1-2448f28535bc" width="600"/>
</p>

---

### 📊 Delivery Status Distribution
<p align="center">
  <img src="https://github.com/user-attachments/assets/a9d193dd-1408-4d91-b5df-8c36593832ab" width="600"/>
</p>

---


---

## 💡 Key Insights

* 📉 Customer retention is low → majority are one-time buyers
* 🌆 Sales are highly concentrated in a few metropolitan cities
* 🚚 Delivery system is efficient, with most orders delivered within 10 days
* ⏱️ Extreme delivery delays exist but are rare (outliers)
* 💰 Product pricing has minimal impact on customer ratings

---

## 🚀 Conclusion

This project demonstrates how raw transactional data can be transformed into actionable insights using SQL and visualization tools.

The findings highlight:

* The importance of **customer retention strategies**
* The efficiency of **logistics operations**
* The value of **data-driven decision making** in e-commerce

---

## 📌 Future Improvements

* Build an interactive dashboard using **Power BI or Tableau**
* Perform **customer segmentation (RFM analysis)**
* Implement **predictive modeling (churn prediction)**

---


