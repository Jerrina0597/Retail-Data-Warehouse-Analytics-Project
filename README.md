# Retail-Data-Warehouse-Analytics-Project
This project shows how to build a complete Retail Data Warehouse using MySQL and develop an interactive Analytics Dashboard in Tableau.
It walks through every stage of a real-world BI workflow — from importing raw data and cleaning it, to designing dimensional models, creating fact and dimension tables, building analytical SQL views, and finally visualizing insights through a dashboard.

📘 Project Overview

This project demonstrates the complete BI lifecycle—transforming raw retail transaction data into a structured MySQL data warehouse, building analytical SQL views, and developing a fully interactive Tableau dashboard. It mirrors real workflows used in modern retail and e-commerce analytics teams.

🎯 Objectives

* Clean and preprocess raw retail transaction data.
* Design a dimensional data warehouse (fact & dimension tables).
* Build analytical SQL queries and views for business insights.
* Develop a Tableau dashboard for interactive data exploration.
* Answer key business questions related to sales, customers, and product performance.

📊 Key Insights Delivered

* Monthly revenue performance and trends
* Top revenue-generating countries and regions
* Best-selling products and categories
* Customer segment behavior and purchasing patterns
* KPIs including: Revenue, Orders, AOV, ARPC

🧰 Tech Stack

* SQL (MySQL) – Data cleaning, transformation, modeling, and analytical views
* Tableau – Dashboard design and visualization
* Excel / CSV – Raw data source
* Data Modeling – Star schema, fact & dimension tables

🏗️ Data Warehouse Architecture
## Dimensional Model (Star Schema)

* ### Fact Table:

     * fact_sales (Transaction-level metrics: quantity, Unitprice, Totalamount, customer, product, datetime)
* ### Dimension Tables:
     * customer
     * product
     * order
This structure ensures efficient querying and flexible analytics.

🧮 SQL Components

* Data cleaning & standardization
* Deduplication & null handling
* Duplicate key creation
* Fact and dimension table creation.
* KPI calculation queries
* Analytical views used directly in Tableau

  📈 Tableau Dashboard

The dashboard visualizes actionable retail insights, including:
📆 Monthly Revenue Trend
🌍 Revenue by Country
🛍️ Top Products & Categories
👥 Customer Segment Analysis
💡 KPI Summary (Revenue, Orders, AOV, ARPC)
A sample of the visualization is included in the repository.

📝 Sample Business Key insights

* How does revenue trend over time?
* Which countries contribute the most sales?
* What products and categories drive growth?
* How do customers behave across segments?
* What KPIs best represent overall business health?

  🚀 End-to-End Workflow

1.Raw Data Import
2.Data Cleaning & Preparation (SQL)
3.Dimensional Modeling
4.Data Warehouse Build
5.Analytical SQL Views
6.Tableau Dashboard Design
7.Insights & Reporting

🧑‍💼 Why This Project Matters

This project reflects industry-standard BI practices and demonstrates core skills used by:
* Data Analysts
* BI Analysts
* Data Engineers
* Analytics Engineers
It showcases  ability to work across the full data pipeline—from raw data to insights that support business decisions.
