- dashboard: cohort_retention
  title: "Cohort Retention"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Signup-cohort retention, account size and engagement comparison across cohorts."

  filters:
  - name: cohort_range
    title: "Signup Cohort Month"
    type: field_filter
    default_value: "24 months"
    allow_multiple_values: true
    required: false
    model: analytics
    explore: vw_account_lifecycle
    field: vw_account_lifecycle.signup_cohort_month

  elements:
  - title: "Accounts in Cohort"
    name: kpi_accounts
    model: analytics
    explore: vw_account_lifecycle
    type: single_value
    fields: [vw_account_lifecycle.count]
    listen:
      cohort_range: vw_account_lifecycle.signup_cohort_month
    row: 0
    col: 0
    width: 6
    height: 4

  - title: "Active in Last 30d"
    name: kpi_active30
    model: analytics
    explore: vw_account_lifecycle
    type: single_value
    fields: [vw_account_lifecycle.count_active_30d]
    listen:
      cohort_range: vw_account_lifecycle.signup_cohort_month
    row: 0
    col: 6
    width: 6
    height: 4

  - title: "% Active 30d"
    name: kpi_pct_active
    model: analytics
    explore: vw_account_lifecycle
    type: single_value
    fields: [vw_account_lifecycle.pct_active_30d]
    listen:
      cohort_range: vw_account_lifecycle.signup_cohort_month
    row: 0
    col: 12
    width: 6
    height: 4

  - title: "Avg Watch Hours per Account"
    name: kpi_avg_hours
    model: analytics
    explore: vw_account_lifecycle
    type: single_value
    fields: [vw_account_lifecycle.avg_watch_hours_per_account]
    listen:
      cohort_range: vw_account_lifecycle.signup_cohort_month
    row: 0
    col: 18
    width: 6
    height: 4

  - title: "Cohort Size by Signup Month"
    name: cohort_size
    model: analytics
    explore: vw_account_lifecycle
    type: looker_column
    fields: [vw_account_lifecycle.signup_cohort_month, vw_account_lifecycle.count]
    sorts: [vw_account_lifecycle.signup_cohort_month]
    listen:
      cohort_range: vw_account_lifecycle.signup_cohort_month
    row: 4
    col: 0
    width: 12
    height: 8

  - title: "% Active 30d by Cohort"
    name: cohort_active
    model: analytics
    explore: vw_account_lifecycle
    type: looker_line
    fields: [vw_account_lifecycle.signup_cohort_month, vw_account_lifecycle.pct_active_30d]
    sorts: [vw_account_lifecycle.signup_cohort_month]
    listen:
      cohort_range: vw_account_lifecycle.signup_cohort_month
    row: 4
    col: 12
    width: 12
    height: 8

  - title: "Avg Watch Hours per Account by Cohort"
    name: cohort_hours
    model: analytics
    explore: vw_account_lifecycle
    type: looker_bar
    fields: [vw_account_lifecycle.signup_cohort_month, vw_account_lifecycle.avg_watch_hours_per_account]
    sorts: [vw_account_lifecycle.signup_cohort_month]
    listen:
      cohort_range: vw_account_lifecycle.signup_cohort_month
    row: 12
    col: 0
    width: 12
    height: 8

  - title: "Avg Days Active Since Signup by Cohort"
    name: cohort_days
    model: analytics
    explore: vw_account_lifecycle
    type: looker_column
    fields: [vw_account_lifecycle.signup_cohort_month, vw_account_lifecycle.days_active_since_signup]
    sorts: [vw_account_lifecycle.signup_cohort_month]
    listen:
      cohort_range: vw_account_lifecycle.signup_cohort_month
    row: 12
    col: 12
    width: 12
    height: 8

  - title: "Cohort Retention Heatmap"
    name: cohort_heatmap
    model: analytics
    explore: vw_account_lifecycle
    type: looker_grid
    fields: [vw_account_lifecycle.signup_cohort_month, vw_account_lifecycle.count, vw_account_lifecycle.count_active_30d, vw_account_lifecycle.pct_active_30d, vw_account_lifecycle.avg_watch_hours_per_account]
    sorts: [vw_account_lifecycle.signup_cohort_month desc]
    listen:
      cohort_range: vw_account_lifecycle.signup_cohort_month
    row: 20
    col: 0
    width: 24
    height: 10

  - title: "Profiles per Account by Cohort"
    name: cohort_profiles
    model: analytics
    explore: vw_account_lifecycle
    type: looker_line
    fields: [vw_account_lifecycle.signup_cohort_month, vw_account_lifecycle.sum_profiles, vw_account_lifecycle.count]
    sorts: [vw_account_lifecycle.signup_cohort_month]
    listen:
      cohort_range: vw_account_lifecycle.signup_cohort_month
    row: 30
    col: 0
    width: 12
    height: 8

  - title: "Total Watch Hours by Cohort"
    name: cohort_total_hours
    model: analytics
    explore: vw_account_lifecycle
    type: looker_area
    fields: [vw_account_lifecycle.signup_cohort_month, vw_account_lifecycle.sum_watch_hours]
    sorts: [vw_account_lifecycle.signup_cohort_month]
    listen:
      cohort_range: vw_account_lifecycle.signup_cohort_month
    row: 30
    col: 12
    width: 12
    height: 8
