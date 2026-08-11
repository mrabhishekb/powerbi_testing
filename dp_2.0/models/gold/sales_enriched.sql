MODEL (
  name gold.sales_enriched,
  kind FULL,
  grain [order_item_id],
  description 'Enriched order item fact table for dashboarding category and time-based revenue.',
  assertions (
    not_null(columns := (order_item_id, product_id, order_item_shipped_ts))
  )
);

SELECT
  oi.order_item_id,
  oi.order_id,
  oi.product_id,
  oi.order_item_quantity,
  oi.order_item_unit_price,
  oi.order_item_total_amount,
  oi.order_item_margin_amount,
  oi.order_item_fulfillment_status,
  oi.order_item_warehouse_region,
  oi.order_item_shipped_date,
  oi.order_item_shipped_ts,
  oi.order_item_returned_flag,
  p.product_name,
  p.product_category,
  p.product_subcategory,
  p.product_brand,
  p.product_supplier_country
FROM bronze.order_items AS oi
LEFT JOIN bronze.products AS p
  ON p.product_id = oi.product_id;
