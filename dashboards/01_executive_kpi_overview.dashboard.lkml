- dashboard: executive_kpi_overview
  title: "Executive KPI Overview"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "High-level health of the business — engagement, revenue, content, growth — in one view."

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
  - title: "Daily Active Profiles (Avg)"
    name: kpi_dau_avg
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

  - title: "Total Watch Hours"
    name: kpi_total_watch_hours
    model: analytics
    explore: vw_user_engagement_daily
    type: single_value
    fields: [vw_user_engagement_daily.sum_watch_hours]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 0
    col: 6
    width: 6
    height: 4

  - title: "Total Sessions"
    name: kpi_total_sessions
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

  - title: "Avg Session Minutes"
    name: kpi_avg_session_min
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

  - title: "Total Subscription Revenue (USD)"
    name: kpi_revenue
    model: analytics
    explore: vw_subscription_revenue
    type: single_value
    fields: [vw_subscription_revenue.total_revenue_usd]
    row: 4
    col: 0
    width: 6
    height: 4

  - title: "Billed Accounts (Sum)"
    name: kpi_billed_accounts
    model: analytics
    explore: vw_subscription_revenue
    type: single_value
    fields: [vw_subscription_revenue.sum_billed_accounts]
    row: 4
    col: 6
    width: 6
    height: 4

  - title: "Total Catalog Titles"
    name: kpi_catalog_titles
    model: analytics
    explore: vw_content_catalog_summary
    type: single_value
    fields: [vw_content_catalog_summary.sum_titles]
    row: 4
    col: 12
    width: 6
    height: 4

  - title: "Total Content Views"
    name: kpi_total_views
    model: analytics
    explore: vw_content_catalog_summary
    type: single_value
    fields: [vw_content_catalog_summary.sum_views]
    row: 4
    col: 18
    width: 6
    height: 4

  - title: "Daily Active Profiles Trend"
    name: trend_dau
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_line
    fields: [vw_user_engagement_daily.activity_date, vw_user_engagement_daily.daily_active_profiles]
    sorts: [vw_user_engagement_daily.activity_date desc]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 8
    col: 0
    width: 12
    height: 8

  - title: "Watch Hours by Day"
    name: trend_watch_hours
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_area
    fields: [vw_user_engagement_daily.activity_date, vw_user_engagement_daily.total_watch_hours]
    sorts: [vw_user_engagement_daily.activity_date desc]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 8
    col: 12
    width: 12
    height: 8

  - title: "Revenue by Plan (Monthly)"
    name: revenue_by_plan
    model: analytics
    explore: vw_subscription_revenue
    type: looker_column
    fields: [vw_subscription_revenue.billing_month, vw_subscription_revenue.plan_name, vw_subscription_revenue.total_revenue_usd]
    pivots: [vw_subscription_revenue.plan_name]
    sorts: [vw_subscription_revenue.billing_month]
    stacking: normal
    row: 16
    col: 0
    width: 12
    height: 8

  - title: "Watch Hours by Device Type"
    name: device_share
    model: analytics
    explore: vw_device_usage
    type: looker_pie
    fields: [vw_device_usage.device_type, vw_device_usage.sum_watch_hours]
    sorts: [vw_device_usage.sum_watch_hours desc]
    listen:
      date_range: vw_device_usage.activity_date
    row: 16
    col: 12
    width: 12
    height: 8
