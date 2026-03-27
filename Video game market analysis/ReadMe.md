<h1 style="color:#2E86C1;">Video Game Market Analysis (SQL Project)</h1>

<h2 style="color:#1F618D;">Objective</h2>
This project analyzes video game sales, revenue, engagement, and customer reviews to uncover patterns in game performance, genres, publishers, and yearly trends.

The goal is to support data-driven decision-making by identifying key revenue drivers, engagement behavior, and market opportunities in the gaming industry.

---

<h2 style="color:#1F618D;">Dataset</h2>

📁 Dataset Folder: [View Dataset](./Dataset)

- games_description.csv → Game details (name, genre, publisher, year)  
- games_revenue.csv → Revenue data (purchases, pricing)  
- games_reviews.csv → Reviews and engagement  

<i>Note: Data was imported into a SQL environment and joined using game_id.</i>

---

<h2 style="color:#1F618D;">Data Processing</h2>

<b>Join Method</b>  
- INNER JOIN used across all three datasets on game_id  

<b>Rationale</b>  
- Ensures only complete records are included  
- Maintains consistency across revenue, reviews, and engagement data  

---

<h2 style="color:#1F618D;">Key Business Questions</h2>

- Which games and genres generate the most revenue and engagement?  
- Is there a relationship between revenue and player engagement?  
- What percentage of users leave reviews?  
- Who are the top publishers by revenue?  
- Which genres receive the most engagement?  
- Are newer games performing better than older ones?  

---

<h2 style="color:#1F618D;">Analysis and Insights</h2>

<h3 style="color:#566573;">1. Revenue Analysis</h3>

<b>Key Insights</b>  
- Top Games:
  - Counter → 407M  
  - PUBG: B → 105M  
  - Dota 2 → 91M  

- Top Genres:
  - Action → 1.25B  
  - Simulation → 184M  
  - Role-Playing → 73M  

- Highest Revenue Year:
  - 2012 → 427M  

<b>Analysis</b>  
- Revenue is highly concentrated in top games  
- Action genre dominates the market  
- Industry follows a hit-driven model  

---

<h3 style="color:#566573;">2. Review Percentage</h3>

<b>Key Insights</b>  
- High Engagement:
  - Counter, PUBG: B, Dota 2 → 71.43%  

- Moderate:
  - Among Us, Apex Legends → 66.67%  

- Low:
  - 69 Ball, Ale & T → 33.33%  

<b>Analysis</b>  
- Popular games receive higher engagement  
- Smaller games struggle to attract reviews  

---

<h3 style="color:#566573;">3. English Review Analysis</h3>

<b>Key Insights</b>  
- High English Reviews:
  - All-In → 91.26%  
  - Titanfa → 89.83%  

- Moderate:
  - Among Us → 67%  

- Low:
  - PUBG: B → 17%  
  - Counter → 27%  

<b>Analysis</b>  
- Some games have global audiences  
- Localization is important for growth  

---

<h3 style="color:#566573;">4. Publisher Analysis</h3>

<b>Top Publishers</b>  
- Valve → 604M  
- KRAFTON → 105M  
- Rocksta → 57M  

<b>Analysis</b>  
- Revenue dominated by a few publishers  
- Strong opportunity for partnerships and benchmarking  

---

<h3 style="color:#566573;">5. Engagement Ratios</h3>

<b>Key Insights</b>  
- Most Helpful Game → Terrari (370%)  
- Least Helpful → All In (0%)  
- Most Funny → Tom Cla (100%)  

<b>Genre Insights</b>  
- Highest Helpful → Action (74.61%)  
- Lowest Helpful → Sports & Racing (18.11%)  
- Most Funny → Role-Playing (84.58%)  

<b>Analysis</b>  
- Engagement quality varies across genres  
- Community interaction is strong for certain game types  

---

<h3 style="color:#566573;">6. Ranking Analysis</h3>

<b>Approach</b>  
- Used RANK() to rank games by:
  - Revenue within genre  
  - Reviews within genre  

<b>Analysis</b>  
- Top games dominate within categories  
- Some games rank high in engagement but not revenue  

---

<h3 style="color:#566573;">7. Revenue vs Engagement</h3>

<b>Key Insights</b>  
- High Revenue + High Engagement:
  - Counter, PUBG: B (~11 hours per purchase)  

- Lower Engagement:
  - Among Us, Unturned (4–7 hours)  

<b>Analysis</b>  
- Revenue does not guarantee engagement  
- Retention varies across games  

---

<h3 style="color:#566573;">8. Genre Engagement</h3>

<b>Key Insights</b>  
- Action → 475K reviews/game  
- Role-Playing → 155K  
- Simulation → 124K  
- Sports & Racing → 10K  

<b>Analysis</b>  
- Popular genres attract significantly more engagement  

---

<h3 style="color:#566573;">9. Publisher Diversity</h3>

<b>Key Insights</b>  
- SEGA → 6 genres  
- Electro, Xbox → 4 genres  
- Others → 1–2 genres  

<b>Analysis</b>  
- Large publishers diversify  
- Smaller publishers specialize  

---

<h3 style="color:#566573;">10. Yearly Trends</h3>

<b>Key Insights</b>  
- 2004–2006 → Low revenue (3M–33M)  
- 2012 → Peak (427M, 9.1M reviews)  
- 2024 → Growth continues  

<b>Analysis</b>  
- Market is growing over time  
- Newer games perform better  

---

<h2 style="color:#1F618D;">SQL Techniques Used</h2>

- INNER JOIN  
- Aggregations (SUM, AVG, COUNT)  
- Window Functions (RANK)  
- Calculated metrics  
- Subqueries and UNION  

---

<h2 style="color:#1F618D;">Project Files</h2>

- dataset/ → All CSV files  
- sql_queries.sql → SQL queries  
- Video game Market Analysis.pdf → Full report  

---

<h2 style="color:#1F618D;">Business Impact</h2>

- Identifies high-performing games and genres  
- Supports pricing and marketing strategies  
- Improves understanding of player engagement  
- Helps publishers make strategic decisions  

---

<h2 style="color:#1F618D;">Recommendations</h2>

- Focus on high-performing genres (Action, Simulation, RPG)  
- Improve review collection for low-engagement games  
- Expand localization for global markets  
- Partner with top publishers  
- Enhance community engagement features  
- Monitor new releases closely  
- Encourage genre diversification  

---

<h2 style="color:#1F618D;">Limitations</h2>

- Engagement ratios may exceed 100% due to multiple votes per review  
- Some player interactions may not be captured  

---

<h2 style="color:#1F618D;">Conclusion</h2>

The analysis shows that the gaming industry is driven by top-performing titles, strong genres, and increasing player engagement over time. While revenue and engagement are related, they are not always directly correlated. 

These insights can guide better decision-making in game development, marketing, and portfolio strategy.
