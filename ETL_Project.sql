-- ETL Project submission on 10/18/2019 by Team: Adelia Manuel, John Knight, Rashid Khokhar
-- A database ETL_Proj_DB was created in PostgreSQL. 
-- Two tables were created and stored in this database through Jupyter Notebook (running ETL_Project_VerC.ipynb)
-- This SQL was then run to compute average pricing of similar AirBnB accomodations for two coastal locations; NY and Seatle

create table NY_Stats as
select 
	room_type, 
	round(avg(price),2) as Avg_Price, 
	round(avg(reviews), 1) as Avg_Reviews 
from "NY" 
group by room_type;

create table SE_Stats as
select 
	room_type, 
	round(avg(price),2) as Avg_Price, 
	round(avg(reviews), 1) as Avg_Reviews 
from "NY" 
group by room_type;

SELECT
    ny.room_type ,
    ny.avg_price as NY_Avg_Price,
    se.avg_price as SE_Avg_Price
FROM
    "ny_stats"  ny
FULL JOIN "se_stats"  se ON ny.room_type = se.room_type;
