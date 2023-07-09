-- Order Activity dasboard --

SELECT
	o.order_id,
    i.item_price,
    o.quantity,
    i.item_cat,
    i.item_name,
    o.created_at,
    a.delivery_address1,
    a.delivery_city,
    a.delivery_zipcode,
    o.delivery
 FROM
 	orders o
    LEFT JOIN item i ON o.item_id = i.item_id
    LEFT JOIN address a ON o.add_id = a.add_id


-- Inventory Management dasboard 1 (Food Cost)--

CREATE VIEW stock1
AS

WITH 
t1 AS
	(SELECT
		o.item_id,
    	i.sku,
    	i.item_name,
    	r.ing_id,
    	ing.ing_name,
    	r.quantity AS recipe_quantity,
    	sum(o.quantity) AS order_quantity,
    	ing.ing_weight,
    	ing.ing_price
	FROM
		orders o
    	LEFT JOIN item i ON o.item_id = i.item_id
    	LEFT JOIN recipe r ON i.sku = r.recipe_id
    	LEFT JOIN ingredient ing ON ing.ing_id = r.ing_id
	GROUP BY
		o.item_id,
   		i.sku,
    	i.item_name,
   		r.ing_id,
    	r.quantity,
    	ing.ing_name,
    	ing.ing_weight,
    	ing.ing_price)
  
  SELECT	
 		item_name,
    	ing_id,
    	ing_name,
    	ing_weight,
    	ing_price,
    	order_quantity,
    	recipe_quantity,
   		order_quantity*recipe_quantity As ordered_weight,
    	ROUND((ing_price/ing_weight), 2) AS unit_cost,
    	ROUND(((order_quantity*recipe_quantity)*(ing_price/ing_weight)), 2) AS ingredient_cost
 	FROM 
 		t1


-- Inventory Management dasboard 2 (Inventory Stock) --

WITH t2 AS

	(SELECT 
		ing_id,
    	ing_name,
    		sum(ordered_weight) AS ordered_weight 
	FROM 
		stock1
	WHERE ing_name IS NOT NULL
    group BY ing_id, ing_name)
    
SELECT 
	t2.ing_name,
    t2.ordered_weight,
    ing.ing_weight*inv.quantity AS total_inv_weight,
    (ing.ing_weight * inv.quantity)-t2.ordered_weight AS remaining_weight
FROM t2
LEFT JOIN inventory inv ON inv.item_id = t2.ing_id
LEFT JOIN ingredient ing ON ing.ing_id = t2.ing_id


-- Staff Cost --

SELECT
	r.date,
    s.first_name,
    s.last_name,
    s.hourly_rate,
    sh.start_time,
    sh.end_time,
	(JULIANDAY(sh.end_time) - JULIANDAY(sh.start_time)) * 24 AS shift_hours,
    ((JULIANDAY(sh.end_time) - JULIANDAY(sh.start_time)) * 24)*s.hourly_rate AS staff_cost
FROM 
	rota r
LEFT JOIN staff s on r.staff_id = s.staff_id
LEFT JOIN shift sh ON r.shift_id = sh.shift_id