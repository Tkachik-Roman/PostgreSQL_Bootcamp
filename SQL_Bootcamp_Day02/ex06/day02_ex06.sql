SELECT
  m.pizza_name,
  piz.name as pizzeria_name
FROM
  (
    SELECT
      id,
      name
    FROM
      person
    WHERE
      name IN ('Anna', 'Denis')
  ) AS p
  JOIN person_order po ON po.person_id = p.id
  JOIN menu m ON m.id = po.menu_id
  JOIN pizzeria piz ON piz.id = m.pizzeria_id
ORDER BY
  m.pizza_name,
  piz.name;