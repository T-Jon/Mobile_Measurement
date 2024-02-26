-- Do your users fire off your KPI events withing the required timeline thresholds to be measured within SkadNetwork attribution?\
-- This query will tell you how much time passes between the "register" for SKAD attribution aka _install event and your KPI event (this query uses 'FirstTimeDeposit' as that event)

select
    e.event_value,
    e.network_name,
    exact_count_distinct(e.kochava_device_id) as deposit_count
from events_primary e
left join installs_primary i
on i.install_id = e.install_id
where e.event_name = 'FirstTimeDeposit'
and date(e.date_received) > '2021-06-25'
and date(i.date_occurred) = date(e.date_occurred)
group by e.event_value, e.network_name
order by deposit_count asc
