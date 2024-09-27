with days as (
    {{dbt.date_spine(
        'day',
        "DATE(2016,01,01)",
        "DATE(2026,01,01)"
    )
    }}
),

final as (
    select cast(date_day as date) as date_day
    from days
)

SELECT *
  FROM final
