CREATE OR REPLACE TABLE
  `fetch-take-home.take_home.transformed_brands` AS
SELECT
  _id.oid AS brand_id,
  barcode,
  brandCode AS brand_code,
  category,
  categoryCode AS category_code,
  cpg.ref AS cpg_ref,
  cpg.id.oid AS cpg_id,
  name,
  topBrand AS top_brand
FROM
  `fetch-take-home.take_home.raw_brands`; 