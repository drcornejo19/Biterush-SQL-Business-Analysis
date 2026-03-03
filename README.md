# Biterush-SQL-Business-Analysis

## 📌 Project Overview

BiteRush is a relational database project developed in SQL Server to simulate the operational structure of a fast-food company.

The project focuses on database design, relational integrity, and business-oriented SQL analysis to support performance evaluation and decision-making.

---

## 🏗 Database Design

The database was built following normalization principles and includes key business entities such as:

- Customers
- Orders
- Order Details
- Products
- Categories
- Employees
- Branches
- Delivery Personnel
- Payment Methods

Primary Keys and Foreign Keys were implemented to ensure data integrity and consistent relationships between entities.

---

## 📊 Business Analysis & Queries

This project includes analytical SQL queries designed to answer business questions such as:

- Total sales by branch
- Sales performance by employee
- Revenue distribution by order source
- Average order value
- Price analysis by category
- Average delivery time by courier

The analysis uses:

- JOIN operations
- GROUP BY
- Aggregation functions (SUM, AVG, MIN, MAX)
- Filtering and sorting techniques

---

## 🛠 Technologies Used

- Microsoft SQL Server
- T-SQL
- SQL Server Management Studio (SSMS)

---

## 📁 Project Structure

biterush-relational-database/
│
├── README.md
│
├── sql/
│ ├── schema_and_data.sql
│ ├── 01_queries_basic.sql
│ ├── 02_queries_joins.sql
│ ├── 03_queries_aggregations.sql
│ └── 04_kpis_delivery_sales.sql
│
└── docs/
├── results_sample_1.png
├── results_sample_2.png
├── results_sample_3.png
└── results_sample_4.png

---

## 🚀 How to Run the Project

1. Open Microsoft SQL Server Management Studio.
2. Execute `schema_and_data.sql` to create and populate the database.
3. Run the analytical query files inside the `/sql` folder.
4. Review outputs to analyze performance and operational insights.

---

## 🎯 Key Learnings

- Implementation of primary and foreign keys
- Data normalization principles
- Writing complex JOIN queries
- Business performance analysis using SQL
- Structuring databases for scalable reporting

---

## 👨‍💻 Author

David Cornejo  
Data Analyst | Business Intelligence | SQL | Power BI | Python | BigQuery  
Buenos Aires, Argentina  
LinkedIn: https://www.linkedin.com/in/david-cornejo-48a713279/
