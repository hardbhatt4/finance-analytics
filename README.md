# Customer Finance Analytics

> An end-to-end data analytics pipeline covering data cleaning, SQL modelling, interactive Power BI dashboards, and supervised machine learning — applied to a 20,000-customer personal finance dataset.


## Project Overview

This project delivers a full analytics lifecycle on a synthetic personal finance dataset. Starting from raw customer expense records, the pipeline cleans and enriches the data, loads it into a relational database, performs structured SQL analysis, visualises insights in Power BI, and finally trains a logistic regression classifier to segment customers by financial risk.

---

## Dataset

| File | Description |
|---|---|
| `data/raw_expenses.csv` | Raw source data — 20,000 customer records |
| `data/cleaned_expenses.csv` | Output of the cleaning notebook — ready for SQL ingestion |


## Tech Stack

| Layer | Tools |
|---|---|
| Data Cleaning | Python, Pandas, Jupyter Notebook |
| Database | SQL (MySQL) |
| Analysis | SQL — WHERE, GROUP BY, JOIN, Subqueries |
| Visualisation | Power BI Desktop |
| Machine Learning | scikit-learn (Logistic Regression, StandardScaler), Matplotlib, Seaborn |

---

## Project Walkthrough

### 1. Data Cleaning (Python)

**File:** `python/clean_data.ipynb`

The raw dataset was inspected and cleaned using Pandas. Key steps included:

- **Column formatting** — standardised naming conventions, fixed data types (e.g. converting string-encoded numerics)
- **Missing value handling** — identified nulls across columns
- **Calculated columns** — derived new features such as `savings_rate`,`total_expenses`,`actual_savings` 

**Output:** `data/cleaned_expenses.csv`

---

### 2. Database Setup (SQL)

**Files:** `sql/create_db.sql` & `sql/create_tables.sql`

- **`create_db.sql`** — creates the database and a `staging` table to load `cleaned_expenses.csv` as a flat import
- **`create_tables.sql`** — normalises the staging data into structured relational tables using `cust_id` as the primary key, enabling efficient joins and indexed queries across customer, expense, and demographic dimensions

---

### 3. SQL Analysis

**File:** `sql/queries.sql`

Analytical queries were written to surface business insights from the data. Techniques used include WHERE, GROUP BY, JOIN and Subqueries

---

### 4. Views for Power BI

**File:** `sql/views.sql`

SQL views were created as a layer between the raw tables and the Power BI report.

---

### 5. Power BI Dashboard

**File:** `dashboard/powerbi_dashboard.pbix`

The dashboard contains **3 report pages**, each targeting a different analytical lens: Customer Financial Profile, Demographics and Risk Profile. Pages make use of a combination of **bar charts, line charts, tables, cards, and slicers** for interactive filtering.

---

### 6. Machine Learning — Risk Classification

**File:** `python/analysis.ipynb`

A supervised binary classification model was built to label customers as **low risk** or **high risk** based on their financial profile. Methodology includes using Logistic Regression (scikit-learn), preprocessing using `Standard Scaler` and Feature Selection by droppping `Income` after testing to improve model accuracy. Visualisation includes prediction against important features and heatmap of confusion matrix

## Repository Structure

```
finance-analytics/
│
├── data/
│   ├── raw_expenses.csv          
│   └── cleaned_expenses.csv      
│
├── python/
│   ├── clean_data.ipynb         
│   └── analysis.ipynb          
│
├── sql/
│   ├── create_db.sql             
│   ├── create_tables.sql         
│   ├── queries.sql               
│   └── views.sql                 
│
├── dashboard/
│   └── powerbi_dashboard.pbix
│
├── .gitignore
└── README.md
```

*Built as an end-to-end portfolio project demonstrating data engineering, SQL analytics, business intelligence, and machine learning skills.*