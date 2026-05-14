- dashboard: device_and_platform_mix
  title: "Device & Platform Mix"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "How customers consume across devices: sessions, watch hours, session length, and trends over time."

  filters:
  - name: date_range
    title: "Date Range"
    type: field_filter
    default_value: "90 days"
    allow_multiple_values: true
    required: false
    model: analytics
    explore: vw_device_usage
    field: vw_device_usage.activity_date

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
  - title: "Total Sessions"
    name: kpi_sessions
    model: analytics
    explore: vw_device_usage
    type: single_value
    fields: [vw_device_usage.sum_sessions]
    listen:
      date_range: vw_device_usage.activity_date
      device_filter: vw_device_usage.device_type
    row: 0
    col: 0
    width: 6
    height: 4

  - title: "Total Watch Hours"
    name: kpi_hours
    model: analytics
    explore: vw_device_usage
    type: single_value
    fields: [vw_device_usage.sum_watch_hours]
    listen:
      date_range: vw_device_usage.activity_date
      device_filter: vw_device_usage.device_type
    row: 0
    col: 6
    width: 6
    height: 4

  - title: "Avg Session Minutes (Weighted)"
    name: kpi_avg_min
    model: analytics
    explore: vw_device_usage
    type: single_value
    fields: [vw_device_usage.avg_session_minutes_weighted]
    listen:
      date_range: vw_device_usage.activity_date
      device_filter: vw_device_usage.device_type
    row: 0
    col: 12
    width: 6
    height: 4

  - title: "Unique Profiles (Sum)"
    name: kpi_profiles
    model: analytics
    explore: vw_device_usage
    type: single_value
    fields: [vw_device_usage.sum_unique_profiles]
    listen:
      date_range: vw_device_usage.activity_date
      device_filter: vw_device_usage.device_type
    row: 0
    col: 18
    width: 6
    height: 4

  - title: "Sessions Share by Device"
    name: device_sessions_pie
    model: analytics
    explore: vw_device_usage
    type: looker_pie
    fields: [vw_device_usage.device_type, vw_device_usage.sum_sessions]
    sorts: [vw_device_usage.sum_sessions desc]
    listen:
      date_range: vw_device_usage.activity_date
      device_filter: vw_device_usage.device_type
    row: 4
    col: 0
    width: 8
    height: 8

  - title: "Watch Hours Share by Device"
    name: device_hours_pie
    model: analytics
    explore: vw_device_usage
    type: looker_pie
    fields: [vw_device_usage.device_type, vw_device_usage.sum_watch_hours]
    sorts: [vw_device_usage.sum_watch_hours desc]
    listen:
      date_range: vw_device_usage.activity_date
      device_filter: vw_device_usage.device_type
    row: 4
    col: 8
    width: 8
    height: 8

  - title: "Avg Session Minutes by Device"
    name: device_min_bar
    model: analytics
    explore: vw_device_usage
    type: looker_bar
    fields: [vw_device_usage.device_type, vw_device_usage.avg_session_minutes_weighted]
    sorts: [vw_device_usage.avg_session_minutes_weighted desc]
    listen:
      date_range: vw_device_usage.activity_date
      device_filter: vw_device_usage.device_type
    row: 4
    col: 16
    width: 8
    height: 8

  - title: "Device Mix Over Time (Weekly Sessions)"
    name: device_mix_trend
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
    row: 12
    col: 0
    width: 12
    height: 8

  - title: "Watch Hours Trend by Device"
    name: device_hours_trend
    model: analytics
    explore: vw_device_usage
    type: looker_line
    fields: [vw_device_usage.activity_week, vw_device_usage.device_type, vw_device_usage.sum_watch_hours]
    pivots: [vw_device_usage.device_type]
    sorts: [vw_device_usage.activity_week]
    listen:
      date_range: vw_device_usage.activity_date
      device_filter: vw_device_usage.device_type
    row: 12
    col: 12
    width: 12
    height: 8

  - title: "Device Performance Detail"
    name: device_grid
    model: analytics
    explore: vw_device_usage
    type: looker_grid
    fields: [vw_device_usage.device_type, vw_device_usage.sum_sessions, vw_device_usage.sum_unique_profiles, vw_device_usage.sum_watch_hours, vw_device_usage.avg_session_minutes_weighted]
    sorts: [vw_device_usage.sum_watch_hours desc]
    listen:
      date_range: vw_device_usage.activity_date
      device_filter: vw_device_usage.device_type
    row: 20
    col: 0
    width: 24
    height: 6
