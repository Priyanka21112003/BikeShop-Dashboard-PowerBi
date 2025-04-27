USE [BikeShop Project]

WITH CTE AS (
    SELECT * FROM bike_share_yr_0
    UNION ALL
    SELECT * FROM bike_share_yr_1
)

-- have to run this with upper query (select both together and run)
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
riders*price as revenue,
riders*price -COGS as profit
FROM CTE a
LEFT JOIN cost_table b
ON a.yr = b.yr 