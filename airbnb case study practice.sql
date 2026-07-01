use da_offline;
select * from airbnb_open_data_sqll;

-- Pricing Trends across neighbourhoods
-- Room type popularity
-- Host behaviour and guest activity
-- Booking patterns and availability

-- Pricing Trends across neighbourhoods
select neighbourhood_group_latest, neighbourhood, avg(price) from airbnb_open_data_sqll
group by 1,2
order by avg(price) desc;

-- Insights :
-- new dorp and chelsea has the highest average price.
-- lighthouse hill has the lowest average price.
-- which property is giving the new dorp and chelsea the highest price
select id, name, neighbourhood, price
from airbnb_open_data_sqll
where neighbourhood in ("New Dorp","Chelsea, Staten Island");
-- most expensive property : staten island studio(17840963) , cozy peaceful newly renovated w/ac everything(30348901)
-- least expensive property : staten island studio(52598859)


-- Room type popularity
select room_type, count(distinct id) as count_properties, round(avg(review_rate_number),3) as avg_rating, round(avg(price),2)
from airbnb_open_data_sqll
group by 1
order by count_properties desc;

-- insights :
-- hosts prefer entire rooms but customers like hotel rooms most.
-- probable reason beingh that hotels are well prepared to homes and they are taken care of more. thats why hotels price are also high. 

-- Host behaviour and guest activity
-- host identity
select host_identity_verified, count(distinct id) 
from airbnb_open_data_sqll
group by host_identity_verified
order by count(distinct id) desc;
-- Insight : most of the host are not verified which is not good 
-- instant bookable policy
select instant_bookable , count(distinct id) 
from airbnb_open_data_sqll
group by instant_bookable
order by count(distinct id) desc;
-- cancelation policy
select cancellation_policy, count(distinct id) as policy_count 
from airbnb_open_data_sqll
group by cancellation_policy
order by count(distinct id) desc;
-- Insight : most of the cancellation policy is moderate followed by strict which is not good. This tells 
-- review rate number
select name, avg(review_rate_number) 
from airbnb_open_data_sqll
group by name 
order by avg(review_rate_number) asc;
-- Insight : convenient central comfortable, garden oasis in the of nyc has lowest average rating
select name, avg(review_rate_number) 
from airbnb_open_data_sqll
group by name 
order by avg(review_rate_number) desc;
-- Insight : sunny rm w/ garden view! safe 3 min, quiet front bedroom in 4br park has highest average review
-- availability 365
select name, avg(availability_365) 
from airbnb_open_data_sqll
group by name 
order by avg(availability_365) desc;
-- service fee
select name, sum(service_fee) 
from airbnb_open_data_sqll
group by name 
order by sum(service_fee) desc;
-- guest activity : reviev rate number

