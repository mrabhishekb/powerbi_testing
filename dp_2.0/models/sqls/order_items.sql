MODEL (
  name order_items,
  kind VIEW,
  grain order_item_id,
  description 'Order line facts including quantity, pricing, fulfillment, and revenue metrics.'
);

SELECT
  order_item_id,
  order_id,
  product_id,
  order_item_line_number,
  order_item_quantity,
  order_item_unit_price,
  order_item_unit_cost,
  order_item_discount_pct,
  order_item_discount_amount,
  order_item_subtotal_amount,
  order_item_tax_amount,
  order_item_total_amount,
  order_item_margin_amount,
  order_item_fulfillment_status,
  order_item_warehouse_region,
  order_item_shipped_date,
  DATE_TRUNC('month', order_item_shipped_date) AS order_item_shipped_month,
  order_item_returned_flag,
  order_item_fulfillment_status AS fulfillment_status,
  order_item_warehouse_region AS warehouse_region,
  CAST(order_item_shipped_date AS TIMESTAMP) AS shipped_date,
  order_item_returned_flag AS returned_flag,
  order_item_return_date,
  order_item_return_reason,
  order_item_created_at,
  order_item_updated_at
FROM public.order_items
