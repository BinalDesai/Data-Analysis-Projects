# 🛒 Global Retail Sales & Product Analysis 

## 🎯 Objective
This project analyzes sales and product data from an international e-commerce retailer stored in an Azure SQL database.  

The goal is to explore patterns in sales, product performance, and customer behavior to support **data-driven business decisions**, improve profitability, and identify growth opportunities across global markets.

---

## 📊 Data Sources

### 🔹 Primary Dataset (Azure SQL Database)
The primary dataset was sourced from a cloud-hosted Azure SQL database provided as part of a training project.

- Connected securely using Power BI  
- Extracted sales, product, and invoice data for analysis  

> 🔒 Note: Connection credentials and access details are not included for security reasons.

---

### 🌐 Secondary Dataset
- **World Bank – GDP per Capita**
  👉 https://data.worldbank.org/indicator/NY.GDP.PCAP.CD  

Used to enrich the analysis and compare economic indicators with sales performance across countries.
---

## 📊 Key Business Questions
- Which products and categories drive the most revenue?  
- Which countries contribute the most to sales?  
- How do sales vary over time (monthly/yearly trends)?  
- Are there seasonal patterns affecting performance?  
- How can businesses optimize pricing, promotions, and inventory?  

---

## 📈 Analysis Overview

<img src="Images/Sales_by_Category.png" width="800"/>
### 🛍️ 1. Sales Performance by Product Categories

#### 🔹 Key Insights
- **Uncategorized (Other)** products generated the highest sales  
- Top categories: **CHRISTMAS, CANDLE, GLASS, MUG**  
- Mid performers: **LIGHTS, DECORATION, SIGN, STOOL, BOX**  
- Low performers: **RIBBONS, KEY RING, CRAFT, CUP**

#### 📌 Analysis
- Sales are heavily concentrated in a few categories  
- Strong **seasonal influence**, especially holiday-related items  
- High "Uncategorized" sales suggest **data quality or classification gaps**  
- Low-performing categories need **marketing or pricing improvements**

---

### 🏆 2. Top Products Analysis

#### 🔹 Top Performers
- CHRISTMAS RETROSPECT STAR WOOD (highest sales)  
- BLUE POLKADOT COFFEE MUG  
- S/4 PINK FLOWER CANDLES IN BOWL  
- FELT TOADSTOOL LARGE  

#### 📌 Analysis
- Sales driven by **seasonal & decorative products**  
- Strong demand during **holiday periods**  
- Non-seasonal items (mugs, candles) show **consistent year-round demand**  
- Low-performing products may benefit from **bundling or promotions**

<img src="Images/Sales_by_Category.png" width="500"/>

---

### 🌍 3. Customer & Regional Analysis

#### 🔹 Key Insights
- **United Kingdom dominates sales** (~$1.73M)  
- Other markets: Germany, France, New Zealand, Belgium  

#### 📌 Analysis
- Heavy dependence on **UK market (80–85% revenue)**  
- Europe acts as a secondary market  
- Other regions underperform  

👉 Opportunity:
- Expand into **underperforming global markets**  
- Reduce reliance on a single country  

---

### 📅 4. Sales Trends Over Time

#### 🔹 Key Insights
- Highest sales: **April (~$51K)**  
- Lowest sales: **June (~$28K)**  
- Strong months: August, October, November  

#### 📌 Analysis
- Sales show **seasonal spikes and dips**  
- Strong performance during **spring & late-year periods**  
- Weak mid-year months → opportunity for **campaigns/promotions**

---

### 📉 5. Year-over-Year (YTD) Analysis

#### 🔹 Key Insights
- Total Sales: **$1.93M**  
- Current YTD: **$430K vs $460K last year → -6.51% decline**  

#### 📌 Analysis
- Sales show **year-over-year volatility**  
- Indicates dependence on **seasonality and campaign timing**  

---

### 🔮 6. Sales Forecasting
- Forecasted **2019 sales** using historical trends  
- Helps in planning **inventory, staffing, and marketing strategies**

---

## 🌐 Secondary Dataset Analysis (GDP vs Sales)

### 📊 Key Findings

#### 🔹 Economic Insights
- GDP per capita increased, but **sales declined**  
- Indicates **economic growth does not directly drive sales**

#### 🔹 Market Opportunities
- Medium-GDP countries show **strong growth potential**  
- High-GDP countries show **mixed performance (possible saturation)**  
- Low-GDP countries present **future expansion opportunities**

---

### 📌 Country-Level Insights
- UK leads in both **sales and efficiency**  
- Countries like Norway and Iceland have strong economies but low sales  
- Australia shows balanced performance  

👉 Insight:
- Need for **market diversification strategy**

---

### 📦 Product vs GDP Insights
- High-GDP countries prefer **premium & decorative products**  
- Medium-GDP markets respond better to **affordable/practical products**

👉 Strategy:
- Localize product offerings by region  
- Expand mid-range products globally  

---

## 💼 Business Impact

- Identify **top-performing products and categories**  
- Improve **pricing and promotional strategies**  
- Enable **targeted marketing campaigns**  
- Optimize **inventory and supply chain**  
- Reduce reliance on **single market (UK)**  
- Support **data-driven expansion strategies**  

---

## 🛠️ Tools & Technologies
- **Azure SQL Database** – Data storage  
- **SQL** – Data extraction and transformation  
- **Power BI** – Data visualization and dashboards  
- **Excel** – Data validation and preprocessing  

---

## 💡 Key Learnings
- Importance of **data-driven decision making**  
- Identifying **seasonal trends in sales**  
- Understanding **regional market behavior**  
- Using **external datasets (GDP)** for deeper insights  
- Translating analysis into **business strategies**

---

## 🚀 Future Improvements
- Add **customer segmentation (RFM analysis)**  
- Implement **predictive sales models**  
- Improve **product categorization**  
- Build **interactive dashboards for real-time insights**

---

⭐ This project demonstrates end-to-end business intelligence analysis using real-world retail and economic data to drive strategic decisions.
