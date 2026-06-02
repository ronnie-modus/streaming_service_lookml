- dashboard: watch_time_analysis
  title: "Watch Time Analysis"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Where watch time comes from: by day, device, day-of-week and individual title."

  filters:
  - name: date_range
    title: "Date Range"
    type: field_filter
    default_value: "180 days"
    allow_multiple_values: true
    required: false
    model: analytics
    explore: vw_user_engagement_daily
    field: vw_user_engagement_daily.activity_date

  - name: content_type
    title: "Content Type"
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    model: analytics
    explore: vw_content_performance
    field: vw_content_performance.type

  elements:
  - title: "Total Watch Hours"
    name: kpi_hours
    model: analytics
    explore: vw_user_engagement_daily
    type: single_value
    fields: [vw_user_engagement_daily.sum_watch_hours]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 0
    col: 0
    width: 6
    height: 4

  - title: "Avg Session Minutes"
    name: kpi_avg_min
    model: analytics
    explore: vw_user_engagement_daily
    type: single_value
    fields: [vw_user_engagement_daily.avg_avg_session_minutes]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 0
    col: 6
    width: 6
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
    col: 12
    width: 6
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
    col: 18
    width: 6
    height: 4

  - title: "Watch Hours by Day"
    name: hours_trend
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_area
    fields: [vw_user_engagement_daily.activity_date, vw_user_engagement_daily.total_watch_hours]
    sorts: [vw_user_engagement_daily.activity_date]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 4
    col: 0
    width: 24
    height: 8

  - title: "Watch Hours by Device"
    name: hours_by_device
    model: analytics
    explore: vw_device_usage
    type: looker_pie
    fields: [vw_device_usage.device_type, vw_device_usage.sum_watch_hours]
    sorts: [vw_device_usage.sum_watch_hours desc]
    listen:
      date_range: vw_device_usage.activity_date
    row: 12
    col: 0
    width: 8
    height: 8

  - title: "Watch Hours by Day of Week"
    name: hours_dow
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_column
    fields: [vw_user_engagement_daily.activity_day_of_week, vw_user_engagement_daily.sum_watch_hours]
    sorts: [vw_user_engagement_daily.activity_day_of_week]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 12
    col: 8
    width: 8
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
    col: 16
    width: 8
    height: 8

  - title: "Top Titles by Watch Hours"
    name: top_titles
    model: analytics
    explore: vw_content_performance
    type: looker_bar
    fields: [vw_content_performance.title_name, vw_content_performance.type, vw_content_performance.sum_watch_hours]
    sorts: [vw_content_performance.sum_watch_hours desc]
    limit: 25
    listen:
      content_type: vw_content_performance.type
    row: 20
    col: 0
    width: 12
    height: 8

  - title: "Watch Hours by Content Type"
    name: hours_by_type
    model: analytics
    explore: vw_content_performance
    type: looker_pie
    fields: [vw_content_performance.type, vw_content_performance.sum_watch_hours]
    sorts: [vw_content_performance.sum_watch_hours desc]
    listen:
      content_type: vw_content_performance.type
    row: 20
    col: 12
    width: 12
    height: 8

  - title: "Watch Time Detail"
    name: detail
    model: analytics
    explore: vw_content_performance
    type: looker_grid
    fields: [vw_content_performance.title_name, vw_content_performance.type, vw_content_performance.release_year, vw_content_performance.sum_views, vw_content_performance.sum_watch_hours, vw_content_performance.avg_approval_pct]
    sorts: [vw_content_performance.sum_watch_hours desc]
    limit: 200
    listen:
      content_type: vw_content_performance.type
    row: 28
    col: 0
    width: 24
    height: 8
