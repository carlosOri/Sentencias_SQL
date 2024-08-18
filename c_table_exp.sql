WITH exit_name_customer AS(
    SELECT
        customer_id,
        order_id
    FROM
        exit
),
order_list_name AS (
    SELECT
        id
    FROM
        order_list
    WHERE
        name_order = 'jt-500.4.a'
)
SELECT
    *
FROM
    exit_name_customer
WHERE
    order_id in (
        SELECT
            id
        FROM
            order_list_name
    );

--ejemlpo 2
WITH nombre_proveedores AS (
SELECT s.name_supplier, o.type_base, o.name_order, o.centipoise FROM order_list o 
JOIN
supplier s on s.id = o.supplier_id)
SELECT * FROM nombre_proveedores;

--ejemplo 3
WITH
ol_name_order AS
(SELECT ol.name_order, ox.delivery_date, customer_id FROM order_exit ox
INNER JOIN order_list ol on ol.id = ox.order_id
WHERE delivery_date = '2024-08-24'),

c_name_order AS
(SELECT id FROM customer WHERE id = 2)

SELECT * FROM ol_name_order WHERE customer_id in (SELECT id FROM c_name_order)