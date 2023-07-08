--how many PHEV each manufacturer has made?

SELECT DISTINCT Make, Count (Electric_Vehicle_Type)
FROM EV_population
Where Electric_Vehicle_Type LIKE 'Plug_in_Hybrid_Electric_Vehicle_(PHEV)'
Group by make
ORDER BY COUNT DESC
