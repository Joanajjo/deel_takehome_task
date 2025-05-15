with source as (
   select * from {{ source('deel', 'chargeback') }}
)
select
   external_ref,
   status,
   source as chargeback_source,
   chargeback
from source