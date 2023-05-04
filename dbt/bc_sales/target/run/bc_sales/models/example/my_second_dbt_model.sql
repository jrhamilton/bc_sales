

  create or replace view `datatalksclub-375802`.`bandcamp_sales_tbl`.`my_second_dbt_model`
  OPTIONS()
  as -- Use the `ref` function to select from other models

select *
from `datatalksclub-375802`.`bandcamp_sales_tbl`.`my_first_dbt_model`
where id = 1;

