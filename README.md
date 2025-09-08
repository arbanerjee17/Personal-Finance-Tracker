# 💰 Personal Finance Tracker

A simple **Personal Finance Tracker** built using **MySQL / SQLite** and visualized in **Power BI**.  
This project helps users record income & expenses, categorize spending, and generate monthly financial reports with visual dashboards.

---

## 📂 Project Structure
├── data/
│ ├── monthly_report.csv # Exported monthly balance report
│ ├── category_expenses.csv # Exported category-wise expense report
│
├── visuals/
│ ├── Monthly_Report.pbix # Power BI dashboard (Income vs Expense vs Net trend)
│ ├── Category_Report.pbix # Power BI dashboard (Category-wise spending)
│
├── sql/
│ ├── finance_schema.sql # SQL script: schema + sample inserts
│
├── docs/
│ ├── finance_schema.pdf # Database schema diagram


---

## ⚙️ Tools Used
- **MySQL / SQLite** → Database for storing users, categories, income, and expenses  
- **SQL Queries** → For generating monthly & category-wise reports  
- **CSV Exports** → Used for loading reports into Power BI  
- **Power BI** → For creating dashboards & visual analytics  

---

## 🛠️ Features
- Track **Income** & **Expenses** with categories and notes  
- Auto-generate **Monthly Balance Report** (Income – Expenses = Net)  
- Analyze **Category-wise Spending** (Rent, Groceries, Transport, etc.)  
- Visualize data with **Power BI Dashboards**:
  - 📊 Bar Chart → Income vs Expenses vs Net
  - 📈 Line Chart → Net Balance Trend
  - 🥧 Pie Chart → Category-wise Spending  

---

## ▶️ How to Run
1. Clone the repo:
   ```bash
   git clone https://github.com/your-username/personal-finance-tracker.git
   cd personal-finance-tracker
2. Import the database:

For MySQL:
SOURCE sql/finance_schema.sql;

3. Generate CSV reports:

Run SQL queries in Workbench/CLI

Export result grids as .csv

4. Open Power BI:

Load monthly_report.csv into Monthly_Report.pbix

Load category_expenses.csv into Category_Report.pbix


📊 Sample Dashboard

Monthly Report Dashboard (Power BI)

  Bar chart: Income vs Expenses vs Net
  
  Line chart: Net balance trend

Category Report Dashboard (Power BI)

  Pie chart: Spending distribution by category

👨‍💻 Author

APARUP BANERJEE
Personal Finance Tracker Project
Built with MySQL / SQLite & Power BI


---

👉 You just need to replace **`your-username`** with your actual GitHub username in the repo link and add your name in the **Author** section.  

Do you also want me to include **sample screenshots of your Power BI dashboards** in the README (using `![alt text](image.png)` format) so the repo looks more professional?
