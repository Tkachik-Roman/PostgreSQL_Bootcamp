WITH not_ordered AS (
  SELECT id AS menu_id
  FROM menu
  EXCEPT
  SELECT menu_id
  FROM person_order
)
SELECT
  m.pizza_name,
  m.price,
  piz.name AS pizzeria_name
FROM
  pizzeria AS piz
  JOIN menu AS m ON piz.id = m.pizzeria_id
WHERE
  m.id IN (
    SELECT
      menu_id
    FROM
      not_ordered
  )
ORDER BY
  m.pizza_name,
  m.price;