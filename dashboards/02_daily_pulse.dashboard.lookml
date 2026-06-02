- dashboard: daily_pulse
  title: "Daily Pulse"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "What's happening on the platform today and over the last 7-30 days."

  filters:
  - name: date_range
    title: "Date Range"
    type: field_filter
    default_value: "30 days"
    allow_multiple_values: true
    required: false
    model: analytics
    explore: vw_user_engagement_daily
    field: vw_user_engagement_daily.activity_date

  elements:
  - title: "DAUs (most recent day)"
    name: dau_today
    model: analytics
    explore: vw_user_engagement_daily
    type: single_value
    fields: [vw_user_engagement_daily.daily_active_profiles, vw_user_engagement_daily.activity_date]
    sorts: [vw_user_engagement_daily.activity_date desc]
    limit: 1
    row: 0
    col: 0
    width: 6
    height: 4

  - title: "Sessions (most recent day)"
    name: sessions_today
    model: analytics
    explore: vw_user_engagement_daily
    type: single_value
    fields: [vw_user_engagement_daily.total_sessions, vw_user_engagement_daily.activity_date]
    sorts: [vw_user_engagement_daily.activity_date desc]
    limit: 1
    row: 0
    col: 6
    width: 6
    height: 4

  - title: "Watch Hours (most recent day)"
    name: hours_today
    model: analytics
    explore: vw_user_engagement_daily
    type: single_value
    fields: [vw_user_engagement_daily.total_watch_hours, vw_user_engagement_daily.activity_date]
    sorts: [vw_user_engagement_daily.activity_date desc]
    limit: 1
    row: 0
    col: 12
    width: 6
    height: 4

  - title: "Avg Session Minutes (most recent day)"
    name: avg_min_today
    model: analytics
    explore: vw_user_engagement_daily
    type: single_value
    fields: [vw_user_engagement_daily.avg_session_minutes, vw_user_engagement_daily.activity_date]
    sorts: [vw_user_engagement_daily.activity_date desc]
    limit: 1
    row: 0
    col: 18
    width: 6
    height: 4

  - title: "DAUs by Day"
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

  - title: "Sessions by Day"
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

  - title: "Sessions by Device (last 30d)"
    name: device_sessions
    model: analytics
    explore: vw_device_usage
    type: looker_bar
    fields: [vw_device_usage.device_type, vw_device_usage.sum_sessions]
    sorts: [vw_device_usage.sum_sessions desc]
    listen:
      date_range: vw_device_usage.activity_date
    row: 12
    col: 0
    width: 8
    height: 6

  - title: "Watch Hours by Device (last 30d)"
    name: device_hours
    model: analytics
    explore: vw_device_usage
    type: looker_pie
    fields: [vw_device_usage.device_type, vw_device_usage.sum_watch_hours]
    sorts: [vw_device_usage.sum_watch_hours desc]
    listen:
      date_range: vw_device_usage.activity_date
    row: 12
    col: 8
    width: 8
    height: 6

  - title: "Avg Session Minutes by Device"
    name: device_avg_min
    model: analytics
    explore: vw_device_usage
    type: looker_bar
    fields: [vw_device_usage.device_type, vw_device_usage.avg_session_minutes_weighted]
    sorts: [vw_device_usage.avg_session_minutes_weighted desc]
    listen:
      date_range: vw_device_usage.activity_date
    row: 12
    col: 16
    width: 8
    height: 6

  - title: "Daily Engagement Detail"
    name: daily_table
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_grid
    fields: [vw_user_engagement_daily.activity_date, vw_user_engagement_daily.daily_active_profiles, vw_user_engagement_daily.total_sessions, vw_user_engagement_daily.total_watch_hours, vw_user_engagement_daily.avg_session_minutes]
    sorts: [vw_user_engagement_daily.activity_date desc]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 18
    col: 0
    width: 24
    height: 8
