<h1 style="color:#2E86C1;">Global Retail Sales & Product Analysis</h1>

<h2 style="color:#1F618D;">Objective</h2>
This project analyzes sales and product data from an international e-commerce retailer stored in an Azure SQL database.  

The aim is to identify patterns in sales, product performance, and customer behavior to support data-driven decisions, improve profitability, and uncover growth opportunities across global markets.

---

<h2 style="color:#1F618D;">Overall Sales Performance</h2>

<img src="Images/Overall_sales_performance.png" width="800"/>

<h3 style="color:#566573;">Key Metrics</h3>

- Total Revenue: $1.93M  
- Year-to-Date Sales: $430K  
- Previous YTD Sales: $460K  
- Growth Rate: -6.51%  

<h3 style="color:#566573;">Insights</h3>

- Revenue is driven by a small number of high-performing categories  
- Sales are heavily concentrated in the United Kingdom  
- Clear seasonal fluctuations across months  
- Year-over-year decline suggests need for improved strategy and planning  

---

<h2 style="color:#1F618D;">Data Sources</h2>

<h3 style="color:#566573;">Primary Dataset (Azure SQL Database)</h3>

- Cloud-hosted transactional retail dataset  
- Connected using Power BI  
- Includes sales, product, and invoice-level data  

<i>Note: Connection credentials are not shared for security reasons</i>  

---

<h3 style="color:#566573;">Secondary Dataset</h3>

- World Bank – GDP per Capita  
https://data.worldbank.org/indicator/NY.GDP.PCAP.CD  

Used to compare economic indicators with country-level sales performance  

---

<h2 style="color:#1F618D;">Key Business Questions</h2>

- Which products and categories generate the most revenue?  
- Which countries contribute the most to sales?  
- How do sales change over time?  
- Are there seasonal patterns affecting performance?  
- How can pricing, promotions, and inventory be optimized?  

---

<h2 style="color:#1F618D;">Analysis Overview</h2>

<img src="Images/Sales_by_Category.png" width="800"/>

<h3 style="color:#566573;">1. Sales Performance by Product Categories</h3>

<b>Key Insights</b>  
- "Uncategorized (Other)" contributes the highest sales  
- Top categories: CHRISTMAS, CANDLE, GLASS, MUG  
- Low-performing categories include RIBBONS, KEY RING, and CRAFT  

<b>Analysis</b>  
- Revenue is concentrated in a few categories  
- Strong seasonal influence, especially for holiday-related items  
- High share of "Uncategorized" indicates data quality issues  
- Low-performing categories require pricing or marketing improvements  

---

<h3 style="color:#566573;">2. Top Products Analysis</h3>

<b>Top Performers</b>  
- CHRISTMAS RETROSPECT STAR WOOD  
- BLUE POLKADOT COFFEE MUG  
- S/4 PINK FLOWER CANDLES IN BOWL  
- FELT TOADSTOOL LARGE  

<b>Analysis</b>  
- Seasonal and decorative products drive peak sales  
- Everyday items like mugs and candles provide consistent demand  
- Underperforming products may benefit from bundling or promotions  

---

<h3 style="color:#566573;">3. Customer and Regional Analysis</h3>

<img src="Images/Top_sales_by_country.png" width="800"/>

<b>Key Insights</b>  
- United Kingdom dominates total sales (~$1.73M)  
- Other contributing markets: Germany, France, New Zealand, Belgium  

<b>Analysis</b>  
- High dependence on a single market (around 80–85% revenue)  
- Europe acts as a secondary market  
- Significant growth opportunity in underperforming regions  

---

<h3 style="color:#566573;">4. Sales Trends Over Time</h3>

<b>Key Insights</b>  
- Highest sales in April (~$51K)  
- Lowest sales in June (~$28K)  
- Strong months include August, October, and November  

<b>Analysis</b>  
- Clear seasonal trends in sales performance  
- Mid-year dip indicates opportunity for targeted campaigns  
- Late-year growth aligns with holiday demand  

---

<h3 style="color:#566573;">5. Year-over-Year Analysis</h3>

<b>Key Insights</b>  
- YTD sales declined by 6.51% compared to the previous year  

<b>Analysis</b>  
- Performance shows volatility influenced by seasonality  
- Indicates reliance on campaign timing and product demand  

---

<h3 style="color:#566573;">6. Sales Forecasting</h3>

<img src="Images/90_days_sales_forecast.png" width="800"/>

- Forecasting performed using historical sales trends  
- Supports planning for inventory, staffing, and marketing  

---

<h2 style="color:#1F618D;">Secondary Dataset Analysis (GDP vs Sales)</h2>

<img src="Images/secondary_dataset_analysis.png" width="800"/>

<b>Key Insights</b>  
- GDP growth does not directly translate into higher sales  
- Medium-GDP countries show strong growth potential  
- High-GDP markets may be saturated  

<b>Business Implications</b>  
- Opportunity to expand into emerging markets  
- Need to adapt product offerings by region  
- Balance between premium and affordable product strategies  

---

<h3 style="color:#566573;">Country-Level Insights</h3>

- United Kingdom leads in both sales and efficiency  
- Some high-GDP countries (e.g., Norway, Iceland) show low sales  
- Australia shows balanced performance  

---

<h3 style="color:#566573;">Product vs GDP Insights</h3>

- High-GDP countries prefer premium and decorative products  
- Medium-GDP markets respond better to affordable and practical products  

---

<h2 style="color:#1F618D;">Business Impact</h2>

- Identifies top-performing products and categories  
- Supports targeted marketing and pricing strategies  
- Improves inventory and supply chain planning  
- Reduces dependency on a single market  
- Enables data-driven expansion decisions  

---

<h2 style="color:#1F618D;">Tools and Technologies</h2>

- Azure SQL Database  
- SQL  
- Power BI  
- Excel  

---

<h2 style="color:#1F618D;">Key Learnings</h2>

- Importance of data-driven decision making  
- Understanding seasonal sales patterns  
- Analyzing regional customer behavior  
- Using external datasets for deeper insights  
- Translating analysis into business strategy  

---

<h2 style="color:#1F618D;">Future Improvements</h2>

- Customer segmentation (RFM analysis)  
- Predictive sales modeling  
- Improved product categorization  
- Real-time dashboards  

---

This project demonstrates an end-to-end business intelligence workflow, combining data analysis and visualization to support strategic decision-making.
