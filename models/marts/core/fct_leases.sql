with leases as (
    select * from {{ ref ('stg_leases') }}
),

units as (
    select * from {{ ref ('stg_units') }}
),

rental_applications as (
    select * from {{ ref ('stg_rental_applications') }}
),

approved_applicants as (
    select 
        rental_application_id,
        application_status
    from rental_applications
    where application_status = 'converted_to_tenant'
),

leased_units as (
    select 
        unit_id,
        unit_name,
        unit_rent,
        property_id,
        status
    from units
    where status = 'rented' or status = 'occupied'
),

final as (
    select
        leases.lease_id,
        leases.lease_start_date as lease_start_date,
        leases.lease_end_date as lease_end_date,
        approved_applicants.rental_application_id,
        approved_applicants.application_status as application_status,
        leased_units.unit_id as unit_id,
        leased_units.unit_rent,
        leased_units.property_id,
        leased_units.status as unit_status

    from leases
    inner join leased_units using (unit_id)
    inner join approved_applicants using (rental_application_id)
)

select * from final

