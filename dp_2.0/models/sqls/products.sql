MODEL (
  name sales.products,
  kind VIEW,
  grain product_id,
  description 'Product master attributes used for category and brand slicing.'
);

SELECT
  product_id,
  product_sku,
  product_name,
  product_category,
  product_subcategory,
  product_brand,
  product_supplier_name,
  product_lifecycle_status,
  product_launch_date,
  product_unit_cost,
  product_list_price,
  product_margin_pct,
  product_rating,
  product_review_count,
  product_active_flag,
  product_inventory_on_hand,
  product_supplier_country,
  product_supplier_country AS supplier_country,
  product_return_rate_pct,
  product_created_at,
  product_updated_at
FROM public.products
