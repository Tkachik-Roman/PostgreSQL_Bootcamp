SELECT DISTINCT p.name
FROM person AS p
JOIN person_order AS po ON po.person_id = p.id
JOIN menu AS m ON m.id = po.menu_id
WHERE m.pizza_name IN ('pepperoni pizza', 'cheese pizza')
  AND p.gender = 'female'
ORDER BY p.name;