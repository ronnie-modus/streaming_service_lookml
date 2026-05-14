- dashboard: churn_risk_watchlist
  title: "Churn Risk Watchlist"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Identify accounts likely to churn based on inactivity, low engagement, and lifecycle stage."

  elements:
  - title: "Inactive Accounts (Not Active 30d)"
    name: kpi_inactive
    model: analytics
    explore: vw_account_lifecycle
    type: single_value
    filters:
      vw_account_lifecycle.is_active_30d: "no"
    fields: [vw_account_lifecycle.count]
    row: 0
    col: 0
    width: 8
    height: 4

  - title: "Active Accounts (30d)"
    name: kpi_active
    model: analytics
    explore: vw_account_lifecycle
    type: single_value
    fields: [vw_account_lifecycle.count_active_30d]
    row: 0
    col: 8
    width: 8
    height: 4

  - title: "Active Rate %"
    name: kpi_rate
    model: analytics
    explore: vw_account_lifecycle
    type: single_value
    fields: [vw_account_lifecycle.pct_active_30d]
    row: 0
    col: 16
    width: 8
    height: 4

  - title: "Inactive Accounts by Signup Cohort"
    name: inactive_cohort
    model: analytics
    explore: vw_account_lifecycle
    type: looker_column
    filters:
      vw_account_lifecycle.is_active_30d: "no"
    fields: [vw_account_lifecycle.signup_cohort_month, vw_account_lifecycle.count]
    sorts: [vw_account_lifecycle.signup_cohort_month]
    row: 4
    col: 0
    width: 12
    height: 8

  - title: "Active vs Inactive Mix by Cohort"
    name: active_mix
    model: analytics
    explore: vw_account_lifecycle
    type: looker_column
    fields: [vw_account_lifecycle.signup_cohort_month, vw_account_lifecycle.is_active_30d, vw_account_lifecycle.count]
    pivots: [vw_account_lifecycle.is_active_30d]
    sorts: [vw_account_lifecycle.signup_cohort_month]
    stacking: percent
    row: 4
    col: 12
    width: 12
    height: 8

  - title: "Top At-Risk Accounts (Inactive but Billed)"
    name: at_risk
    model: analytics
    explore: vw_account_lifecycle
    type: looker_grid
    filters:
      vw_account_lifecycle.is_active_30d: "no"
      vw_account_lifecycle.total_billings: ">0"
    fields: [vw_account_lifecycle.account_id, vw_account_lifecycle.created_date, vw_account_lifecycle.last_watch_date, vw_account_lifecycle.total_billings, vw_account_lifecycle.total_watch_hours, vw_account_lifecycle.profile_count]
    sorts: [vw_account_lifecycle.total_billings desc]
    limit: 100
    row: 12
    col: 0
    width: 24
    height: 10

  - title: "Long-Tenure Inactive Accounts"
    name: tenured_inactive
    model: analytics
    explore: vw_account_lifecycle
    type: looker_grid
    filters:
      vw_account_lifecycle.is_active_30d: "no"
      vw_account_lifecycle.days_active_since_signup: ">365"
    fields: [vw_account_lifecycle.account_id, vw_account_lifecycle.created_date, vw_account_lifecycle.last_watch_date, vw_account_lifecycle.days_active_since_signup, vw_account_lifecycle.total_watch_hours, vw_account_lifecycle.total_billings]
    sorts: [vw_account_lifecycle.days_active_since_signup desc]
    limit: 100
    row: 22
    col: 0
    width: 24
    height: 10
