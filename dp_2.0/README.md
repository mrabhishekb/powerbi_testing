# dp_2.0 - DataOS 2.0 Vulcan Migration

This folder is the DataOS 2.0 (Vulcan) migration of the legacy Lens-based data product in `dp_1.0`.
It is also aligned to the `vulcan-deployment` reference layout on your Desktop.

## Migrated assets

- Inputs declared as external models in `input.yaml`
  - `public.order_items`
  - `public.products`
- Physical models
  - `models/bronze/order_items.sql`
  - `models/bronze/products.sql`
  - `models/gold/sales_enriched.sql`
- Semantic model
  - `models/semantics/sales_enriched.yaml`
- Metrics
  - `models/metrics/revenue_timeseries.yaml`
  - `models/metrics/line_items_timeseries.yaml`
- Quality and deployment
  - `checks/sales_enriched.yml`
  - `tests/test_sales_enriched.yaml`
  - `domain-resource.yaml`
  - `git-sync-secret.yml`
  - `Makefile`

## Dashboard outcomes supported

1. Revenue by product category (bar chart)
2. Monthly revenue trend (line chart)

Use semantic `sales_enriched` and metric `revenue_timeseries` for these views.

## Local Vulcan steps

1. Set up Python 3.10 venv and install Vulcan.
2. Export tenant variable:

```bash
export DATAOS_TENANT_ID="<your-tenant-id>"
```

3. Run checks:

```bash
vulcan info
vulcan plan
```

## Deploy on DataOS 2.0

1. Ensure this repo is pushed and accessible with git-sync secret.
2. Apply the reference-style deployment manifest:

```bash
dataos-ctl resource apply -f domain-resource.yaml
```

3. (Optional) Generate a fresh deploy manifest from `config.yaml`:

```bash
vulcan create_deploy_yaml
```

Or pipe directly:

```bash
vulcan create_deploy_yaml -o - | dataos-ctl resource apply --in
```
