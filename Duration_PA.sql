-- Define the purchases table to capture only purchase-related events
WITH purchases AS (
  SELECT
    TIMESTAMP_MICROS(event_timestamp) AS purchase_date,  
    PARSE_DATE('%Y%m%d', event_date) AS session_date,    
    user_pseudo_id,                                      
    country,                                             
    category,                                            
    mobile_brand_name,                                   
    purchase_revenue_in_usd                              
  FROM `turing_data_analytics.raw_events`
  WHERE event_name = 'purchase'                         
),
-- Define the page_views table to capture only page view-related events
page_views AS (
  SELECT 
    user_pseudo_id,                                      
    TIMESTAMP_MICROS(event_timestamp) AS page_view_date  
  FROM `turing_data_analytics.raw_events`
  WHERE event_name = 'page_view'                         
)

-- Main query to calculate engagement metrics and categorize engagement and purchase periods
SELECT 
  p.session_date,                                        
  MIN(pv.page_view_date) AS first_interaction_date,      
  p.purchase_date,                                       
  TIMESTAMP_DIFF(p.purchase_date, MIN(pv.page_view_date), MINUTE) AS duration_minutes, 
  
  p.user_pseudo_id,                                     
  p.country,                                            
  p.category,                                            
  p.mobile_brand_name,                                   
  p.purchase_revenue_in_usd,                            
  
  -- Define purchase period based on hour of the day
  CASE 
    WHEN EXTRACT(HOUR FROM p.purchase_date) BETWEEN 0 AND 4 THEN 'Late Night'
    WHEN EXTRACT(HOUR FROM p.purchase_date) BETWEEN 5 AND 11 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM p.purchase_date) BETWEEN 12 AND 16 THEN 'Midday'
    WHEN EXTRACT(HOUR FROM p.purchase_date) BETWEEN 17 AND 20 THEN 'Evening'
    WHEN EXTRACT(HOUR FROM p.purchase_date) BETWEEN 21 AND 23 THEN 'Night'
  END AS purchase_period,
  
  -- Categorize engagement duration based on time difference between first interaction and purchase
  CASE
    WHEN TIMESTAMP_DIFF(p.purchase_date, MIN(pv.page_view_date), MINUTE) <= 15 THEN 'Less than 15 mins'
    WHEN TIMESTAMP_DIFF(p.purchase_date, MIN(pv.page_view_date), MINUTE) BETWEEN 16 AND 30 THEN '15-30 mins'
    WHEN TIMESTAMP_DIFF(p.purchase_date, MIN(pv.page_view_date), MINUTE) BETWEEN 31 AND 60 THEN '30 mins - 1 hour'
    WHEN TIMESTAMP_DIFF(p.purchase_date, MIN(pv.page_view_date), MINUTE) BETWEEN 61 AND 120 THEN '1-2 hours'
    WHEN TIMESTAMP_DIFF(p.purchase_date, MIN(pv.page_view_date), MINUTE) BETWEEN 121 AND 180 THEN '2-3 hours'
    ELSE 'More than 3 hours'
  END AS engagement_duration_category
  
FROM purchases AS p
JOIN page_views AS pv
  ON p.user_pseudo_id = pv.user_pseudo_id               
  AND DATE(p.purchase_date) = DATE(pv.page_view_date)   
  
GROUP BY 
  p.session_date, 
  p.purchase_date,
  p.user_pseudo_id, 
  p.country, 
  p.category, 
  p.mobile_brand_name, 
  p.purchase_revenue_in_usd, 
  purchase_period;                                       
