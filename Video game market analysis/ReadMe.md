<h1 style="color:#2E86C1;">Video Game Market Analysis (SQL Project)</h1>

<h2 style="color:#1F618D;">Objective</h2>
This project analyzes video game sales, revenue, and user engagement using SQL to uncover insights about game performance, genres, publishers, and customer behavior.

The aim is to support data-driven decision-making by identifying key revenue drivers, engagement patterns, and market trends in the gaming industry.

---

<h2 style="color:#1F618D;">Dataset</h2>

- games_description.csv → Game details (name, genre, publisher, release year)  
- games_revenue.csv → Revenue data (number of purchases, unit price)  
- games_reviews.csv → Reviews and engagement (reviews, helpful/funny tags, hours played)  

<i>Note: Data was imported into a SQL environment and structured using relational tables.</i>

---

<h2 style="color:#1F618D;">Data Workflow</h2>

- Imported CSV files into SQL database  
- Created relationships using game_id  
- Joined multiple tables for analysis  
- Calculated key metrics such as revenue, engagement, and review percentages  

---

<h2 style="color:#1F618D;">Key Business Questions</h2>

- Which games generate the highest revenue?  
- Which genres contribute the most to total revenue?  
- Which year generated the highest revenue?  
- Do high-revenue games also have high engagement?  
- Which publishers dominate the market?  
- How do reviews and user engagement vary across games and genres?  

---

<h2 style="color:#1F618D;">Key Analysis and Results</h2>

<h3 style="color:#566573;">1. Revenue Analysis</h3>

<b>Key Insights</b>  
- Total revenue calculated as Number_of_Purchases × Unit_Price  
- Revenue is concentrated among a few top-performing games  
- Top 5 games contribute a large share of total revenue  

<b>Analysis</b>  
- The market follows a hit-driven model where a small number of games generate most of the revenue  
- Identifying high-performing titles is critical for profitability  

---

<h3 style="color:#566573;">2. Genre Performance</h3>

<b>Key Insights</b>  
- Top 3 genres dominate overall revenue  
- Some genres consistently outperform others  

<b>Analysis</b>  
- Genre selection plays a key role in revenue generation  
- Lower-performing genres indicate opportunities for improvement or repositioning  

---

<h3 style="color:#566573;">3. Yearly Trends</h3>

<b>Key Insights</b>  
- Certain years generate significantly higher revenue  
- Revenue depends heavily on major game releases  

<b>Analysis</b>  
- The industry is influenced by blockbuster launches rather than steady yearly growth  
- Strategic release timing is important for maximizing revenue  

---

<h3 style="color:#566573;">4. Review and Engagement Analysis</h3>

<b>Key Insights</b>  
- Review percentage varies significantly across games  
- Some high-revenue games show lower engagement  

<b>Analysis</b>  
- Revenue and engagement are not always directly correlated  
- Indicates the importance of player experience and retention  

---

<h3 style="color:#566573;">5. Helpful vs Funny Reviews</h3>

<b>Key Insights</b>  
- Calculated helpful and funny review percentages  
- Identified highest and lowest performing games and genres  

<b>Analysis</b>  
- Engagement quality varies across different types of games  
- Certain genres attract more meaningful interaction from users  

---

<h3 style="color:#566573;">6. Ranking Analysis</h3>

<b>Key Insights</b>  
- Games ranked within each genre based on revenue and reviews  

<b>Analysis</b>  
- Top games dominate their respective genres  
- Ranking helps identify competitive positioning within categories  

---

<h3 style="color:#566573;">7. Revenue vs Engagement</h3>

<b>Key Insights</b>  
- Compared revenue with hours played  
- Calculated average hours per purchase  

<b>Analysis</b>  
- High revenue does not always indicate high engagement  
- Some games achieve strong sales but lower player retention  

---

<h3 style="color:#566573;">8. Publisher Insights</h3>

<b>Key Insights</b>  
- Identified top publishers by revenue  
- Measured publisher diversity across genres  

<b>Analysis</b>  
- Some publishers dominate multiple genres  
- Others specialize in niche categories  

---

<h2 style="color:#1F618D;">SQL Techniques Used</h2>

- Joins (INNER JOIN across multiple tables)  
- Aggregations (SUM, AVG, COUNT)  
- Window Functions (RANK with PARTITION BY)  
- Calculated metrics (Revenue, Percentages)  
- Subqueries and UNION operations  

---

<h2 style="color:#1F618D;">Project Files</h2>

- sql_queries.sql → SQL queries used for analysis  
- games_description.csv → Game metadata  
- games_revenue.csv → Revenue data  
- games_reviews.csv → Reviews and engagement  
- Video game Market Analysis.pdf → Detailed analysis report  

---

<h2 style="color:#1F618D;">Tools and Technologies</h2>

- SQL (Relational Database)  
- Excel (Data preparation)  

---

<h2 style="color:#1F618D;">Business Impact</h2>

- Identifies top-performing games and genres  
- Supports pricing and revenue optimization strategies  
- Provides insights into player engagement behavior  
- Helps publishers make data-driven decisions  

---

<h2 style="color:#1F618D;">Key Learnings</h2>

- Writing efficient SQL queries for analysis  
- Combining multiple datasets using joins  
- Applying window functions for ranking  
- Translating raw data into actionable insights  

---

<h2 style="color:#1F618D;">Future Improvements</h2>

- Build dashboards using Power BI or Tableau  
- Add predictive models for revenue forecasting  
- Perform deeper customer and player segmentation  

---

This project demonstrates an end-to-end data analysis workflow using SQL to extract insights from a structured gaming dataset.
