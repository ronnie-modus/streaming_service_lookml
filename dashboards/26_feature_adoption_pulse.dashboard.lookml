- dashboard: feature_adoption_pulse
  title: "Feature Adoption Pulse"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Adoption and growth of in-product features: usage, day-over-day change, rolling 30d totals."

  filters:
  - name: date_range
    title: "Date Range"
    type: field_filter
    default_value: "90 days"
    allow_multiple_values: true
    required: false
    model: analytics
    explore: vw_feature_adoption
    field: vw_feature_adoption.activity_date

  - name: feature
    title: "Feature"
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    model: analytics
    explore: vw_feature_adoption
    field: vw_feature_adoption.feature_name

  elements:
  - title: "Total Feature Usage"
    name: kpi_usage
    model: analytics
    explore: vw_feature_adoption
    type: single_value
    fields: [vw_feature_adoption.sum_usage]
    listen:
      date_range: vw_feature_adoption.activity_date
      feature: vw_feature_adoption.feature_name
    row: 0
    col: 0
    width: 6
    height: 4

  - title: "Avg Daily Usage"
    name: kpi_avg
    model: analytics
    explore: vw_feature_adoption
    type: single_value
    fields: [vw_feature_adoption.avg_daily_usage]
    listen:
      date_range: vw_feature_adoption.activity_date
      feature: vw_feature_adoption.feature_name
    row: 0
    col: 6
    width: 6
    height: 4

  - title: "Avg DoD Change %"
    name: kpi_dod
    model: analytics
    explore: vw_feature_adoption
    type: single_value
    fields: [vw_feature_adoption.avg_dod_change_pct]
    listen:
      date_range: vw_feature_adoption.activity_date
      feature: vw_feature_adoption.feature_name
    row: 0
    col: 12
    width: 6
    height: 4

  - title: "Distinct Features Tracked"
    name: kpi_features
    model: analytics
    explore: vw_feature_adoption
    type: single_value
    fields: [vw_feature_adoption.count]
    listen:
      date_range: vw_feature_adoption.activity_date
      feature: vw_feature_adoption.feature_name
    row: 0
    col: 18
    width: 6
    height: 4

  - title: "Daily Feature Usage (by Feature)"
    name: usage_trend
    model: analytics
    explore: vw_feature_adoption
    type: looker_line
    fields: [vw_feature_adoption.activity_date, vw_feature_adoption.feature_name, vw_feature_adoption.usage_count]
    pivots: [vw_feature_adoption.feature_name]
    sorts: [vw_feature_adoption.activity_date]
    listen:
      date_range: vw_feature_adoption.activity_date
      feature: vw_feature_adoption.feature_name
    row: 4
    col: 0
    width: 24
    height: 8

  - title: "Total Usage by Feature"
    name: total_by_feature
    model: analytics
    explore: vw_feature_adoption
    type: looker_bar
    fields: [vw_feature_adoption.feature_name, vw_feature_adoption.sum_usage]
    sorts: [vw_feature_adoption.sum_usage desc]
    listen:
      date_range: vw_feature_adoption.activity_date
      feature: vw_feature_adoption.feature_name
    row: 12
    col: 0
    width: 12
    height: 8

  - title: "Avg DoD Change by Feature"
    name: dod_by_feature
    model: analytics
    explore: vw_feature_adoption
    type: looker_column
    fields: [vw_feature_adoption.feature_name, vw_feature_adoption.avg_dod_change_pct]
    sorts: [vw_feature_adoption.avg_dod_change_pct desc]
    listen:
      date_range: vw_feature_adoption.activity_date
      feature: vw_feature_adoption.feature_name
    row: 12
    col: 12
    width: 12
    height: 8

  - title: "Rolling 30d Usage Trend"
    name: rolling_usage
    model: analytics
    explore: vw_feature_adoption
    type: looker_area
    fields: [vw_feature_adoption.activity_date, vw_feature_adoption.feature_name, vw_feature_adoption.rolling_30d_usage]
    pivots: [vw_feature_adoption.feature_name]
    sorts: [vw_feature_adoption.activity_date]
    listen:
      date_range: vw_feature_adoption.activity_date
      feature: vw_feature_adoption.feature_name
    row: 20
    col: 0
    width: 16
    height: 8

  - title: "Feature Mix Share (Watch Period)"
    name: feature_mix
    model: analytics
    explore: vw_feature_adoption
    type: looker_pie
    fields: [vw_feature_adoption.feature_name, vw_feature_adoption.sum_usage]
    sorts: [vw_feature_adoption.sum_usage desc]
    listen:
      date_range: vw_feature_adoption.activity_date
      feature: vw_feature_adoption.feature_name
    row: 20
    col: 16
    width: 8
    height: 8

  - title: "Weekly Feature Usage"
    name: weekly_usage
    model: analytics
    explore: vw_feature_adoption
    type: looker_column
    fields: [vw_feature_adoption.activity_week, vw_feature_adoption.sum_usage]
    sorts: [vw_feature_adoption.activity_week]
    listen:
      date_range: vw_feature_adoption.activity_date
      feature: vw_feature_adoption.feature_name
    row: 28
    col: 0
    width: 12
    height: 8

  - title: "Monthly Feature Usage"
    name: monthly_usage
    model: analytics
    explore: vw_feature_adoption
    type: looker_column
    fields: [vw_feature_adoption.activity_month, vw_feature_adoption.sum_usage]
    sorts: [vw_feature_adoption.activity_month]
    listen:
      date_range: vw_feature_adoption.activity_date
      feature: vw_feature_adoption.feature_name
    row: 28
    col: 12
    width: 12
    height: 8

  - title: "Feature Usage Detail"
    name: feature_grid
    model: analytics
    explore: vw_feature_adoption
    type: looker_grid
    fields: [vw_feature_adoption.activity_date, vw_feature_adoption.feature_name, vw_feature_adoption.usage_count, vw_feature_adoption.prev_day_usage, vw_feature_adoption.dod_change_pct, vw_feature_adoption.rolling_30d_usage]
    sorts: [vw_feature_adoption.activity_date desc, vw_feature_adoption.feature_name]
    limit: 500
    listen:
      date_range: vw_feature_adoption.activity_date
      feature: vw_feature_adoption.feature_name
    row: 36
    col: 0
    width: 24
    height: 10
