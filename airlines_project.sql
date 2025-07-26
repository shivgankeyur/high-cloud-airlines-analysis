
#year,quater,month,wise_load_factor
with h as (select year,month,case when month in(1,2,3) then "QTR1"
when month in(4,5,6) then "QTR2" 
WHEN month in (7,8,9) then "QTR3"
when month in (10,11,12) then "QTR4"
else "nothing" end "quater_column",avg(Transported_Passengers)as transported ,avg(Available_Seats)as available
from maindata group by year,month,"quater_column")select year,month,quater_column,transported/available*100 from h;

#year_wise_load_factor

select year,avg(Transported_Passengers)/avg(Available_Seats)*100 from maindata group by year;

#distance_group_&number_of_flights
select Distance_Group_ID,count(Transported_Passengers)as number_flighs from maindata group by Distance_Group_ID order by number_flighs desc;


#2nd query,load_factor_carreir_names
select Carrier_Name,avg(Transported_Passengers)/avg(Available_Seats)*100 from maindata group by Carrier_Name;

#3rd quert,top_10_carrier_name_based_on_passenger_preference 
select Carrier_Name ,count(Transported_Passengers)as preference from maindata group by Carrier_Name order by preference desc limit 10;

#4th query,top_10_rouths 
select From_To_City ,sum(Transported_Passengers)as top_10_rouths from maindata group by From_To_City order by top_10_rouths desc limit 10;




