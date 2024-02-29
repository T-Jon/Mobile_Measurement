-- Influencer Report
-- Gives more granular attribution detail than the out-of-box Click/Impression MTA reports.
-- The query below combines the click and impression influencers and allows for additional columns to be included such as the tracker_name. 
-- This query can be run in any app and is easy to modify, making it very flexible.

SELECT
    inf.install_id AS install_id,
    CASE
        WHEN inf.click_id IS NOT NULL AND inf.click_id <> '' AND inf.waterfall_level <> 'iad' THEN 'click'
        WHEN inf.imp_id IS NOT NULL AND inf.imp_id <> '' THEN 'impression'
        WHEN inf.waterfall_level IN ('google', 'snapchat', 'facebook', 'iad', 'doubleclick', 'gemini', 'twitter') THEN 'san_claim'
        ELSE 'unknown'
    END AS influencer_type,
    inf.rejected AS rejected_because,
    CASE
      WHEN inf.waterfall_level = 'google' THEN 'google_claim'
      WHEN inf.waterfall_level = 'snapchat' THEN 'snapchat_claim'
      WHEN inf.waterfall_level = 'facebook' THEN 'facebook_claim'
      WHEN inf.waterfall_level = 'iad' THEN 'iad_claim'
      WHEN inf.waterfall_level = 'doubleclick' THEN 'doubleclick_claim'
      WHEN inf.waterfall_level = 'gemini' THEN 'gemini_claim'
      WHEN inf.waterfall_level = 'twitter' THEN 'twitter_claim'
      ELSE inf.waterfall_level
    END AS waterfall_level,
    STRFTIME_UTC_USEC(COALESCE(c.date_received, imp.date_received), '%Y-%m-%d %H:%M:%S') AS influencer_date_time,
    CASE
      WHEN inf.waterfall_level = 'google' THEN 'Google Adwords'
      WHEN inf.waterfall_level = 'snapchat' THEN 'Snapchat'
      WHEN inf.waterfall_level = 'facebook' THEN 'Facebook - Instagram'
      WHEN inf.waterfall_level = 'iad' THEN 'Apple Search Ads'
      WHEN inf.waterfall_level = 'doubleclick' THEN 'Doubleclick'
      WHEN inf.waterfall_level = 'gemini' THEN 'Verizon Media'
      WHEN inf.waterfall_level = 'twitter' THEN 'Twitter'
      ELSE COALESCE(c.network_name, imp.network_name)
    END AS influencer_network_name,
    COALESCE(c.campaign_name, imp.campaign_name) AS influencer_campaign_name,
    COALESCE(c.tracker_name, imp.tracker_name) AS influencer_tracker_name,
    COALESCE(c.site_id, imp.site_id) AS influencer_site_id,
    COALESCE(c.creative_id, imp.creative_id) AS influencer_creative_id,
    STRFTIME_UTC_USEC(i.date_occurred, '%Y-%m-%d %H:%M:%S') AS attribution_date_time,
    CASE
      WHEN i.matched_to_type IN ('click', 'san_click') THEN 'click'
      WHEN i.matched_to_type IN ('impression', 'san_impression') THEN 'impression'
      ELSE NULL
    END AS attribution_matched_to,
    i.waterfall_level AS attribution_matched_by,
    i.network_name AS attribution_network_name,
    i.campaign_name AS attribution_campaign_name,
    i.tracker_name AS attribution_tracker_name,
    i.site_id AS attribution_site_id,
    i.creative_id AS attribution_creative_id,
    i.kochava_device_id AS kochava_device_id,
    i.adid AS adid,
    i.android_id AS android_id,
    i.idfa AS idfa,
    i.idfv AS idfv,
    i.identifiers AS identifiers
FROM install_influencers inf
    INNER JOIN installs_primary i
        ON inf.install_id = i.install_id
    LEFT OUTER JOIN impressions_primary imp
        ON inf.imp_id = imp.impression_id
    LEFT OUTER JOIN clicks_primary c
        ON inf.click_id = c.click_id
WHERE DATE(i.date_occurred) BETWEEN DATE(DATE_ADD(CURRENT_TIMESTAMP(), -30, 'DAY')) AND DATE(DATE_ADD(CURRENT_TIMESTAMP(), -1, 'DAY')) -- adjust install date range here
    AND COALESCE(i.network_name, '') <> '' -- remove unattributed installs
    AND inf.rejected NOT IN ('ip_disabled') -- remove low-integrity influencer types
    AND inf.waterfall_level NOT IN ('partial_ip', 'ip', 'google', 'snapchat', 'facebook', 'iad', 'doubleclick', 'gemini', 'twitter') -- remove low-integrity influencer types and SANs
ORDER BY
    install_id DESC,
    influencer_date_time DESC;
