-- MAU or Monthly Active Users
-- Must include 2 digit month and 4 digit year. Be aware of time-zone discrepancies

SELECT
    app_name,
    COUNT(DISTINCT(device_id)) AS mau_count
FROM
  (
      (
      SELECT COALESCE(adid,idfa,kochava_device_id) AS device_id,
        kochava_device_id,
       'App_Name_1' as app_name
      FROM app_{app_id}.events_primary
      WHERE EXTRACT(MONTH FROM date_occurred) = 11
          AND EXTRACT(YEAR FROM date_occurred) = 2022
    )
UNION ALL
    (
      SELECT COALESCE(adid,idfa,kochava_device_id) AS device_id,
        kochava_device_id,
       'App_Name_2' as app_name
      FROM app_{app_id}.events_primary
      WHERE EXTRACT(MONTH FROM date_occurred) = 11
          AND EXTRACT(YEAR FROM date_occurred) = 2022
  )
  UNION ALL
    (
      SELECT COALESCE(adid,idfa,kochava_device_id) AS device_id,
        kochava_device_id,
       'App_Name_3' as app_name
      FROM app_{app_id}.events_primary
      WHERE EXTRACT(MONTH FROM date_occurred) = 11
          AND EXTRACT(YEAR FROM date_occurred) = 2022
  )
     UNION ALL
    (
      SELECT COALESCE(adid,idfa,kochava_device_id) AS device_id,
        kochava_device_id,
       'App_Name_4' as app_name
      FROM app_{app_id}.events_primary
      WHERE EXTRACT(MONTH FROM date_occurred) = 11
          AND EXTRACT(YEAR FROM date_occurred) = 2022
    )
  UNION ALL
    (
      SELECT COALESCE(adid,idfa,kochava_device_id) AS device_id,
        kochava_device_id,
       'App_Name_5' as app_name
      FROM app_{app_id}.events_primary
      WHERE EXTRACT(MONTH FROM date_occurred) = 11
          AND EXTRACT(YEAR FROM date_occurred) = 2022
    )
UNION ALL
    (
      SELECT COALESCE(adid,idfa,kochava_device_id) AS device_id,
        kochava_device_id,
       'App_Name_6' as app_name
      FROM app_{app_id}.events_primary
      WHERE EXTRACT(MONTH FROM date_occurred) = 11
          AND EXTRACT(YEAR FROM date_occurred) = 2022
    )
 )
group by app_name
order by mau_count asc
