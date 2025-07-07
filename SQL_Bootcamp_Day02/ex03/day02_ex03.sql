WITH v_cte AS (
  SELECT
  d :: date as missing_date
  FROM
  generate_series(
    '2022-01-01', '2022-01-10', interval '1 day'
  ) AS d
  LEFT JOIN (
    SELECT
      visit_date
    FROM
      person_visits
    WHERE
      person_id = 1
      OR person_id = 2
  ) AS v ON d = v.visit_date
  WHERE
    v.visit_date IS NULL
  ORDER BY
    d
)
SELECT
  missing_date
FROM
  v_cte;