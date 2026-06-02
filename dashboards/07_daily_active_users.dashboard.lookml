- dashboard: daily_active_users
  title: "Daily Active Users"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Focused view of daily active profiles, growth trends, and engagement intensity per active user."

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
  - title: "Avg Daily Active Profiles"
    name: kpi_avg_dau
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

  - title: "Total Sessions"
    name: kpi_total_sessions
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

  - title: "Total Watch Hours"
    name: kpi_total_hours
    model: analytics
    explore: vw_user_engagement_daily
    type: single_value
    fields: [vw_user_engagement_daily.sum_watch_hours]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 0
    col: 16
    width: 8
    height: 4

  - title: "Daily Active Profiles Trend"
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

  - title: "Weekly Active Profiles (Avg per Week)"
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

  - title: "Sessions per Active Profile (Trend)"
    name: sessions_per_profile
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_line
    fields: [vw_user_engagement_daily.activity_date, vw_user_engagement_daily.total_sessions, vw_user_engagement_daily.daily_active_profiles]
    sorts: [vw_user_engagement_daily.activity_date]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 12
    col: 12
    width: 12
    height: 8

  - title: "Daily Activity Detail"
    name: daily_grid
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_grid
    fields: [vw_user_engagement_daily.activity_date, vw_user_engagement_daily.daily_active_profiles, vw_user_engagement_daily.total_sessions, vw_user_engagement_daily.total_watch_hours, vw_user_engagement_daily.avg_session_minutes]
    sorts: [vw_user_engagement_daily.activity_date desc]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 20
    col: 0
    width: 24
    height: 8
