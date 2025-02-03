CREATE OR REPLACE TABLE
  `fetch-take-home.take_home.transformed_receipt_items` AS
WITH
  receipt_items AS (
  SELECT
    _id.oid AS receipt_id,
    item.partnerItemId AS receipt_item_id,
    item.barcode AS barcode,
    item.description AS description,
    item.finalPrice AS final_price,
    item.itemPrice AS item_price,
    item.quantityPurchased AS quantity_purchased,
    item.needsFetchReview AS needs_fetch_review,
    item.userFlaggedBarcode AS user_flagged_barcode,
    item.userFlaggedPrice AS user_flagged_price,
    item.userFlaggedQuantity AS user_flagged_quantity,
    item.rewardsGroup AS rewards_group,
    item.pointsEarned AS points_earned,
    item.pointsPayerId AS points_payer_id
  FROM
    `fetch-take-home.take_home.raw_receipts`,
    UNNEST(rewardsReceiptItemList) AS item )
SELECT
  *
FROM
  receipt_items;