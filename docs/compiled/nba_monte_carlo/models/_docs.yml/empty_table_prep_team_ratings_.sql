

    with __dbt__cte__raw_team_ratings as (
SELECT *
FROM '/tmp/data_catalog/psa/team_ratings/*.parquet'
),  __dbt__cte__prep_team_ratings as (
SELECT *
FROM __dbt__cte__raw_team_ratings
)SELECT COALESCE(COUNT(*),0) AS records
    FROM __dbt__cte__prep_team_ratings
    HAVING COUNT(*) = 0
