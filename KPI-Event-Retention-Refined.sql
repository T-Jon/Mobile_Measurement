SELECT
    DATE(i.date_occurred) AS Registation_Complete_date_utc,
    i.network_name as network_name,
    COUNT(DISTINCT i.install_id) AS Registration_Complete,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 1 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_1,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 2 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_2,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 3 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_3,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 4 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_4,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 5 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_5,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 6 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_6,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 7 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_7,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 8 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_8,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 9 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_9,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 10 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_10,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 11 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_11,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 12 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_12,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 13 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_13,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 14 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_14,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 15 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_15,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 16 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_16,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 17 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_17,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 18 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_18,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 19 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_19,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 20 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_20,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 21 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_21,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 22 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_22,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 23 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_23,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 24 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_24,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 25 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_25,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 26 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_26,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 27 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_27,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 28 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_28,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 29 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_29,
    ROUND(COUNT(DISTINCT(CASE WHEN TIMESTAMP_DIFF(e.date_occurred, i.date_occurred, DAY) = 30 THEN i.install_id ELSE NULL END)) / COUNT(DISTINCT i.install_id) * 100, 1) AS day_30
FROM (
SELECT MIN(date_occurred) AS date_occurred, install_id, COALESCE(network_name, 'Unattributed') AS network_name
FROM events_primary
WHERE event_name = 'Registration Complete'
  AND DATE(date_occurred) between DATE(DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL -60 DAY)) -- start of date range
      and DATE(DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL -1 DAY)) -- end of date range
  AND install_id <> '0'
group by network_name, install_id
) i
  LEFT OUTER JOIN events_primary e
      ON i.install_id = e.install_id
GROUP BY
    Registation_Complete_date_utc,
    network_name
ORDER BY Registation_Complete_date_utc ASC
