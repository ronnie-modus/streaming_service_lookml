- dashboard: mrr_and_arpu
  title: "MRR & ARPU"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Monthly recurring revenue trend and average revenue per billing event by plan."

  filters:
  - name: billing_range
    title: "Billing Month Range"
    type: field_filter
    default_value: "24 months"
    allow_multiple_values: true
    required: false
    model: analytics
    explore: vw_subscription_revenue
    field: vw_subscription_revenue.billing_month

  elements:
  - title: "Latest MRR (USD, sum across selected range)"
    name: kpi_mrr
    model: analytics
    explore: vw_subscription_revenue
    type: single_value
    fields: [vw_subscription_revenue.total_revenue_usd]
    listen:
      billing_range: vw_subscription_revenue.billing_month
    row: 0
    col: 0
    width: 8
    height: 4

  - title: "Avg Revenue per Event"
    name: kpi_arpu
    model: analytics
    explore: vw_subscription_revenue
    type: single_value
    fields: [vw_subscription_revenue.avg_revenue_per_event]
    listen:
      billing_range: vw_subscription_revenue.billing_month
    row: 0
    col: 8
    width: 8
    height: 4

  - title: "Billed Accounts (Sum)"
    name: kpi_billed
    model: analytics
    explore: vw_subscription_revenue
    type: single_value
    fields: [vw_subscription_revenue.sum_billed_accounts]
    listen:
      billing_range: vw_subscription_revenue.billing_month
    row: 0
    col: 16
    width: 8
    height: 4

  - title: "MRR Trend"
    name: mrr_trend
    model: analytics
    explore: vw_subscription_revenue
    type: looker_line
    fields: [vw_subscription_revenue.billing_month, vw_subscription_revenue.total_revenue_usd]
    sorts: [vw_subscription_revenue.billing_month]
    listen:
      billing_range: vw_subscription_revenue.billing_month
    row: 4
    col: 0
    width: 12
    height: 8

  - title: "MRR by Plan"
    name: mrr_plan
    model: analytics
    explore: vw_subscription_revenue
    type: looker_column
    fields: [vw_subscription_revenue.billing_month, vw_subscription_revenue.plan_name, vw_subscription_revenue.total_revenue_usd]
    pivots: [vw_subscription_revenue.plan_name]
    sorts: [vw_subscription_revenue.billing_month]
    stacking: normal
    listen:
      billing_range: vw_subscription_revenue.billing_month
    row: 4
    col: 12
    width: 12
    height: 8

  - title: "ARPU by Plan"
    name: arpu_plan
    model: analytics
    explore: vw_subscription_revenue
    type: looker_bar
    fields: [vw_subscription_revenue.plan_name, vw_subscription_revenue.avg_revenue_per_event]
    sorts: [vw_subscription_revenue.avg_revenue_per_event desc]
    listen:
      billing_range: vw_subscription_revenue.billing_month
    row: 12
    col: 0
    width: 12
    height: 8

  - title: "MRR & ARPU Detail"
    name: mrr_grid
    model: analytics
    explore: vw_subscription_revenue
    type: looker_grid
    fields: [vw_subscription_revenue.billing_month, vw_subscription_revenue.plan_name, vw_subscription_revenue.billed_accounts, vw_subscription_revenue.estimated_revenue_usd, vw_subscription_revenue.avg_revenue_per_event]
    sorts: [vw_subscription_revenue.billing_month desc]
    listen:
      billing_range: vw_subscription_revenue.billing_month
    row: 12
    col: 12
    width: 12
    height: 8
