-- =========================================
-- SMARTGEAR SYNAPSE ANALYTICS QUERIES
-- =========================================

-- 1. Region-wise Total Revenue
SELECT 
    region,
    SUM(revenue) AS total_revenue
FROM workspace.smartgear.gold_region_revenue
GROUP BY region
ORDER BY total_revenue DESC;


-- =========================================

-- 2. Top 5 Products by Revenue
SELECT TOP 5
    product,
    SUM(revenue) AS total_revenue
FROM workspace.smartgear.gold_top_products
GROUP BY product
ORDER BY total_revenue DESC;


-- =========================================

-- 3. Daily Revenue Trend
SELECT 
    date,
    daily_revenue
FROM workspace.smartgear.gold_daily_revenue
ORDER BY date;


-- =========================================

-- 4. Rolling 7-Day Revenue Trend
SELECT 
    date,
    daily_revenue,
    rolling_avg
FROM workspace.smartgear.gold_rolling_revenue
ORDER BY date;


-- =========================================

-- 5. Region Contribution Percentage
SELECT 
    region,
    total_revenue,
    percentage
FROM workspace.smartgear.gold_region_pct
ORDER BY percentage DESC;


-- =========================================

-- 6. Anomaly Detection (High/Low Revenue Days)
SELECT 
    date,
    daily_revenue,
    anomaly
FROM workspace.smartgear.gold_anomaly_detection
WHERE anomaly = TRUE
ORDER BY date;


-- =========================================

-- 7. Store Performance (Top Stores per Region)
SELECT 
    region,
    store_id,
    revenue,
    rank
FROM workspace.smartgear.gold_top_stores
WHERE rank <= 3
ORDER BY region, rank;


-- =========================================

-- 8. Batch vs Streaming Comparison (if source column added)
SELECT 
    source,
    SUM(revenue) AS total_revenue
FROM workspace.smartgear.silver_orders
GROUP BY source;


-- =========================================

-- END OF SCRIPT