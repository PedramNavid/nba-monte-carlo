{{ 
    config(materialized='external')
}}

WITH cte_teams AS (
    SELECT
        scenario_id,
        conf,
        winning_team,
        seed,
        elo_rating
    FROM {{ ref( 'reg_season_end' ) }}
    WHERE season_rank < 7
    UNION ALL
    SELECT *
    FROM {{ ref('playin_sim_r2_end' ) }}
)

SELECT T.*
FROM cte_teams T
