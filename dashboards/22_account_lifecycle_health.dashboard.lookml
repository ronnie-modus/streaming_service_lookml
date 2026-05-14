- dashboard: account_lifecycle_health
  title: "Account Lifecycle Health"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Health of the account base: signups, activity, billing, and engagement distribution."

  filters:
  - name: created_range
    title: "Account Created Range"
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    model: analytics
    explore: vw_account_lifecycle
    field: vw_account_lifecycle.created_date

  elements:
  - title: "Total Accounts"
    name: kpi_total
    model: analytics
    explore: vw_account_lifecycle
    type: single_value
    fields: [vw_account_lifecycle.count]
    listen:
      created_range: vw_account_lifecycle.created_date
    row: 0
    col: 0
    width: 6
    height: 4

  - title: "Active 30d"
    name: kpi_active
    model: analytics
    explore: vw_account_lifecycle
    type: single_value
    fields: [vw_account_lifecycle.count_active_30d]
    listen:
      created_range: vw_account_lifecycle.created_date
    row: 0
    col: 6
    width: 6
    height: 4

  - title: "% Active 30d"
    name: kpi_pct
    model: analytics
    explore: vw_account_lifecycle
    type: single_value
    fields: [vw_account_lifecycle.pct_active_30d]
    listen:
      created_range: vw_account_lifecycle.created_date
    row: 0
    col: 12
    width: 6
    height: 4

  - title: "Total Profiles"
    name: kpi_profiles
    model: analytics
    explore: vw_account_lifecycle
    type: single_value
    fields: [vw_account_lifecycle.sum_profiles]
    listen:
      created_range: vw_account_lifecycle.created_date
    row: 0
    col: 18
    width: 6
    height: 4

  - title: "Signups by Month"
    name: signups_trend
    model: analytics
    explore: vw_account_lifecycle
    type: looker_column
    fields: [vw_account_lifecycle.created_month, vw_account_lifecycle.count]
    sorts: [vw_account_lifecycle.created_month]
    listen:
      created_range: vw_account_lifecycle.created_date
    row: 4
    col: 0
    width: 12
    height: 8

  - title: "Active 30d Trend by Cohort"
    name: active_trend
    model: analytics
    explore: vw_account_lifecycle
    type: looker_line
    fields: [vw_account_lifecycle.signup_cohort_month, vw_account_lifecycle.count_active_30d]
    sorts: [vw_account_lifecycle.signup_cohort_month]
    listen:
      created_range: vw_account_lifecycle.created_date
    row: 4
    col: 12
    width: 12
    height: 8

  - title: "Profiles per Account Distribution"
    name: profile_dist
    model: analytics
    explore: vw_account_lifecycle
    type: looker_column
    fields: [vw_account_lifecycle.profile_count, vw_account_lifecycle.count]
    sorts: [vw_account_lifecycle.profile_count]
    listen:
      created_range: vw_account_lifecycle.created_date
    row: 12
    col: 0
    width: 8
    height: 8

  - title: "Active vs Inactive (30d)"
    name: active_pie
    model: analytics
    explore: vw_account_lifecycle
    type: looker_pie
    fields: [vw_account_lifecycle.is_active_30d, vw_account_lifecycle.count]
    listen:
      created_range: vw_account_lifecycle.created_date
    row: 12
    col: 8
    width: 8
    height: 8

  - title: "Total Watch Hours by Cohort"
    name: cohort_hours
    model: analytics
    explore: vw_account_lifecycle
    type: looker_area
    fields: [vw_account_lifecycle.signup_cohort_month, vw_account_lifecycle.sum_watch_hours]
    sorts: [vw_account_lifecycle.signup_cohort_month]
    listen:
      created_range: vw_account_lifecycle.created_date
    row: 12
    col: 16
    width: 8
    height: 8

  - title: "Avg Watch Hours per Account"
    name: avg_watch
    model: analytics
    explore: vw_account_lifecycle
    type: single_value
    fields: [vw_account_lifecycle.avg_watch_hours_per_account]
    listen:
      created_range: vw_account_lifecycle.created_date
    row: 20
    col: 0
    width: 6
    height: 4

  - title: "Total Sessions"
    name: total_sessions
    model: analytics
    explore: vw_account_lifecycle
    type: single_value
    fields: [vw_account_lifecycle.total_sessions]
    listen:
      created_range: vw_account_lifecycle.created_date
    row: 20
    col: 6
    width: 6
    height: 4

  - title: "Total Billings"
    name: total_billings
    model: analytics
    explore: vw_account_lifecycle
    type: single_value
    fields: [vw_account_lifecycle.total_billings]
    listen:
      created_range: vw_account_lifecycle.created_date
    row: 20
    col: 12
    width: 6
    height: 4

  - title: "Days Active Since Signup (Avg)"
    name: avg_days
    model: analytics
    explore: vw_account_lifecycle
    type: single_value
    fields: [vw_account_lifecycle.days_active_since_signup]
    listen:
      created_range: vw_account_lifecycle.created_date
    row: 20
    col: 18
    width: 6
    height: 4

  - title: "Account Lifecycle Detail"
    name: lifecycle_grid
    model: analytics
    explore: vw_account_lifecycle
    type: looker_grid
    fields: [vw_account_lifecycle.account_id, vw_account_lifecycle.created_date, vw_account_lifecycle.signup_cohort_month, vw_account_lifecycle.profile_count, vw_account_lifecycle.total_sessions, vw_account_lifecycle.total_watch_hours, vw_account_lifecycle.total_billings, vw_account_lifecycle.is_active_30d, vw_account_lifecycle.days_active_since_signup]
    sorts: [vw_account_lifecycle.total_watch_hours desc]
    limit: 200
    listen:
      created_range: vw_account_lifecycle.created_date
    row: 24
    col: 0
    width: 24
    height: 10
