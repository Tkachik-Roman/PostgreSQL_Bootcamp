SELECT 
  piz.name AS pizzeria_name
FROM 
  person p
  JOIN person_visits pv ON p.id = pv.person_id
  JOIN pizzeria piz ON piz.id = pv.pizzeria_id
  JOIN menu m ON m.pizzeria_id = piz.id
WHERE 
  p.name = 'Dmitriy'
  AND pv.visit_date = '2022-01-08'
  AND m.price < 800
ORDER BY 
  pizzeria_name;




