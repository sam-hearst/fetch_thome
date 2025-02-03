CREATE OR REPLACE TABLE
  `fetch-take-home.take_home.transformed_receipts` AS
SELECT
  _id.oid AS receipt_id,
  userId AS user_id,
  TIMESTAMP_MILLIS(purchaseDate.date) AS purchase_date,
  totalSpent AS total_spent,
  bonusPointsEarned AS bonus_points_earned,
  bonusPointsEarnedReason AS bonus_points_earned_reason,
  rewardsReceiptStatus AS rewards_receipt_status,
  TIMESTAMP_MILLIS(createDate.date) AS create_date,
  TIMESTAMP_MILLIS(modifyDate.date) AS modify_date,
  TIMESTAMP_MILLIS(dateScanned.date) AS date_scanned,
  TIMESTAMP_MILLIS(finishedDate.date) AS finished_date,
  TIMESTAMP_MILLIS(pointsAwardedDate.date) AS points_awarded_date,
  SAFE_CAST(pointsEarned AS FLOAT64) AS points_earned,
  SAFE_CAST(purchasedItemCount AS INT64) AS purchased_item_count
FROM
  `fetch-take-home.take_home.raw_receipts`;