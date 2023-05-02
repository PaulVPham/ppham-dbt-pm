with properties as (
    select * from {{ ref ('stg_properties') }}
),

units as (
    select 
        unit_id,
        unit_rent,
        property_id,
        bedrooms,
        bathrooms,
        status,
        address_1,
        address_2
    from {{ ref ('stg_units') }}
    where status = 'vacant'
),

final as (
    select
        properties.property_id
    from properties
    left join units using (property_id)
    group by 1 
    order by property_id asc 
)

select * from final