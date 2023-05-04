

  create or replace view `datatalksclub-375802`.`bandcamp_sales_schema`.`stg_country_avg_sales`
  OPTIONS()
  as 

select
  cast(cc_ref as integer) as cc_ref,
  cast(amount_paid_usd as numeric) as amount_paid_usd,

  cast(country_code as string) as country_code,
  cast(country as string) as country

from `datatalksclub-375802`.`bandcamp_sales_schema`.`sales_clustered`
limit 1000;

