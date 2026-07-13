Create Database telecom_churn_project;
Use telecom_churn_project;
Select count(*) As total_rows
From telecom_customer_churn;

Select *
From telecom_customer_churn
Limit 10;
Describe telecom_customer_churn;

Select
 customer_id,
 count(*) As customer_count
 From telecom_customer_churn
 group by customer_id
 Having count(*)>1;
 
 Select
 Sum(customer_id is null) as null_customer_id,
 Sum(tenure is null) As null_tenure,
 Sum(monthly_charges is null) as null_monthly_charges,
 Sum(total_charges is null) as null_total_charges,
 Sum(churn is null) as null_churn
 from telecom_customer_churn;
 
 Select 
 Min(tenure) As minimum_tenure,
 Max(tenure) As maximum_tenure,
 Min(monthly_charges) As minimum_monthly_charges,
 Max(monthly_charges) As maximum_monthly_charges,
 Max(total_charges) As mnaximum_total_charges
 From telecom_customer_churn;
 
 Select
 Churn,
 Count(*) As customer_count
 from telecom_customer_churn
 group by churn;
 
 Select 
 Count(*) As total_customers,
 Sum(Case when churn = 'Yes' Then 1 Else 0 End) As churned_customers,
 Sum(Case When churn = 'No' Then 1 Else 0 End) As rentained_customers,
 Round(
 100.0 * Sum(Case When churn = 'Yes' Then 1 Else 0 End) / Count(*),
 2
 )
 As churn_rate_percentage
 From telecom_customer_churn;
 
 Select
 churn,
 Count(*) As total_customers,
 Round(Count(*) * 100.0 / (Select Count(*) from telecom_customer_churn),2) As percentage
 From telecom_customer_churn
 Group by churn;
 
 Select
 gender,
 count(*) As total_customers
 From telecom_customer_churn
 Group By gender;
 
 SELECT
    gender,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),
        2
    ) AS churn_rate
FROM telecom_customer_churn
GROUP BY gender;
 
 Select 
 Contract,
 Count(*) As total_customers
 From telecom_customer_churn
 Group By contract
 Order By total_customers Desc;
 
 Select 
 Contract,
 Count(*) As total_customers,
 Sum(Case when churn='Yes' Then 1 Else 0 End) As churned_customers,
 Round(
 Sum(Case When churn='Yes' Then 1 Else 0 End)*100.0/count(*),
 2
 )As churn_rate
 From telecom_customer_churn
 Group BY contract
 Order By churn_rate Desc;

 SELECT
    internet_service,
    COUNT(*) AS total_customers
FROM telecom_customer_churn
GROUP BY internet_service;

SELECT
    internet_service,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),
        2
    ) AS churn_rate
FROM telecom_customer_churn
GROUP BY internet_service
ORDER BY churn_rate DESC;

Select
Payment_method,
Count(*) As total_customers
From telecom_customer_churn
group by Payment_method;

Select
Payment_method,
Count(*) As total_customers,
Sum(Case When churn='Yes' Then 1 Else 0 End) As churned_customers,
Round(
Sum(Case When churn='Yes' Then 1 Else 0 End)*100.0/count(*),
2
)
As churn_rate
From telecom_customer_churn
Group by payment_method
Order by churn_rate Desc;

SELECT
    senior_citizen,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),
        2
    ) AS churn_rate
FROM telecom_customer_churn
GROUP BY senior_citizen;

 Select
 churn,
 Round(Avg(monthly_charges),2) As average_monthly_charges,
 Round(Avg(total_charges),2) As average_total_charges
 From telecom_customer_churn
 Group by Churn;
 
SELECT
CASE
WHEN tenure <=12 THEN '0-12 Months'
WHEN tenure <=24 THEN '13-24 Months'
WHEN tenure <=36 THEN '25-36 Months'
WHEN tenure <=48 THEN '37-48 Months'
WHEN tenure <=60 THEN '49-60 Months'
ELSE '61-72 Months'
END AS tenure_group,
COUNT(*) AS total_customers,
SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) AS churned_customers,
ROUND(
SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),
2
) AS churn_rate
FROM telecom_customer_churn
GROUP BY tenure_group
ORDER BY tenure_group;

SELECT
CASE
WHEN monthly_charges <40 THEN 'Low'
WHEN monthly_charges <70 THEN 'Medium'
ELSE 'High'
END AS charge_category,
COUNT(*) total_customers,
SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) churned,
ROUND(
SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END)*100/COUNT(*),
2
) churn_rate
FROM telecom_customer_churn
GROUP BY charge_category;

Select
churn,
Round(Avg(tenure),2)average_tenure
From telecom_customer_churn
Group By churn;
 
 SELECT
payment_method,
COUNT(*) total_customers,
SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) churned,
ROUND(
SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END)*100/COUNT(*),
2
) churn_rate
FROM telecom_customer_churn
GROUP BY payment_method
ORDER BY churn_rate DESC
LIMIT 5;
 
 SELECT
contract,
internet_service,
COUNT(*) customers,
SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) churned,
ROUND(
SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END)*100/COUNT(*),
2
) churn_rate
FROM telecom_customer_churn
GROUP BY contract,internet_service
ORDER BY churn_rate DESC;

SELECT
customer_id,
tenure,
monthly_charges,
CASE
WHEN tenure>=48 THEN 'Loyal Customer'
WHEN tenure>=24 THEN 'Regular Customer'
ELSE 'New Customer'
END AS customer_segment
FROM telecom_customer_churn;

SELECT
contract,
ROUND(SUM(total_charges),2) total_revenue,
ROUND(AVG(monthly_charges),2) avg_monthly_charge
FROM telecom_customer_churn
GROUP BY contract
ORDER BY total_revenue DESC;
 
 SELECT
payment_method,
COUNT(*) total_customers,
RANK() OVER(ORDER BY COUNT(*) DESC) customer_rank
FROM telecom_customer_churn
GROUP BY payment_method;


 WITH churn_summary AS
(
SELECT
contract,
COUNT(*) total_customers,
SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) churned
FROM telecom_customer_churn
GROUP BY contract
)
SELECT
contract,
total_customers,
churned,
ROUND(churned*100.0/total_customers,2) churn_rate
FROM churn_summary;
 
 SELECT
COUNT(*) Total_Customers,
SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) Churned_Customers,
SUM(CASE WHEN churn='No' THEN 1 ELSE 0 END) Retained_Customers,
ROUND(AVG(monthly_charges),2) Avg_Monthly_Charge,
ROUND(AVG(total_charges),2) Avg_Total_Charge
FROM telecom_customer_churn;
 
 
 
 
 
 
 
 
 