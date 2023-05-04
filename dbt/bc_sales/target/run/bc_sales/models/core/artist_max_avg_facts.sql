
  
    

    create or replace table `datatalksclub-375802`.`bandcamp_sales_schema`.`artist_max_avg_facts`
    
    

    OPTIONS()
    as (
      

with facts as (
    select * from `datatalksclub-375802`.`bandcamp_sales_schema`.`artist_facts`
),

refs as (
    select * from `datatalksclub-375802`.`bandcamp_sales_schema`.`stg_country_code_ref`
),

max_avg_sales as (
    select
        facts.cc_ref as ref,
        --facts.artist,
        max(facts.avg_sales_usd) as max_avg_usd
    from facts
    group by 1
)

select
    max_avg_sales.ref as ref,
    max_avg_sales.max_avg_usd as max_avg_usd,
    facts.artist as artist
from max_avg_sales
left join facts
on max_avg_sales.ref = facts.cc_ref
and max_avg_sales.max_avg_usd = facts.avg_sales_usd
order by 1
    );
  