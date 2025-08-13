# 📊 Bank Marketing Campaign – EDA Project

## 📌 Project Overview
- This project analyzes the **2017 Bank of Corporate telemarketing campaign** for term deposits using **Exploratory Data Analysis (EDA)**.  
- The goal was to identify **target customers** and uncover **key factors influencing successful conversions**, enabling more effective and cost-efficient marketing  campaigns in the future.

---

## 🎯 Business Objective
- **Primary Goal:** Identify customers most likely to open a term deposit.
- **Secondary Goal:** Determine key customer and campaign attributes that influence conversions.

---

## 📂 Dataset Information
- Source: Bank of Corporate (2017 term deposit telemarketing campaign)
- Total Records: 45,199 customers contacted
- Features:
  - Customer Attributes: Age, job type, marital status, education, balance, loans, etc.
  - Campaign Attributes: Call duration, number of contacts, previous campaign outcomes, time since last contact, etc.
- Target Variable: `Subscription` – whether the customer subscribed to a term deposit (`yes` / `no`).

---

## 🛠 Tools & Technologies Used
- Python (Pandas, NumPy)
- Excel
- Matplotlib / Seaborn
- PowerPoint

---

## 🔍 Approach & Methodology
1. **Data Cleaning**
   - Handled missing values, duplicates, and inconsistencies.
   - Standardized categorical values (e.g., job titles, education).
   - Created derived columns (Age Groups, Balance Buckets, Loan Status Flags, Call Duration Ranges).

2. **Univariate Analysis**
   - Analyzed distribution of customers across demographics and financial attributes.
   - Identified largest and most promising customer segments.

3. **Segmented Univariate Analysis**
   - Measured subscription rates across subgroups (e.g., Job vs Subscription, Age vs Subscription).

4. **Bivariate Analysis**
   - Studied interactions between variables (e.g., Age Group & Call Duration).
   - Evaluated seasonal patterns (Job & Month, Age & Month).
   - Analyzed effect of past campaign outcomes and contact frequency.

---

## 📈 Key Insights
- **Customer Profile**
  - 35–44 years (32.2%) and 25–34 years (31.4%) are the largest age segments.
  - Single customers have higher subscription rates.
  - Management and blue-collar jobs together form 42% of the customer base.

- **Subscription Trends**
  - Overall subscription rate: **11.42%** – indicates scope for improvement.
  - Retired individuals and students have the highest subscription rates.
  - Customers aged 65+ show higher interest in term deposits.

- **Financial Position**
  - 62% of customers have loans, reducing deposit acceptance likelihood.
  - Balances between ₹50K–₹2L show highest engagement.
  - Negative balance customers may need recovery plans before pitching deposits.

- **Campaign Effectiveness**
  - Contact within the last 3 months yields highest subscription rates.
  - Calls over 1201 seconds convert best; calls under 60 seconds perform poorly.
  - Prior successful campaigns correlate with higher conversion likelihood.

---

## 💡 Recommendations
1. **Targeting**
   - Focus on single, retired, and student customers.
   - Prioritize customers with ₹50K–₹2L balances and no loans.
   - Re-target customers with prior successful campaigns.

2. **Campaign Strategy**
   - Increase call duration to at least 3 minutes.
   - Contact customers more frequently, especially within 3 months.
   - Optimize campaigns for May (peak for blue-collar workers).

3. **Personalization**
   - Doctorate holders: pitch long-term, high-return deposits.
   - Bachelor’s degree holders: use simplified, relatable messaging.

---

## 📊 Deliverables
- **Cleaned Dataset** – `Cleaned_Dataset.xlsx`
- **Derived Columns & Data Dictionary** – `Derived Column & Data Dictionary.xlsx`
- **Analysis Files** – Univariate, Segmented Univariate, and Bivariate analyses in Excel.
- **Final Presentation** – `project-presentation.pdf`


---

## 📜 Author
**Yash Devghare**  
Business Analytics & Consulting Professional

---
