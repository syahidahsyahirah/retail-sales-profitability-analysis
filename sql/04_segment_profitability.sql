-- Business question: Which customer segments are most/least profitable?
SELECT
    Segment,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS Profit_Margin_Pct,
    ROUND(AVG(Discount) * 100, 2) AS Avg_Discount_Pct
FROM orders
GROUP BY Segment
ORDER BY Profit_Margin_Pct ASC;