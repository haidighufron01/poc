
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

    SELECT 
		ticket_no, 
		flight_id, 
		fare_conditions, 
		amount,
		amount*15000 as amount_in_idr
	FROM {{ source('bookings_source', 'ticket_flights') }}


)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
