MODEL (
  name bronze.order_items,
  kind FULL,
  grain [order_item_id],
  description 'Bronze projection of upstream public.order_items table.',
  assertions (
    not_null(columns := (order_item_id, order_id, product_id))
  )
);

SELECT
  order_item_id,
  order_id,
  product_id,
  order_item_quantity,
  order_item_unit_price,
  order_item_total_amount,
  order_item_margin_amount,
  order_item_fulfillment_status,
  order_item_warehouse_region,
  order_item_shipped_date,
  CAST(order_item_shipped_date AS TIMESTAMP) AS order_item_shipped_ts,
  order_item_returned_flag
FROM public.order_items;
