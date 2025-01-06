-- creating a database
CREATE DATABASE campaign;

USE campaign


SELECT * FROM social_media_ad_campaign

-- Ad Format Performance Comparison
SELECT
    Ad_Type, 
    SUM(Impressions) AS Total_Impressions, 
    SUM(Clicks) AS Total_Clicks, 
    CAST((SUM(Clicks) / SUM(Impressions)) * 100 AS DECIMAL(10,2)) AS CTR,
    SUM(Conversions) AS Total_Conversions,
    CAST((SUM(Conversions) / SUM(Clicks)) * 100 AS DECIMAL(10,2))AS Conversion_Rate
FROM 
    social_media_ad_campaign
GROUP BY 
    Ad_Type
ORDER BY 
    CTR DESC;
    
-- Platform Efficiency Analysis
SELECT 
    Platform, 
    ROUND(SUM(Ad_Spend),2) AS Total_Spend, 
    ROUND(SUM(Revenue),2) AS Total_Revenue, 
    ROUND((SUM(Revenue) / SUM(Ad_Spend)),2) AS ROAS,
    SUM(Conversions) AS Total_Conversions,
    ROUND(AVG(Bounce_Rate),2) AS Avg_Bounce_Rate
FROM 
    social_media_ad_campaign
GROUP BY 
    Platform
ORDER BY 
    ROAS DESC;
    
-- Campaign Performance Over Time
SELECT 
    Date, 
    Campaign_Name, 
    SUM(Impressions) AS Total_Impressions, 
    SUM(Clicks) AS Total_Clicks, 
    SUM(Conversions) AS Total_Conversions,
    CAST(SUM(Ad_Spend) AS DECIMAL(10,2)) AS Total_Spend,
    CAST(SUM(Revenue) AS DECIMAL(10,2)) AS Total_Revenue,
    CAST((SUM(Revenue) / SUM(Ad_Spend)) AS DECIMAL(10,2)) AS ROAS
FROM 
    social_media_ad_campaign
GROUP BY 
    Date, Campaign_Name
ORDER BY 
    Date ASC;
    
-- Audience Segmentation for Conversion Optimization
SELECT 
    Target_Audience, 
    SUM(Impressions) AS Total_Impressions, 
    SUM(Clicks) AS Total_Clicks, 
    CAST((SUM(Clicks) / SUM(Impressions)) * 100,DECIMAL(10,2)) AS CTR,
    SUM(Conversions) AS Total_Conversions,
    CAST((SUM(Conversions) / SUM(Clicks)) * 100,DECIMAL(10,2)) AS Conversion_Rate
FROM 
    social_media_ad_campaign
GROUP BY 
    Target_Audience
ORDER BY 
    Conversion_Rate DESC;
    
-- Real-Time Budget Monitoring and Adjustment
SELECT 
    Date, 
    Campaign_Name, 
    CAST(SUM(Ad_Spend) AS DECIMAL(10,2)) AS Total_Spend, 
    CAST(SUM(Revenue) AS DECIMAL(10,2)) AS Total_Revenue,
    CAST((SUM(Revenue) / SUM(Ad_Spend)) AS DECIMAL(10,2)) AS ROAS
FROM 
    social_media_ad_campaign
WHERE 
    Ad_Spend > 100  -- Arbitrary threshold for monitoring high-spending ads
GROUP BY 
    Date, Campaign_Name
ORDER BY 
    ROAS ASC;

-- Engagement Rate Across Campaigns
SELECT 
    Campaign_Name, 
    SUM(Impressions) AS Total_Impressions, 
    SUM(Engagement) AS Total_Engagement, 
    CAST((SUM(Engagement) / SUM(Impressions)) * 100 AS DECIMAL(10,2)) AS Engagement_Rate
FROM 
    social_media_ad_campaign
GROUP BY 
    Campaign_Name
ORDER BY 
    Engagement_Rate DESC;
    
-- Bounce Rate and Average Session Duration by Ad Type
SELECT 
    Ad_Type, 
    CAST(AVG(Bounce_Rate) AS DECIMAL(10,2)) AS Avg_Bounce_Rate, 
    CAST(AVG(Average_Session_Duration) AS DECIMAL(10,2)) AS Avg_Session_Duration
FROM 
    social_media_ad_campaign
GROUP BY 
    Ad_Type
ORDER BY 
    Avg_Bounce_Rate ASC, Avg_Session_Duration DESC;

    