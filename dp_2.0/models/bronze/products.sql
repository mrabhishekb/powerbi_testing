MODEL (
  name bronze.products,
  kind FULL,
  grain [product_id],
  description 'Bronze projection of upstream public.products table.',
  assertions (
    not_null(columns := (product_id))
  )
);

SELECT
  product_id,
  product_name,
  product_category,
  product_subcategory,
  product_brand,
  product_supplier_country
FROM public.products;
