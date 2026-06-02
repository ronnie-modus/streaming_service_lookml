- dashboard: monthly_board_report
  title: "Monthly Board Report"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Monthly executive metrics — revenue, growth, content, retention."

  filters:
  - name: date_range
    title: "Date Range"
    type: field_filter
    default_value: "12 months"
    allow_multiple_values: true
    required: false
    model: analytics
    explore: vw_user_engagement_daily
    field: vw_user_engagement_daily.activity_date

  elements:
  - title: "Total Revenue (USD)"
    name: m_revenue
    model: analytics
    explore: vw_subscription_revenue
    type: single_value
    fields: [vw_subscription_revenue.total_revenue_usd]
    row: 0
    col: 0
    width: 6
    height: 4

  - title: "ARPU (Avg per Billing)"
    name: m_arpu
    model: analytics
    explore: vw_subscription_revenue
    type: single_value
    fields: [vw_subscription_revenue.avg_revenue_per_event]
    row: 0
    col: 6
    width: 6
    height: 4

  - title: "Total Accounts"
    name: m_accounts
    model: analytics
    explore: vw_account_lifecycle
    type: single_value
    fields: [vw_account_lifecycle.count]
    row: 0
    col: 12
    width: 6
    height: 4

  - title: "Active Accounts (30d)"
    name: m_active_accounts
    model: analytics
    explore: vw_account_lifecycle
    type: single_value
    fields: [vw_account_lifecycle.count_active_30d]
    row: 0
    col: 18
    width: 6
    height: 4

  - title: "Monthly Revenue"
    name: monthly_revenue
    model: analytics
    explore: vw_subscription_revenue
    type: looker_column
    fields: [vw_subscription_revenue.billing_month, vw_subscription_revenue.total_revenue_usd]
    sorts: [vw_subscription_revenue.billing_month]
    row: 4
    col: 0
    width: 12
    height: 8

  - title: "Monthly DAUs"
    name: monthly_dau
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_line
    fields: [vw_user_engagement_daily.activity_month, vw_user_engagement_daily.avg_daily_active_profiles]
    sorts: [vw_user_engagement_daily.activity_month]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 4
    col: 12
    width: 12
    height: 8

  - title: "New Account Signups by Cohort Month"
    name: signup_cohorts
    model: analytics
    explore: vw_account_lifecycle
    type: looker_column
    fields: [vw_account_lifecycle.signup_cohort_month, vw_account_lifecycle.count]
    sorts: [vw_account_lifecycle.signup_cohort_month]
    row: 12
    col: 0
    width: 12
    height: 8

  - title: "Active Rate by Cohort"
    name: active_rate_cohort
    model: analytics
    explore: vw_account_lifecycle
    type: looker_line
    fields: [vw_account_lifecycle.signup_cohort_month, vw_account_lifecycle.pct_active_30d]
    sorts: [vw_account_lifecycle.signup_cohort_month]
    row: 12
    col: 12
    width: 12
    height: 8

  - title: "Catalog Composition (Movies vs Series)"
    name: catalog_composition
    model: analytics
    explore: vw_content_catalog_summary
    type: looker_pie
    fields: [vw_content_catalog_summary.type, vw_content_catalog_summary.sum_titles]
    sorts: [vw_content_catalog_summary.sum_titles desc]
    row: 20
    col: 0
    width: 8
    height: 6

  - title: "Catalog by Release Year"
    name: catalog_year
    model: analytics
    explore: vw_content_catalog_summary
    type: looker_column
    fields: [vw_content_catalog_summary.release_year, vw_content_catalog_summary.sum_titles]
    sorts: [vw_content_catalog_summary.release_year]
    row: 20
    col: 8
    width: 8
    height: 6

  - title: "Top 10 Brands by Ad Revenue"
    name: top_brands
    model: analytics
    explore: vw_ad_campaign_performance
    type: looker_bar
    fields: [vw_ad_campaign_performance.brand, vw_ad_campaign_performance.total_revenue_usd]
    sorts: [vw_ad_campaign_performance.total_revenue_usd desc]
    limit: 10
    row: 20
    col: 16
    width: 8
    height: 6

  - title: "Total Ad Impressions"
    name: total_impressions
    model: analytics
    explore: vw_ad_campaign_performance
    type: single_value
    fields: [vw_ad_campaign_performance.sum_impressions]
    row: 26
    col: 0
    width: 8
    height: 4

  - title: "Avg Ad Skip Rate %"
    name: avg_skip_rate
    model: analytics
    explore: vw_ad_campaign_performance
    type: single_value
    fields: [vw_ad_campaign_performance.avg_skip_rate_pct]
    row: 26
    col: 8
    width: 8
    height: 4
