# 📊 Telecom Customer Churn Analysis Dashboard

## 📌 Project Overview

This end-to-end data analytics project analyzes customer churn in a telecom company to identify the key factors influencing customer attrition and provide actionable business recommendations.

The project demonstrates the complete analytics workflow, including data cleaning in Excel, exploratory analysis using MySQL, DAX calculations, and the development of a three-page interactive Power BI report.

---

## 🎯 Business Problem

Customer churn is one of the biggest challenges faced by telecom companies. Losing existing customers directly affects revenue and increases customer-acquisition costs.

This project answers the following business questions:

- Which customer groups are most likely to churn?
- Which services are associated with higher churn?
- How does contract type affect customer retention?
- Which payment methods have the highest churn?
- How do customer tenure and monthly charges influence churn?
- Which retention strategies should the company prioritize?

---

## 🛠 Tools and Technologies

- Microsoft Excel
- MySQL
- Power BI
- DAX
- GitHub

---

## 📂 Dataset

**Dataset:** Telecom Customer Churn Dataset

**Total customers:** 7,043  
**Total columns:** 21

The dataset contains information about:

- Customer demographics
- Contract type
- Internet service
- Phone service
- Additional telecom services
- Monthly charges
- Total charges
- Payment method
- Customer tenure
- Churn status

---

## 🧹 Data Cleaning

Data cleaning was performed in Microsoft Excel.

The following steps were completed:

- Checked duplicate records and duplicate customer IDs
- Verified missing values across all columns
- Investigated 11 blank `total_charges` records
- Confirmed that all 11 customers had `tenure = 0`
- Replaced the blank `total_charges` values with `0`
- Converted `total_charges` to a numeric data type
- Standardized column names using `snake_case`
- Corrected the misformatted `internet_service` header
- Validated numerical ranges and categorical values
- Prepared the cleaned dataset for MySQL and Power BI

---

## 🗄 SQL Analysis

The cleaned dataset was imported into MySQL for validation and business analysis.

The SQL analysis included:

- Total customer count
- Churned and retained customer counts
- Overall churn rate
- Churn by gender
- Churn by contract type
- Churn by internet service
- Churn by payment method
- Senior-citizen churn analysis
- Average monthly and total charges
- Churn by tenure group
- Churn by monthly-charge category
- Customer segmentation using `CASE`
- Revenue analysis
- Common Table Expressions
- Window functions and ranking

The project contains approximately **30 SQL queries**, covering basic, intermediate, and advanced analysis.

---

## 📈 Power BI Report

The Power BI report contains **three interactive pages**.

### Page 1 — Executive Dashboard

The Executive Dashboard provides a high-level overview of customer churn and business performance.

It includes:

- Total Customers
- Churned Customers
- Retained Customers
- Churn Rate
- Average Monthly Charges
- Average Tenure
- Total Revenue
- Churn by Contract Type
- Churn by Internet Service
- Churn by Payment Method
- Churn by Senior Citizen
- Churn by Monthly Charge Group
- Customer Churn by Tenure
- Interactive slicers
- Reset Filters button
- Key business insights

### Page 2 — Customer Segmentation

This page analyzes churn across different customer groups:

- Gender
- Partner status
- Dependents
- Multiple Lines
- Paperless Billing
- Phone Service

### Page 3 — Service Analysis

This page evaluates the relationship between churn and telecom services:

- Online Security
- Tech Support
- Online Backup
- Device Protection
- Streaming TV
- Streaming Movies

---

## 📊 Dashboard KPIs

- Total Customers: **7,043**
- Churned Customers: **1,869**
- Retained Customers: **5,174**
- Churn Rate: **26.54%**
- Average Monthly Charges: **64.76**
- Average Tenure: **32.37 months**
- Total Revenue: **16.06M**

---

## 📷 Dashboard Preview

### Executive Dashboard

The Executive Dashboard provides a high-level overview of customer churn, revenue, retention, contracts, internet services, payment methods, customer tenure, and monthly-charge groups.

![Executive Dashboard](Executive_Dashboard.png)

---

### Customer Segmentation

This page analyzes customer demographics and behavioral segments, including gender, partner status, dependents, phone service, multiple lines, and paperless billing.

![Customer Segmentation](Customer_Segmentation.png)

---

### Service Analysis

This page analyzes how online security, technical support, online backup, device protection, and streaming services relate to customer churn.

![Service Analysis](Service_Analysis.png)

---

## 💡 Key Insights

- Month-to-month customers account for the largest number of churned customers.
- Customers using fiber-optic internet show higher churn than DSL customers.
- Electronic-check customers have the highest churn among payment methods.
- Senior citizens show a higher churn tendency than non-senior citizens.
- Customers with shorter tenure are more likely to leave.
- Customers in the high monthly-charge group show greater churn.
- Customers without online security or technical support are more likely to churn.
- Support-related services appear to have a stronger relationship with retention than streaming services.

---

## 📌 Business Recommendations

- Encourage month-to-month customers to move to one-year or two-year contracts through discounts and loyalty incentives.
- Investigate the service experience of fiber-optic customers and address pricing, reliability, and support concerns.
- Promote automatic payment options to customers currently using electronic checks.
- Create targeted retention campaigns for new and short-tenure customers.
- Offer bundled online-security and technical-support packages.
- Design personalized plans for senior citizens and other high-risk customer groups.
- Monitor high-value customers with high monthly charges and provide proactive retention offers.

---

## 📊 DAX Measures

The following DAX measures were created:

```DAX
Total Customers =
DISTINCTCOUNT(
    telecom_customer_churn[customer_id]
)
```

```DAX
Churned Customers =
CALCULATE(
    [Total Customers],
    telecom_customer_churn[churn] = "Yes"
)
```

```DAX
Retained Customers =
CALCULATE(
    [Total Customers],
    telecom_customer_churn[churn] = "No"
)
```

```DAX
Churn Rate =
DIVIDE(
    [Churned Customers],
    [Total Customers],
    0
)
```

```DAX
Average Monthly Charges =
AVERAGE(
    telecom_customer_churn[monthly_charges]
)
```

```DAX
Average Tenure =
AVERAGE(
    telecom_customer_churn[tenure]
)
```

```DAX
Total Revenue =
SUM(
    telecom_customer_churn[total_charges]
)
```

---

## 📁 Project Structure

```text
telecom-customer-churn-analysis/
│
├── README.md
├── Telecom_Customer_Churn_Dashboard.pbix
├── Telecom_Customer_Churn_Cleaned.csv
├── telecom_customer_churn_analysis.sql
├── Executive_Dashboard.png
├── Customer_Segmentation.png
└── Service_Analysis.png
```

---

## 🚀 Skills Demonstrated

- Data cleaning and validation
- Exploratory data analysis
- SQL querying
- Aggregate functions
- `CASE` statements
- Common Table Expressions
- Window functions
- DAX measures
- Power BI dashboard development
- Data visualization
- Interactive filtering
- Bookmark-based Reset Filters functionality
- Customer segmentation
- Business storytelling
- Customer-retention analysis

---

## 👨‍💻 Author

**Deepak Yadav**

Aspiring Data Analyst

**Skills:** Excel, MySQL, Power BI, SQL, Data Visualization, Data Storytelling and Python fundamentals

---

⭐ If you found this project useful, consider giving the repository a star.
