{{ config (
 materialized='view'
) }}

select
    count(distinct customer_id) as customer_count
from
{{ ref('customers') }}