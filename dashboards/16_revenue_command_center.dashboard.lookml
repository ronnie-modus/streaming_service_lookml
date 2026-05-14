- dashboard: revenue_command_center
  title: "Revenue Command Center"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Combined view of subscription and advertising revenue, monthly trends, and contribution by source."

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

  - name: plan_filter
    title: "Plan"
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    model: analytics
    explore: vw_subscription_revenue
    field: vw_subscription_revenue.plan_name

  elements:
  - title: "Subscription Revenue (USD)"
    name: kpi_sub_rev
    model: analytics
    explore: vw_subscription_revenue
    type: single_value
    fields: [vw_subscription_revenue.total_revenue_usd]
    listen:
      billing_range: vw_subscription_revenue.billing_month
      plan_filter: vw_subscription_revenue.plan_name
    row: 0
    col: 0
    width: 6
    height: 4

  - title: "Billed Accounts (Sum)"
    name: kpi_billed
    model: analytics
    explore: vw_subscription_revenue
    type: single_value
    fields: [vw_subscription_revenue.sum_billed_accounts]
    listen:
      billing_range: vw_subscription_revenue.billing_month
      plan_filter: vw_subscription_revenue.plan_name
    row: 0
    col: 6
    width: 6
    height: 4

  - title: "Avg Revenue / Billing Event"
    name: kpi_arpu
    model: analytics
    explore: vw_subscription_revenue
    type: single_value
    fields: [vw_subscription_revenue.avg_revenue_per_event]
    listen:
      billing_range: vw_subscription_revenue.billing_month
      plan_filter: vw_subscription_revenue.plan_name
    row: 0
    col: 12
    width: 6
    height: 4

  - title: "Ad Revenue (USD)"
    name: kpi_ad_rev
    model: analytics
    explore: vw_ad_campaign_performance
    type: single_value
    fields: [vw_ad_campaign_performance.total_revenue_usd]
    row: 0
    col: 18
    width: 6
    height: 4

  - title: "Subscription Revenue by Month"
    name: sub_rev_trend
    model: analytics
    explore: vw_subscription_revenue
    type: looker_area
    fields: [vw_subscription_revenue.billing_month, vw_subscription_revenue.total_revenue_usd]
    sorts: [vw_subscription_revenue.billing_month]
    listen:
      billing_range: vw_subscription_revenue.billing_month
      plan_filter: vw_subscription_revenue.plan_name
    row: 4
    col: 0
    width: 12
    height: 8

  - title: "Revenue by Plan (Stacked Monthly)"
    name: rev_by_plan
    model: analytics
    explore: vw_subscription_revenue
    type: looker_column
    fields: [vw_subscription_revenue.billing_month, vw_subscription_revenue.plan_name, vw_subscription_revenue.total_revenue_usd]
    pivots: [vw_subscription_revenue.plan_name]
    sorts: [vw_subscription_revenue.billing_month]
    stacking: normal
    listen:
      billing_range: vw_subscription_revenue.billing_month
      plan_filter: vw_subscription_revenue.plan_name
    row: 4
    col: 12
    width: 12
    height: 8

  - title: "Plan Mix by Billed Accounts"
    name: plan_mix
    model: analytics
    explore: vw_subscription_revenue
    type: looker_pie
    fields: [vw_subscription_revenue.plan_name, vw_subscription_revenue.sum_billed_accounts]
    sorts: [vw_subscription_revenue.sum_billed_accounts desc]
    listen:
      billing_range: vw_subscription_revenue.billing_month
      plan_filter: vw_subscription_revenue.plan_name
    row: 12
    col: 0
    width: 8
    height: 8

  - title: "Revenue Mix by Plan"
    name: rev_mix
    model: analytics
    explore: vw_subscription_revenue
    type: looker_pie
    fields: [vw_subscription_revenue.plan_name, vw_subscription_revenue.total_revenue_usd]
    sorts: [vw_subscription_revenue.total_revenue_usd desc]
    listen:
      billing_range: vw_subscription_revenue.billing_month
      plan_filter: vw_subscription_revenue.plan_name
    row: 12
    col: 8
    width: 8
    height: 8

  - title: "Avg Revenue per Event by Plan"
    name: arpu_plan
    model: analytics
    explore: vw_subscription_revenue
    type: looker_bar
    fields: [vw_subscription_revenue.plan_name, vw_subscription_revenue.avg_revenue_per_event]
    sorts: [vw_subscription_revenue.avg_revenue_per_event desc]
    listen:
      billing_range: vw_subscription_revenue.billing_month
      plan_filter: vw_subscription_revenue.plan_name
    row: 12
    col: 16
    width: 8
    height: 8

  - title: "Top Ad Campaigns by Revenue"
    name: top_ad_rev
    model: analytics
    explore: vw_ad_campaign_performance
    type: looker_bar
    fields: [vw_ad_campaign_performance.brand, vw_ad_campaign_performance.total_revenue_usd]
    sorts: [vw_ad_campaign_performance.total_revenue_usd desc]
    limit: 25
    row: 20
    col: 0
    width: 12
    height: 8

  - title: "Ad Skip Rate vs Revenue"
    name: skip_vs_rev
    model: analytics
    explore: vw_ad_campaign_performance
    type: looker_scatter
    fields: [vw_ad_campaign_performance.brand, vw_ad_campaign_performance.skip_rate_pct, vw_ad_campaign_performance.estimated_revenue_usd]
    limit: 500
    row: 20
    col: 12
    width: 12
    height: 8

  - title: "Subscription Revenue Detail"
    name: sub_grid
    model: analytics
    explore: vw_subscription_revenue
    type: looker_grid
    fields: [vw_subscription_revenue.billing_month, vw_subscription_revenue.plan_name, vw_subscription_revenue.billing_events, vw_subscription_revenue.billed_accounts, vw_subscription_revenue.estimated_revenue_usd]
    sorts: [vw_subscription_revenue.billing_month desc, vw_subscription_revenue.plan_name]
    listen:
      billing_range: vw_subscription_revenue.billing_month
      plan_filter: vw_subscription_revenue.plan_name
    row: 28
    col: 0
    width: 12
    height: 8

  - title: "Ad Campaign Detail"
    name: ad_grid
    model: analytics
    explore: vw_ad_campaign_performance
    type: looker_grid
    fields: [vw_ad_campaign_performance.campaign_id, vw_ad_campaign_performance.brand, vw_ad_campaign_performance.total_impressions, vw_ad_campaign_performance.skip_rate_pct, vw_ad_campaign_performance.estimated_revenue_usd]
    sorts: [vw_ad_campaign_performance.estimated_revenue_usd desc]
    row: 28
    col: 12
    width: 12
    height: 8

  - title: "Total Combined Revenue (USD)"
    name: combined_rev
    model: analytics
    explore: vw_subscription_revenue
    type: single_value
    fields: [vw_subscription_revenue.total_revenue_usd]
    listen:
      billing_range: vw_subscription_revenue.billing_month
      plan_filter: vw_subscription_revenue.plan_name
    row: 36
    col: 0
    width: 24
    height: 4
    note_state: collapsed
    note_display: above
    note_text: "Sum the Subscription Revenue and Ad Revenue KPIs above for a full combined revenue figure."
