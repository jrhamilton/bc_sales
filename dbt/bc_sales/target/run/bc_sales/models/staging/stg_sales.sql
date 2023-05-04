

  create or replace view `datatalksclub-375802`.`bandcamp_sales_schema`.`stg_sales`
  OPTIONS()
  as 

select * from bandcamp_sales_schema.bc_sales_ext
limit 1000;

