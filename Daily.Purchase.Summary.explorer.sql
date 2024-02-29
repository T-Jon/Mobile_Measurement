-- Daily Purchase Summary Report
-- Reflects Session Begin events and Purchase events including any revenue metadata. 
-- Groups into attributed network.

select
case when network_name is null then 'Summary' else network_name end as network_name,
revenue,
sessions,
purchase
from
  (select
  network_name,
  case when network_name is null then 1 else 0 end as sort,
  revenue,
  sessions,
  purchase
  from
    (select
    case when network_name is null then 'Unattributed' else network_name end as network_name,
    round(sum(case when event_name = 'Purchase' then event_value else null end), 2) as revenue,
    exact_count_distinct(case when event_name = '_SessionBegin' then event_id else null end) as sessions,
    exact_count_distinct(case when event_name = 'Purchase' then event_id else null end) as purchase
    from events_primary
    where date(date_add(date_occurred, -8, 'hour')) =
      date(date_add((date_add(current_timestamp(), -1, 'day')), -8, 'hour'))
    group by rollup(network_name)
    order by revenue desc)
    order by sort asc)
