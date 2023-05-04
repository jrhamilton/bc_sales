
  
    

    create or replace table `datatalksclub-375802`.`bandcamp_sales_schema`.`artist_max_sales_facts`
    
    

    OPTIONS()
    as (
      

with facts as (
    select * from `datatalksclub-375802`.`bandcamp_sales_schema`.`artist_facts`
),

refs as (
    select * from `datatalksclub-375802`.`bandcamp_sales_schema`.`stg_country_code_ref`
),

max_total_sales as (
    select
        facts.cc_ref as ref,
        --facts.artist,
        max(facts.total_sales_usd) as max_sales_usd
    from facts
    group by 1
    order by 1
)

select
    max_total_sales.ref as ref,
    max_total_sales.max_sales_usd as max_sales_usd,
    facts.artist as artist
from max_total_sales
left join facts
on max_total_sales.ref = facts.cc_ref
and max_total_sales.max_sales_usd = facts.total_sales_usd
order by 1
    );
  