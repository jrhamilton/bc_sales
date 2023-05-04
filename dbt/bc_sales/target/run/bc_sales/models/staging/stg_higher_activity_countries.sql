

  create or replace view `datatalksclub-375802`.`bandcamp_sales_schema`.`stg_higher_activity_countries`
  OPTIONS()
  as 

-- Q2, Q3

select
    cast(cc_ref as integer) as cc_ref,
    cast(artist_name as string) as artist_name,
    cast(amount_paid_usd as numeric) as amount_paid_usd,
    cast(country_code as string) as country_code, --REMOVE THIS TOO??
    cast(country as string) as country -- TODO: REMOVE THIS LINE
from `datatalksclub-375802`.`bandcamp_sales_schema`.`sales_clustered`
where cc_ref <= 115
order by
    cc_ref asc,
    artist_name asc;

