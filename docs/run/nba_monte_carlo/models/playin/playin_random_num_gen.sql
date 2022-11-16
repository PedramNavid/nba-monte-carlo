

  create  table
    "main"."playin_random_num_gen__dbt_tmp"
  as (
    

SELECT i.scenario_id,
    s.game_id,
    random() as rand_result
FROM "main"."main"."scenario_gen" i
    CROSS JOIN "main"."main"."schedules" S
WHERE S.type ILIKE 'playin%'
  );
