# Demo Data Product on DataOS

This repo contains a minimal DataOS data product scaffold on top of your Azure PostgreSQL `demo` database.

## What was explored

Using your credentials and `public` schema:

- Tables found: `order_items`, `products`
- Rows: `order_items` = 100, `products` = 100
- Useful chart dimensions identified:
  - `product_category`
  - `order_item_shipped_date` (monthly trend)
  - `order_item_fulfillment_status`

Observed aggregates from live data:

- Fulfillment status revenue:
  - Fulfilled: 146572.40
  - In Progress: 67198.14
  - Pending: 39388.43
- Revenue by category:
  - Services: 54442.41
  - Office: 53130.59
  - Electronics: 53058.02
  - Software: 49670.52
  - Industrial: 42857.43

## What is included

- Lens model:
  - `dataproduct/lens/model/sqls`
  - `dataproduct/lens/model/tables`
  - `dataproduct/lens/model/views`
  - `dataproduct/lens/model/user_groups.yaml`
- DataOS resources:
- `dataproduct/lens/deployment.yaml`
  - `dataproduct/resources/bundle.yaml`
  - `dataproduct/resources/data_product/deployment.yaml`
  - `dataproduct/resources/scanner.yaml`
- Dashboard-ready SQL:
  - `dataproduct/dashboard/chart_queries.sql`

## 2-chart dashboard design

1. `Revenue by Product Category` (bar chart)
2. `Monthly Revenue Trend` (line chart)

## Deploy flow on DataOS

1. Push this repo to GitHub/Bitbucket.
2. Update placeholders in:
   - `dataproduct/lens/deployment.yaml` (`repo.url`, `lensBaseDir`, `source`)
   - `dataproduct/resources/bundle.yaml` (`bundle.resources[].file`)
   - `dataproduct/resources/data_product/deployment.yaml` (`sourceCodeUrl`, `inputs`)
3. Apply resources:
   - `dataos-ctl resource apply -f dataproduct/lens/deployment.yaml -w public`
   - `dataos-ctl resource apply -f dataproduct/resources/bundle.yaml -w public`
   - `dataos-ctl product apply -f dataproduct/resources/data_product/deployment.yaml`
   - `dataos-ctl resource apply -f dataproduct/resources/scanner.yaml -w public`
4. Open Data Product Hub and use Explore/Navigator to create the two charts from the Lens views or from the SQL in `dataproduct/dashboard/chart_queries.sql`.

## Notes

- This is intentionally simple and enough to stand up a basic dashboard quickly.
- If you share your DataOS workspace/depot/repo details, this can be fully parameterized for direct apply with no manual edits.
