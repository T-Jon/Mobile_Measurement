-- Do your users fire off your KPI events withing the required timeline thresholds to be measured within SkadNetwork attribution?
-- This query will tell you how much time passes (avg) between the "register" for SKAD attribution aka _install event and your KPI event(s)

SELECT
  e.event_name AS event_name,
  AVG((TIMESTAMP_TO_SEC(e.date_occurred) - TIMESTAMP_TO_SEC(i.date_received))/3600) as avg_hour_diff
FROM events_primary e
JOIN installs_primary i
ON e.kochava_device_id = i.kochava_device_id
WHERE event_name IN
  (
    'QT_OAALeadSubmission_QM_LD',
    'QT_UserIDCreation_QM_EV',
    'QT_FirstDeposit_QM_EV'
  )
GROUP BY event_name
ORDER BY event_name asc
