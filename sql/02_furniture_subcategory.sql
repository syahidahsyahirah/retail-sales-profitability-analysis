-- Business question: Within Furniture, which sub-categories are unprofitable?
SELECT
    "Sub-Category",
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS Profit_Margin_Pct,
    ROUND(AVG(Discount) * 100, 2) AS Avg_Discount_Pct
FROM orders
WHERE Category = 'Furniture'
GROUP BY "Sub-Category"
ORDER BY Profit_Margin_Pct ASC;