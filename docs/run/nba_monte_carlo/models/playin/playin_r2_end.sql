
  create view "main"."playin_r2_end__dbt_tmp" as (
    -- get the winners from r1 and assign to seed 7
-- then union all and get winners from r2 and assign seed 8

SELECT P1.scenario_id,
    R.conf,
    P1.winning_team,
    R.conf || '-7' AS seed
FROM "main"."main"."playin_r1_end" P1
    LEFT JOIN "main"."main"."ratings" R ON R.team = P1.winning_team
WHERE P1.result = 'winner advance'
UNION ALL
SELECT P2.scenario_id,
    R.conf,
    P2.winning_team,
    R.conf || '-8' AS seed
FROM "main"."main"."playin_sim_r2" P2 
    LEFT JOIN "main"."main"."ratings" R ON R.team = P2.winning_team
  );
