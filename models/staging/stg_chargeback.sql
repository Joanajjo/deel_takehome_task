with source as (
   select * from {{ source('globepay','CHARGEBACK')}}
)
select
   external_ref,
   status,
   source as chargeback_source,
   chargeback
from source