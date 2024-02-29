-- Identifies quantity of events that are "orphaned" or are coming in w/o an associated _install event.
-- Large quantities of orphaned events may indicate an SDK miss-implementation or may be potential fraud.

select
	event_name,
    exact_count_distinct(event_id) as orphaned_events
from events_primary
where install_id = '0'
and date(date_received) > '2023-05-26'
-- and date(date_received) between '2023-02-01' and '2023-02-19'
group by event_name
order by orphaned_events desc
