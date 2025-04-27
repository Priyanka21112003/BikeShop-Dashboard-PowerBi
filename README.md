# 🚲 Bike Shop Sales & Pricing Analysis (Power BI)

## Problem Statement
**Question:**  
Should we increase the bike rental prices?  
Will it impact the demand negatively?

The business aims to understand **price elasticity** — how sensitive customers are to price changes — to make informed decisions about future pricing strategies.

---

## Solution Approach
After analyzing the data:
- A **25% price increase** was implemented.
- Surprisingly, it resulted in a **64% increase in demand**.

✅ Conclusion: **A slight price increase does not negatively impact demand**. In fact, demand increased significantly, suggesting an opportunity to enhance profitability with careful pricing adjustments.

**Key actions during analysis:**
- Connected Power BI to **SQL Server Management Studio (SSMS)** to import the data.
- Imported and transformed the dataset using the following SQL query:

```sql
USE [BikeShop Project];

WITH CTE AS (
    SELECT * FROM bike_share_yr_0
    UNION ALL
    SELECT * FROM bike_share_yr_1
)
-- Run this query together with the above CTE
SELECT 
    dteday,
    season,
    a.yr,
    weekday,
    hr,
    rider_type,
    riders,
    price,
    COGS,
    riders * price AS revenue,
    riders * price - COGS AS profit
FROM CTE a
LEFT JOIN cost_table b
ON a.yr = b.yr;
```

- Added a new **Year** column to the dataset for easy slicing.
- Applied **Conditional Formatting** to distinguish years (2021 and 2022).
- Created a custom measure for **Profit Margin**:

```plaintext
Profit Margin = (SUM(Query1[revenue]) - SUM(Query1[profit])) / SUM(Query1[profit])
```
------
## Screenshots of the Dashboard
![Screenshot 2025-04-27 215810](https://github.com/user-attachments/assets/873670dc-2489-48f2-834e-a5210499478c)

# Key Insights
- Midday and Early Evening Hours (10 AM - 3 PM) are the most profitable times.
- Wednesdays and Fridays show higher sales compared to other weekdays.
- Season 3 (likely Summer) drives the highest revenue.
- 80% of riders are registered users, indicating strong customer loyalty.
- Price sensitivity appears low, suggesting room for slight future price increases without loss in demand.

# Tools Used
- **Power BI** for Dashboarding and Data Visualization
- **DAX** for custom calculations and measures
- **Power Query** for data transformation

# Recommendations 

## Price Increase Advice:
Since prices and demand already went up a lot last year, it’s better to increase prices slowly and carefully.  
A small increase of **10–15%** is recommended to avoid pushing prices too high, where it might scare customers away.

### New Suggested Prices:
- If the price in 2022 was **$4.99**:
  - A **10% increase** would make it about **$5.49**.
  - A **15% increase** would make it about **$5.74**.

## Strategy Tips:
- **Study the Market**: Keep an eye on customer satisfaction, competitor actions, and economic changes.
- **Segmented Pricing**: Consider setting slightly different prices for casual users and registered users.
- **Monitor and Adjust**: After increasing prices, watch customer reactions closely. Adjust if needed based on sales feedback.

# Final Conclusion
The analysis demonstrates that the bike shop can safely increase prices moderately to boost profitability without negatively affecting customer demand.  
Future pricing strategies should continue monitoring elasticity but remain confident about gradual increases.


