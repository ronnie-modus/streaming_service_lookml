- dashboard: acquisition_funnel
  title: "Acquisition Funnel"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Funnel from account signup to first watch, and on to first billing event."

  filters:
  - name: created_range
    title: "Signup Range"
    type: field_filter
    default_value: "12 months"
    allow_multiple_values: true
    required: false
    model: analytics
    explore: vw_account_lifecycle
    field: vw_account_lifecycle.created_date

  elements:
  - title: "Signups"
    name: kpi_signups
    model: analytics
    explore: vw_account_lifecycle
    type: single_value
    fields: [vw_account_lifecycle.count]
    listen:
      created_range: vw_account_lifecycle.created_date
    row: 0
    col: 0
    width: 8
    height: 4

  - title: "First Watch (Activated)"
    name: kpi_activated
    model: analytics
    explore: vw_account_lifecycle
    type: single_value
    filters:
      vw_account_lifecycle.first_watch_date: "NOT NULL"
    fields: [vw_account_lifecycle.count]
    listen:
      created_range: vw_account_lifecycle.created_date
    row: 0
    col: 8
    width: 8
    height: 4

  - title: "First Billing (Monetised)"
    name: kpi_monetised
    model: analytics
    explore: vw_account_lifecycle
    type: single_value
    filters:
      vw_account_lifecycle.first_billing_date: "NOT NULL"
    fields: [vw_account_lifecycle.count]
    listen:
      created_range: vw_account_lifecycle.created_date
    row: 0
    col: 16
    width: 8
    height: 4

  - title: "Signup -> Activation -> Monetisation by Cohort"
    name: funnel_cohort
    model: analytics
    explore: vw_account_lifecycle
    type: looker_column
    fields: [vw_account_lifecycle.signup_cohort_month, vw_account_lifecycle.count]
    sorts: [vw_account_lifecycle.signup_cohort_month]
    listen:
      created_range: vw_account_lifecycle.created_date
    row: 4
    col: 0
    width: 24
    height: 8

  - title: "Activation Rate by Cohort"
    name: activation_rate
    model: analytics
    explore: vw_account_lifecycle
    type: looker_line
    fields: [vw_account_lifecycle.signup_cohort_month, vw_account_lifecycle.pct_active_30d]
    sorts: [vw_account_lifecycle.signup_cohort_month]
    listen:
      created_range: vw_account_lifecycle.created_date
    row: 12
    col: 0
    width: 12
    height: 8

  - title: "Funnel Detail by Cohort"
    name: funnel_grid
    model: analytics
    explore: vw_account_lifecycle
    type: looker_grid
    fields: [vw_account_lifecycle.signup_cohort_month, vw_account_lifecycle.count, vw_account_lifecycle.count_active_30d, vw_account_lifecycle.pct_active_30d, vw_account_lifecycle.avg_watch_hours_per_account]
    sorts: [vw_account_lifecycle.signup_cohort_month desc]
    listen:
      created_range: vw_account_lifecycle.created_date
    row: 12
    col: 12
    width: 12
    height: 8
