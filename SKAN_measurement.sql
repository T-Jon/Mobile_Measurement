-- SkadNetwork attributed install count (in Pacific Time) by network

SELECT
	date_PT,
    network_name,
    SUM(skad_install) as total_skad_installs
FROM
(SELECT
  EXTRACT(DATE FROM TIMESTAMP_SUB(skad_date_received_utc, INTERVAL (36+coalesce(k_conversion_value_days_since_install,0) * 24) HOUR) AT TIME ZONE 'America/Los_Angeles') AS date_PT,
  k_network_name AS network_name,
  skad_campaign_id AS campaign_id,
  JSON_EXTRACT_SCALAR(partner_slots, '$.partner_campaign_name') AS campaign_name,
  k_conversion_value_measurement_window as measurement_window,
  k_conversion_value_description as conversion_value_description,
  SUM(COALESCE(count,0)) as skad_install
FROM
  (
    SELECT
      *,
       ROW_NUMBER() OVER(PARTITION BY skad_transaction_id ORDER BY k_in_timestamp DESC) AS latest
    FROM skad_conversions
    WHERE DATE(TIMESTAMP_SUB(skad_date_received_utc, INTERVAL (36+coalesce(k_conversion_value_days_since_install,0) * 24) HOUR)) >= DATE(DATE_ADD(CURRENT_DATE(), INTERVAL -60 DAY))
      AND DATE(TIMESTAMP_SUB(skad_date_received_utc, INTERVAL (36+coalesce(k_conversion_value_days_since_install,0) * 24) HOUR)) <= DATE(DATE_ADD(CURRENT_DATE(), INTERVAL -1 DAY))
      AND (coalesce(skad_did_win, true) = true)
  )
WHERE latest = 1
GROUP BY
  date_PT,
  network_name,
  campaign_id,
  campaign_name,
  measurement_window,
  conversion_value_description
ORDER BY
  date_PT,
  network_name)
GROUP BY date_PT, network_name
ORDER BY date_PT asc
