SELECT
  COALESCE(p.name, '-') AS person_name,
  COALESCE(pv.visit_date::text, 'null') AS visit_date,
  COALESCE(piz.name, '-') AS pizzeria_name
FROM
  person AS p
  FULL JOIN (
    SELECT *
    FROM person_visits
    WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
  ) AS pv ON pv.person_id = p.id
  FULL JOIN pizzeria AS piz ON piz.id = pv.pizzeria_id
ORDER BY
  person_name,
  visit_date,
  pizzeria_name;