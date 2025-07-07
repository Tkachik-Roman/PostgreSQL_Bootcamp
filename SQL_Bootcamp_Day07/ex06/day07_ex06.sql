SELECT
  pizzeria.name,
  COUNT(order_date) AS count_of_orders,
  ROUND(AVG(price), 2) AS average_price,
  max(price) AS max_price,
  min(price) AS min_price
FROM
  pizzeria
  JOIN menu on pizzeria.id = menu.pizzeria_id
  JOIN person_order ON menu.id = person_order.menu_id
GROUP BY
  pizzeria.name
ORDER BY
  pizzeria.name;
