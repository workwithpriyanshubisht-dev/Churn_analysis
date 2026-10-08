create database churn_analysis_db;
 use churn_analysis_db;
 -- total customers
 select count(*) from cleaned_churn_data;
 
 -- total churn customers
  select count(*) from cleaned_churn_data
  where churn = "yes";
  
-- churn rate
select round(sum(case when churn = "yes" then 1 else 0 end)*100/
count(*),2)
as churn_rate from cleaned_churn_data;

-- average monthly charges
select avg(Monthly_Charges)
from cleaned_churn_data;

-- average tenure
select avg(Tenure_Months)
from cleaned_churn_data;

-- churn by contract type
select contract_type,count(*) as Customers
from cleaned_churn_data
group by contract_type;

-- churn by internet service
select internet_service,count(*) as Customers
from cleaned_churn_data
group by internet_service;

-- churn by state
select state,count(*) from cleaned_churn_data
where churn = "yes"
group by state
order by 2 desc;

-- payment methodwise customers
select Payment_Method,
count(*)
from cleaned_churn_data
group by Payment_Method;

-- subscription type customers
select Subscription_Type,
count(*) from cleaned_churn_data
group by Subscription_Type;

-- highest revenue states
select state,
sum(Total_Charges) as State_Charges
from cleaned_churn_data
group by State
order by 2 desc;

-- average charges by contract
select contract_type,
avg(Monthly_charges)
from cleaned_churn_data
group by Contract_type;

-- senior citizen churn
select Senior_Citizen,
count(*) from cleaned_churn_data
where churn = "yes"
group by Senior_citizen;

-- top 10 high value customers
select Customer_name,customer_value
from cleaned_churn_data
order by customer_value desc
limit 10;

-- customer without tech support
select * from cleaned_churn_data
where tech_support = 'No';
