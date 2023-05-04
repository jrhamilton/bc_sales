


with countries as (
    select * from `datatalksclub-375802`.`bandcamp_sales_schema`.`stg_sales_by_country`
)--, TODO

--country_ref as (
--    select * from `datatalksclub-375802`.`bandcamp_sales_schema`.`stg_country_code_ref`
--)

select
    countries.cc_ref as ref,
    count(countries.cc_ref) as total_transactions,
    avg(countries.amount_paid_usd) as average_sale_usd,
    sum(countries.amount_paid_usd) as total_sales_usd,
from countries
--inner join country_ref --TODO
--on countries.cc_ref = country_ref.cc_ref
group by countries.cc_ref
order by average_sale_usd desc