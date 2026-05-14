- dashboard: subscription_plan_mix
  title: "Subscription Plan Mix"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Plan-level adoption, billing volume, revenue contribution and trend."

  filters:
  - name: billing_range
    title: "Billing Month Range"
    type: field_filter
    default_value: "12 months"
    allow_multiple_values: true
    required: false
    model: analytics
    explore: vw_subscription_revenue
    field: vw_subscription_revenue.billing_month

  elements:
  - title: "Total Revenue (USD)"
    name: kpi_rev
    model: analytics
    explore: vw_subscription_revenue
    type: single_value
    fields: [vw_subscription_revenue.total_revenue_usd]
    listen:
      billing_range: vw_subscription_revenue.billing_month
    row: 0
    col: 0
    width: 6
    height: 4

  - title: "Billing Events"
    name: kpi_events
    model: analytics
    explore: vw_subscription_revenue
    type: single_value
    fields: [vw_subscription_revenue.sum_billing_events]
    listen:
      billing_range: vw_subscription_revenue.billing_month
    row: 0
    col: 6
    width: 6
    height: 4

  - title: "Billed Accounts (Sum)"
    name: kpi_accounts
    model: analytics
    explore: vw_subscription_revenue
    type: single_value
    fields: [vw_subscription_revenue.sum_billed_accounts]
    listen:
      billing_range: vw_subscription_revenue.billing_month
    row: 0
    col: 12
    width: 6
    height: 4

  - title: "Avg Revenue per Event"
    name: kpi_arpe
    model: analytics
    explore: vw_subscription_revenue
    type: single_value
    fields: [vw_subscription_revenue.avg_revenue_per_event]
    listen:
      billing_range: vw_subscription_revenue.billing_month
    row: 0
    col: 18
    width: 6
    height: 4

  - title: "Revenue by Plan"
    name: rev_plan
    model: analytics
    explore: vw_subscription_revenue
    type: looker_bar
    fields: [vw_subscription_revenue.plan_name, vw_subscription_revenue.total_revenue_usd]
    sorts: [vw_subscription_revenue.total_revenue_usd desc]
    listen:
      billing_range: vw_subscription_revenue.billing_month
    row: 4
    col: 0
    width: 8
    height: 8

  - title: "Billed Accounts by Plan"
    name: accts_plan
    model: analytics
    explore: vw_subscription_revenue
    type: looker_pie
    fields: [vw_subscription_revenue.plan_name, vw_subscription_revenue.sum_billed_accounts]
    sorts: [vw_subscription_revenue.sum_billed_accounts desc]
    listen:
      billing_range: vw_subscription_revenue.billing_month
    row: 4
    col: 8
    width: 8
    height: 8

  - title: "Plan Price (USD)"
    name: plan_price
    model: analytics
    explore: vw_subscription_revenue
    type: looker_grid
    fields: [vw_subscription_revenue.plan_name, vw_subscription_revenue.plan_price_usd]
    sorts: [vw_subscription_revenue.plan_price_usd desc]
    listen:
      billing_range: vw_subscription_revenue.billing_month
    row: 4
    col: 16
    width: 8
    height: 8

  - title: "Revenue Trend by Plan"
    name: rev_trend_plan
    model: analytics
    explore: vw_subscription_revenue
    type: looker_line
    fields: [vw_subscription_revenue.billing_month, vw_subscription_revenue.plan_name, vw_subscription_revenue.total_revenue_usd]
    pivots: [vw_subscription_revenue.plan_name]
    sorts: [vw_subscription_revenue.billing_month]
    listen:
      billing_range: vw_subscription_revenue.billing_month
    row: 12
    col: 0
    width: 12
    height: 8

  - title: "Plan Mix Over Time (% Share by Accounts)"
    name: plan_mix_pct
    model: analytics
    explore: vw_subscription_revenue
    type: looker_area
    fields: [vw_subscription_revenue.billing_month, vw_subscription_revenue.plan_name, vw_subscription_revenue.sum_billed_accounts]
    pivots: [vw_subscription_revenue.plan_name]
    sorts: [vw_subscription_revenue.billing_month]
    stacking: percent
    listen:
      billing_range: vw_subscription_revenue.billing_month
    row: 12
    col: 12
    width: 12
    height: 8

  - title: "Plan Performance Detail"
    name: plan_grid
    model: analytics
    explore: vw_subscription_revenue
    type: looker_grid
    fields: [vw_subscription_revenue.plan_name, vw_subscription_revenue.plan_price_usd, vw_subscription_revenue.sum_billing_events, vw_subscription_revenue.sum_billed_accounts, vw_subscription_revenue.total_revenue_usd, vw_subscription_revenue.avg_revenue_per_event]
    sorts: [vw_subscription_revenue.total_revenue_usd desc]
    listen:
      billing_range: vw_subscription_revenue.billing_month
    row: 20
    col: 0
    width: 24
    height: 8
