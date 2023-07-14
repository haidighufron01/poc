{{ config(materialized='table') }}

with source_data as (

    SELECT 
		airport_code, 
		airport_name, 
		airport_name::json->>'en' as en_airport_name,
		airport_name::json->>'ru' as ru_airpot_name,
		city,
		city::json->>'en' as en_city_name,
		city::json->>'ru' as ru_city_name,
		coordinates, 
		timezone
	FROM {{ source('bookings_source', 'airports_data') }}


)

select *
from source_data