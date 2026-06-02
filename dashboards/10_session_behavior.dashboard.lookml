- dashboard: session_behavior
  title: "Session Behavior"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "How sessions behave: length, frequency, weekday vs weekend, and per-profile distribution."

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

  elements:
  - title: "Avg Session Minutes"
    name: kpi_avg_min
    model: analytics
    explore: vw_user_engagement_daily
    type: single_value
    fields: [vw_user_engagement_daily.avg_avg_session_minutes]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 0
    col: 0
    width: 8
    height: 4

  - title: "Total Sessions"
    name: kpi_sessions
    model: analytics
    explore: vw_user_engagement_daily
    type: single_value
    fields: [vw_user_engagement_daily.sum_sessions]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 0
    col: 8
    width: 8
    height: 4

  - title: "Avg Daily Active Profiles"
    name: kpi_dau
    model: analytics
    explore: vw_user_engagement_daily
    type: single_value
    fields: [vw_user_engagement_daily.avg_daily_active_profiles]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 0
    col: 16
    width: 8
    height: 4

  - title: "Sessions by Day of Week"
    name: dow_sessions
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_column
    fields: [vw_user_engagement_daily.activity_day_of_week, vw_user_engagement_daily.sum_sessions]
    sorts: [vw_user_engagement_daily.activity_day_of_week]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 4
    col: 0
    width: 12
    height: 8

  - title: "Avg Session Minutes by Day of Week"
    name: dow_min
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_bar
    fields: [vw_user_engagement_daily.activity_day_of_week, vw_user_engagement_daily.avg_avg_session_minutes]
    sorts: [vw_user_engagement_daily.activity_day_of_week]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 4
    col: 12
    width: 12
    height: 8

  - title: "Sessions Trend"
    name: sessions_trend
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_line
    fields: [vw_user_engagement_daily.activity_date, vw_user_engagement_daily.total_sessions]
    sorts: [vw_user_engagement_daily.activity_date]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 12
    col: 0
    width: 12
    height: 8

  - title: "Avg Session Minutes Trend"
    name: avg_min_trend
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

  - title: "Daily Session Detail"
    name: detail
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_grid
    fields: [vw_user_engagement_daily.activity_date, vw_user_engagement_daily.daily_active_profiles, vw_user_engagement_daily.total_sessions, vw_user_engagement_daily.avg_session_minutes]
    sorts: [vw_user_engagement_daily.activity_date desc]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 20
    col: 0
    width: 24
    height: 6
