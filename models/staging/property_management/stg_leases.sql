with source as (
    select * from {{ source('property_management', 'leases') }}
),

staged as (
    select
        id as lease_id,
        created_at as created_at,
        unit_id as unit_id,
        start_date as lease_start_date,
        end_date as lease_end_date,
        rental_application_id as rental_application_id,
        completed as lease_completed,
        uploaded_at as lease_uploaded_at
    from source
)

select * from staged