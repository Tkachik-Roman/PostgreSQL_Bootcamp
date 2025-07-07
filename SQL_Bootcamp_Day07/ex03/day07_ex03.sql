WITH cte_orders AS (
  SELECT
    name,
    COUNT(*) AS count
  FROM
    person_order
    JOIN menu ON menu.id = person_order.menu_id
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
  GROUP BY
    name
  ORDER BY
    count DESC
),
cte_visits AS (
  SELECT
    name,
    COUNT(*) as count
  FROM
    person_visits
    JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
  GROUP BY
    name
  ORDER BY
    count DESC
)
SELECT
  pizzeria.name,
  (
    CASE WHEN cte_visits.count IS NULL THEN 0 ELSE cte_visits.count END
  ) + 
  (
    CASE WHEN cte_orders.count IS NULL THEN 0 ELSE cte_orders.count END
  ) AS total_count
FROM
  pizzeria
  LEFT JOIN cte_visits ON cte_visits.name = pizzeria.name
  LEFT JOIN cte_orders ON cte_orders.name = pizzeria.name
ORDER BY
  total_count DESC,
  name;
