--Active users by day, by network for the last 30 days

SELECT
    DATE(i.date_occurred) AS install_date_utc,
    i.network_name as network_name,
    COUNT(DISTINCT i.install_id) AS installs,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 1 THEN i.install_id ELSE NULL END)) AS day_1,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 2 THEN i.install_id ELSE NULL END)) AS day_2,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 3 THEN i.install_id ELSE NULL END)) AS day_3,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 4 THEN i.install_id ELSE NULL END)) AS day_4,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 5 THEN i.install_id ELSE NULL END)) AS day_5,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 6 THEN i.install_id ELSE NULL END)) AS day_6,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 7 THEN i.install_id ELSE NULL END)) AS day_7,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 8 THEN i.install_id ELSE NULL END)) AS day_8,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 9 THEN i.install_id ELSE NULL END)) AS day_9,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 10 THEN i.install_id ELSE NULL END)) AS day_10,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 11 THEN i.install_id ELSE NULL END)) AS day_11,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 12 THEN i.install_id ELSE NULL END)) AS day_12,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 13 THEN i.install_id ELSE NULL END)) AS day_13,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 14 THEN i.install_id ELSE NULL END)) AS day_14,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 15 THEN i.install_id ELSE NULL END)) AS day_15,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 16 THEN i.install_id ELSE NULL END)) AS day_16,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 17 THEN i.install_id ELSE NULL END)) AS day_17,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 18 THEN i.install_id ELSE NULL END)) AS day_18,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 19 THEN i.install_id ELSE NULL END)) AS day_19,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 20 THEN i.install_id ELSE NULL END)) AS day_20,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 21 THEN i.install_id ELSE NULL END)) AS day_21,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 22 THEN i.install_id ELSE NULL END)) AS day_22,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 23 THEN i.install_id ELSE NULL END)) AS day_23,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 24 THEN i.install_id ELSE NULL END)) AS day_24,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 25 THEN i.install_id ELSE NULL END)) AS day_25,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 26 THEN i.install_id ELSE NULL END)) AS day_26,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 27 THEN i.install_id ELSE NULL END)) AS day_27,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 28 THEN i.install_id ELSE NULL END)) AS day_28,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 29 THEN i.install_id ELSE NULL END)) AS day_29,
    COUNT(DISTINCT(CASE WHEN DATEDIFF(e.date_occurred, i.date_occurred) = 30 THEN i.install_id ELSE NULL END)) AS day_30
FROM installs_primary i
    LEFT OUTER JOIN events_primary e
        ON i.install_id = e.install_id
WHERE DATE(i.date_occurred) between DATE(DATE_ADD(CURRENT_TIMESTAMP(), -30, 'day')) -- start of date range
    and DATE(DATE_ADD(CURRENT_TIMESTAMP(), -1, 'day')) -- end of date range
GROUP BY
    install_date_utc,
    network_name
ORDER BY install_date_utc ASC
