-- Business question: Does Consumer segment simply buy more Furniture,
-- or is its lower margin driven by something else (e.g. discount behavior)?

-- Step 1: Furniture's share of each segment's sales
SELECT
    Segment,
    Category,
    SUM(Sales) AS Total_Sales,
    ROUND(SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER (PARTITION BY Segment), 2) AS Pct_Of_Segment_Sales,
    ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS Profit_Margin_Pct
FROM orders
GROUP BY Segment, Category
ORDER BY Segment, Pct_Of_Segment_Sales DESC;

-- Step 2: Discount behavior on Furniture specifically, by segment
SELECT
    Segment,
    Category,
    SUM(Sales) AS Total_Sales,
    ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS Profit_Margin_Pct,
    ROUND(AVG(Discount) * 100, 2) AS Avg_Discount_Pct
FROM orders
WHERE Category = 'Furniture'
GROUP BY Segment
ORDER BY Avg_Discount_Pct DESC;