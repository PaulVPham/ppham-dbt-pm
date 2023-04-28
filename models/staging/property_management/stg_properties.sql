with source as (
    select * from {{ source('property_management', 'properties') }}
),

staged as (
    select
        id as property_id,
        created_at as created_at,
        name as property_name,
        address as property_address,
        city as city,
        state as state,
        zip_code as zip_code,
        type as property_type,
        year_built as year_built,
        uploaded_at as property_uploaded_at
    from source
)

select * from staged