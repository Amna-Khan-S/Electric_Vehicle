-- Table: public.ev_population

-- DROP TABLE IF EXISTS public.ev_population;

CREATE TABLE IF NOT EXISTS public.ev_population
(
    vin character varying(10) COLLATE pg_catalog."default",
    county character varying(255) COLLATE pg_catalog."default",
    city character varying(255) COLLATE pg_catalog."default",
    state character varying(255) COLLATE pg_catalog."default",
    postal_code character varying(10) COLLATE pg_catalog."default",
    model_year integer,
    make character varying(255) COLLATE pg_catalog."default",
    model character varying(255) COLLATE pg_catalog."default",
    electric_vehicle_type character varying(255) COLLATE pg_catalog."default",
    cafv_eligibility character varying(255) COLLATE pg_catalog."default",
    electric_range integer,
    base_msrp numeric(18,2),
    legislative_district integer,
    dol_vehicle_id character varying(255) COLLATE pg_catalog."default",
    vehicle_location character varying(255) COLLATE pg_catalog."default",
    electric_utility character varying(255) COLLATE pg_catalog."default",
    census_tract_2020 character varying(255) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ev_population
    OWNER to postgres;
	
	
--Q1: What is the overall trend in the growth of EV population overtime?

 SELECT MODEL_YEAR AS Registration_Year, COUNT(*) AS Car_Count
 FROM EV_POPULATION
 WHERE Model_year != 2024
 GROUP BY Registration_Year
 ORDER BY Registration_Year;
 
 --Q2: Identifying the top electric vehicle models by their registration count.

 SELECT make AS manufacturer, count (dol_vehicle_id) AS car_count
 FROM EV_POPULATION
 WHERE Make IS NOT NULL
 GROUP BY Make
 ORDER BY Car_Count DESC
 LIMIT 1;

--Q4: Insights into the market share and popularity of different car manufacturers in the EV population dataset.

SELECT make AS manufacturer, count (dol_vehicle_id) AS car_count
FROM EV_POPULATION
WHERE Make IS NOT NULL
GROUP BY Make
ORDER BY Car_Count DESC

 
 --Q5: Which City has the most EV registration?

 SELECT City, count (dol_vehicle_id) AS car_count
 FROM EV_POPULATION
 GROUP BY City
 ORDER BY Car_Count DESC
 LIMIT 1

--Q6: Which Manufacturer is most popular in Seattle?

SELECT Make, count (dol_vehicle_id) AS car_count
FROM ev_population
WHERE City = 'Seattle'
GROUP BY make
ORDER BY Car_Count DESC
LIMIT 1

--Q7: Which model has the most electric range?

SELECT DISTINCT model, make, Electric_range
From EV_population
WHERE electric_range IS NOT NULL
ORDER BY Electric_range DESC
LIMIT 1

--Q8: How many BEV each manufacturer has made?

SELECT DISTINCT Make, Count (Electric_Vehicle_Type)
FROM EV_population
Where Electric_Vehicle_Type LIKE 'Battery_Electric_Vehicle_(BEV)'
Group by make
ORDER BY COUNT DESC

--Q9: how many PHEV each manufacturer has made?

SELECT DISTINCT Make, Count (Electric_Vehicle_Type)
FROM EV_population
Where Electric_Vehicle_Type LIKE 'Plug_in_Hybrid_Electric_Vehicle_(PHEV)'
Group by make
ORDER BY COUNT DESC

