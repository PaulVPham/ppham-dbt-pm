with source as (
    select * from {{ source('property_management', 'units') }}
),

staged as (
    select
        id as unit_id,
        created_at as unit_created_at,
        rent as unit_rent,
        property_id as property_id,
        name as unit_name,
        bedrooms as bedrooms,
        bathrooms as bathrooms,
        square_feet as unit_square_feet,
        status as status,
        address_1 as address_1,
        address_2 as address_2,
        city as city,
        state as state,
        zip_code as zip_code,
        uploaded_at as uploaded_at
    from source
)

select * from staged