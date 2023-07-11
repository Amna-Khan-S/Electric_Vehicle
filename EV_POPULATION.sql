--Q1: What is the overall trend in the growth of EV population overtime?


SELECT MODEL_YEAR AS Registration_Year, COUNT(*) AS Car_Count
FROM EV_POPULATION
WHERE Model_year != 2024
GROUP BY Registration_Year
ORDER BY Registration_Year;

<img width="259" alt="Screenshot 2023-07-10 at 9 48 29 PM" src="https://github.com/Amna-Khan-S/Electric_Vehicle/assets/139021333/10fdc155-dbdd-4a83-a5e7-edb5fcad762f">
--Q2: Which specific EV manufacturer are most prevalent?

SELECT make AS manufacturer, count (dol_vehicle_id) AS car_count
FROM EV_POPULATION
WHERE Make IS NOT NULL
GROUP BY Make
ORDER BY Car_Count DESC
LIMIT 1;

--Q3: Which City has the most EV registration?

SELECT City, count (dol_vehicle_id) AS car_count
FROM EV_POPULATION
GROUP BY City
ORDER BY Car_Count DESC
LIMIT 1

--Q4: Which Manufacturer is most popular in Seattle?

SELECT Make, count (dol_vehicle_id) AS car_count
FROM ev_population
WHERE City = 'Seattle'
GROUP BY make
ORDER BY Car_Count DESC
LIMIT 1

--Q5: Which model has the most electric range?

SELECT DISTINCT model, make, Electric_range
From EV_population
WHERE electric_range IS NOT NULL
ORDER BY Electric_range DESC
LIMIT 1

--Q6: How many BEV each manufacturer has made?

SELECT DISTINCT Make, Count (Electric_Vehicle_Type)
FROM EV_population
Where Electric_Vehicle_Type LIKE 'Battery_Electric_Vehicle_(BEV)'
Group by make
ORDER BY COUNT DESC


--Q7: how many PHEV each manufacturer has made?

SELECT DISTINCT Make, Count (Electric_Vehicle_Type)
FROM EV_population
Where Electric_Vehicle_Type LIKE 'Plug_in_Hybrid_Electric_Vehicle_(PHEV)'
Group by make
ORDER BY COUNT DESC

--insights into the market share and popularity of different car manufacturers in the EV population dataset.

SELECT make AS manufacturer, count (dol_vehicle_id) AS car_count
FROM EV_POPULATION
WHERE Make IS NOT NULL
GROUP BY Make
ORDER BY Car_Count DESC

