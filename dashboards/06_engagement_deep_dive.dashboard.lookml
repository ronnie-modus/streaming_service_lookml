- dashboard: engagement_deep_dive
  title: "Engagement Deep Dive"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Detailed engagement: DAUs, sessions, watch time, by device and over time."

  filters:
  - name: date_range
    title: "Date Range"
    type: field_filter
    default_value: "90 days"
    allow_multiple_values: true
    required: false
    model: analytics
    explore: vw_user_engagement_daily
    field: vw_user_engagement_daily.activity_date

  - name: device_filter
    title: "Device Type"
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    model: analytics
    explore: vw_device_usage
    field: vw_device_usage.device_type

  elements:
  - title: "Total DAUs (avg)"
    name: dau_avg
    model: analytics
    explore: vw_user_engagement_daily
    type: single_value
    fields: [vw_user_engagement_daily.avg_daily_active_profiles]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 0
    col: 0
    width: 6
    height: 4

  - title: "Total Sessions"
    name: total_sessions_kpi
    model: analytics
    explore: vw_user_engagement_daily
    type: single_value
    fields: [vw_user_engagement_daily.sum_sessions]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 0
    col: 6
    width: 6
    height: 4

  - title: "Total Watch Hours"
    name: total_hours_kpi
    model: analytics
    explore: vw_user_engagement_daily
    type: single_value
    fields: [vw_user_engagement_daily.sum_watch_hours]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 0
    col: 12
    width: 6
    height: 4

  - title: "Avg Session Minutes"
    name: avg_min_kpi
    model: analytics
    explore: vw_user_engagement_daily
    type: single_value
    fields: [vw_user_engagement_daily.avg_avg_session_minutes]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 0
    col: 18
    width: 6
    height: 4

  - title: "Daily Active Profiles"
    name: dau_trend
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_line
    fields: [vw_user_engagement_daily.activity_date, vw_user_engagement_daily.daily_active_profiles]
    sorts: [vw_user_engagement_daily.activity_date]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 4
    col: 0
    width: 12
    height: 8

  - title: "Sessions per Day"
    name: sessions_trend
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_column
    fields: [vw_user_engagement_daily.activity_date, vw_user_engagement_daily.total_sessions]
    sorts: [vw_user_engagement_daily.activity_date]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 4
    col: 12
    width: 12
    height: 8

  - title: "Watch Hours per Day"
    name: hours_trend
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_area
    fields: [vw_user_engagement_daily.activity_date, vw_user_engagement_daily.total_watch_hours]
    sorts: [vw_user_engagement_daily.activity_date]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 12
    col: 0
    width: 12
    height: 8

  - title: "Avg Session Minutes Trend"
    name: min_trend
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_line
    fields: [vw_user_engagement_daily.activity_date, vw_user_engagement_daily.avg_session_minutes]
    sorts: [vw_user_engagement_daily.activity_date]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 12
    col: 12
    width: 12
    height: 8

  - title: "Sessions by Device"
    name: device_sessions
    model: analytics
    explore: vw_device_usage
    type: looker_bar
    fields: [vw_device_usage.device_type, vw_device_usage.sum_sessions]
    sorts: [vw_device_usage.sum_sessions desc]
    listen:
      date_range: vw_device_usage.activity_date
      device_filter: vw_device_usage.device_type
    row: 20
    col: 0
    width: 8
    height: 6

  - title: "Watch Hours by Device"
    name: device_hours
    model: analytics
    explore: vw_device_usage
    type: looker_pie
    fields: [vw_device_usage.device_type, vw_device_usage.sum_watch_hours]
    sorts: [vw_device_usage.sum_watch_hours desc]
    listen:
      date_range: vw_device_usage.activity_date
      device_filter: vw_device_usage.device_type
    row: 20
    col: 8
    width: 8
    height: 6

  - title: "Avg Session Minutes (Weighted) by Device"
    name: device_avg_min
    model: analytics
    explore: vw_device_usage
    type: looker_bar
    fields: [vw_device_usage.device_type, vw_device_usage.avg_session_minutes_weighted]
    sorts: [vw_device_usage.avg_session_minutes_weighted desc]
    listen:
      date_range: vw_device_usage.activity_date
      device_filter: vw_device_usage.device_type
    row: 20
    col: 16
    width: 8
    height: 6

  - title: "Device Mix Trend (Weekly)"
    name: device_trend
    model: analytics
    explore: vw_device_usage
    type: looker_area
    fields: [vw_device_usage.activity_week, vw_device_usage.device_type, vw_device_usage.sum_sessions]
    pivots: [vw_device_usage.device_type]
    stacking: percent
    sorts: [vw_device_usage.activity_week]
    listen:
      date_range: vw_device_usage.activity_date
      device_filter: vw_device_usage.device_type
    row: 26
    col: 0
    width: 12
    height: 8

  - title: "Engagement by Day of Week (Watch Hours)"
    name: dow_hours
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_column
    fields: [vw_user_engagement_daily.activity_day_of_week, vw_user_engagement_daily.sum_watch_hours]
    sorts: [vw_user_engagement_daily.activity_day_of_week]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 26
    col: 12
    width: 12
    height: 8

  - title: "Daily Engagement Detail Table"
    name: detail_table
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_grid
    fields: [vw_user_engagement_daily.activity_date, vw_user_engagement_daily.daily_active_profiles, vw_user_engagement_daily.total_sessions, vw_user_engagement_daily.total_watch_hours, vw_user_engagement_daily.avg_session_minutes]
    sorts: [vw_user_engagement_daily.activity_date desc]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 34
    col: 0
    width: 24
    height: 8
