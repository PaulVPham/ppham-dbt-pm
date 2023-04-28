with source as (
    select * from {{ source('property_management', 'rental_applications') }}
),

staged as (
    select
        id as rental_application_id,
        created_at as ra_created_at,
        deleted_at as ra_deleted_at,
        status as status,
        contact_info_id as contact_info_id,
        uploaded_at as property_uploaded_at
    from source
)

select * from staged