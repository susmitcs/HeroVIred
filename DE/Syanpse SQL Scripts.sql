-- Region Wise KPI
SELECT *
FROM OPENROWSET(
    BULK 'https://smartgeardatalake01.dfs.core.windows.net/gold/region_kpi/*.parquet',
    FORMAT='PARQUET'
) AS result;

-- Top Products
SELECT *
FROM OPENROWSET(
    BULK 'https://smartgeardatalake01.dfs.core.windows.net/gold/top_products/*.parquet',
    FORMAT='PARQUET'
) AS result;


-- Revenue Trend
SELECT Region,
       SUM(Total_Revenue) AS Revenue
FROM OPENROWSET(
    BULK 'https://smartgeardatalake01.dfs.core.windows.net/gold/region_kpi/*.parquet',
    FORMAT='PARQUET'
) AS result
GROUP BY Region
ORDER BY Revenue DESC;