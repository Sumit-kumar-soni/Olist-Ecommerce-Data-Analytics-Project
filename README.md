# Olist E-Commerce Data Analytics Deep Dive 🛒📊

## Project Overview
This project is an end-to-end data analytics solution designed to extract actionable business insights from the Olist E-Commerce dataset (Brazil). The goal was to go beyond basic sales tracking and analyze supply chain efficiency, customer retention, and root causes of customer dissatisfaction.

## Tech Stack Used
* **Database Management:** SQL Server (Data extraction, cleaning, defining Primary/Foreign Keys)
* **Data Cleaning:** Excel
* **Data Visualization & BI:** Power BI
* **Data Modeling:** Star Schema design
* **Calculations & Logic:** DAX (Data Analysis Expressions)

## Key Dashboard Features
1. **Executive KPI Tracking:** Dynamic calculations of Delivered Revenue, Total Unique Customers, and Retention Rate.
2. **Text Mining for Customer Sentiment:** Utilized DAX to scan thousands of Portuguese text reviews, categorizing 1-star ratings into actionable buckets (Delivery Logistics vs. Product Quality).
3. **Logistics & Freight Analysis:** Analyzed the relationship between customer geography, average freight costs, and overall purchasing volume.
4. **Dynamic Highlighting & Top-N Filtering:** Built custom DAX conditional formatting to instantly highlight product categories with critical cancellation rates, while using Top-N filters to keep line charts clean and readable.

## The Data Model
* Built a robust **Star Schema** with `olist_orders` and `olist_order_items` acting as central Fact tables.
* Surrounded by Dimension tables (`Customers`, `Sellers`, `Products`, `Translations`).
* Implemented a dedicated Master Calendar table for accurate time-intelligence reporting (MoM, YoY).
<img width="1920" height="1031" alt="Data_Modelling" src="https://github.com/user-attachments/assets/81b2db6b-60a4-49d3-a750-1c4ab3d8e0eb" />

## Files Included
* `Olist_Data_Cleaning.sql`: The SQL scripts used to clean dirty data, assign keys, and test relationships.
* `Ecommerce_Dashboard.pbix`: The final Power BI project file containing the data model and interactive canvas.
* `Dashboard_Screenshots/`: High-resolution images of the final dashboard for quick viewing.
<img width="1920" height="1031" alt="Olist_Ecommerce_Dashboard" src="https://github.com/user-attachments/assets/7c0d5af9-a28b-43b3-a1e1-fa0061a7e585" />
