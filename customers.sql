with orders_info as (
  select customer_id
  , min(created_at) as first_order_at
  , count(id) as number_of_orders
  from `analytics-engineers-club.coffee_shop.orders`
  group by customer_id
 )
 select customers.id
 , customers.name
 , customers.email
 , orders_info.first_order_at
 , orders_info.number_of_orders
 from `analytics-engineers-club.coffee_shop.customers` as customers
  inner join orders_info
    on customers.id = orders_info.customer_id
order by first_order_at
limit 5;