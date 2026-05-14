- dashboard: active_user_trends
  title: "Active User Trends"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "DAU / WAU / MAU style trends and cohort active mix."

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

  elements:
  - title: "Avg DAU"
    name: kpi_dau
    model: analytics
    explore: vw_user_engagement_daily
    type: single_value
    fields: [vw_user_engagement_daily.avg_daily_active_profiles]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 0
    col: 0
    width: 8
    height: 4

  - title: "Avg WAU (per week aggregate)"
    name: kpi_wau
    model: analytics
    explore: vw_user_engagement_daily
    type: single_value
    fields: [vw_user_engagement_daily.avg_daily_active_profiles]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    note_state: collapsed
    note_display: above
    note_text: "Approximation: avg daily active profiles within the selected window."
    row: 0
    col: 8
    width: 8
    height: 4

  - title: "Active Account Base (last 30d)"
    name: kpi_active30
    model: analytics
    explore: vw_account_lifecycle
    type: single_value
    fields: [vw_account_lifecycle.count_active_30d]
    row: 0
    col: 16
    width: 8
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
    width: 24
    height: 8

  - title: "Weekly Active Trend"
    name: wau_trend
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_column
    fields: [vw_user_engagement_daily.activity_week, vw_user_engagement_daily.avg_daily_active_profiles]
    sorts: [vw_user_engagement_daily.activity_week]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 12
    col: 0
    width: 12
    height: 8

  - title: "Monthly Active Trend"
    name: mau_trend
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_area
    fields: [vw_user_engagement_daily.activity_month, vw_user_engagement_daily.avg_daily_active_profiles]
    sorts: [vw_user_engagement_daily.activity_month]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 12
    col: 12
    width: 12
    height: 8

  - title: "Active 30d % by Cohort"
    name: active_pct_cohort
    model: analytics
    explore: vw_account_lifecycle
    type: looker_line
    fields: [vw_account_lifecycle.signup_cohort_month, vw_account_lifecycle.pct_active_30d]
    sorts: [vw_account_lifecycle.signup_cohort_month]
    row: 20
    col: 0
    width: 24
    height: 8
