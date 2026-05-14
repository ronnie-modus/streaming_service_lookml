- dashboard: yoy_growth_tracker
  title: "YoY Growth Tracker"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Year-over-year and month-over-month growth in usage and revenue."

  elements:
  - title: "Engagement by Year"
    name: engagement_by_year
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_column
    fields: [vw_user_engagement_daily.activity_year, vw_user_engagement_daily.sum_watch_hours]
    sorts: [vw_user_engagement_daily.activity_year]
    row: 0
    col: 0
    width: 12
    height: 8

  - title: "DAUs by Year"
    name: dau_by_year
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_column
    fields: [vw_user_engagement_daily.activity_year, vw_user_engagement_daily.avg_daily_active_profiles]
    sorts: [vw_user_engagement_daily.activity_year]
    row: 0
    col: 12
    width: 12
    height: 8

  - title: "Revenue by Year"
    name: revenue_by_year
    model: analytics
    explore: vw_subscription_revenue
    type: looker_column
    fields: [vw_subscription_revenue.billing_year, vw_subscription_revenue.total_revenue_usd]
    sorts: [vw_subscription_revenue.billing_year]
    row: 8
    col: 0
    width: 12
    height: 8

  - title: "Revenue by Quarter"
    name: revenue_by_quarter
    model: analytics
    explore: vw_subscription_revenue
    type: looker_line
    fields: [vw_subscription_revenue.billing_quarter, vw_subscription_revenue.total_revenue_usd]
    sorts: [vw_subscription_revenue.billing_quarter]
    row: 8
    col: 12
    width: 12
    height: 8

  - title: "Sessions by Year"
    name: sessions_by_year
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_column
    fields: [vw_user_engagement_daily.activity_year, vw_user_engagement_daily.sum_sessions]
    sorts: [vw_user_engagement_daily.activity_year]
    row: 16
    col: 0
    width: 12
    height: 8

  - title: "Account Signups by Year"
    name: signups_by_year
    model: analytics
    explore: vw_account_lifecycle
    type: looker_column
    fields: [vw_account_lifecycle.signup_cohort_year, vw_account_lifecycle.count]
    sorts: [vw_account_lifecycle.signup_cohort_year]
    row: 16
    col: 12
    width: 12
    height: 8

  - title: "Avg Watch Minutes per Session — Trend"
    name: avg_min_trend
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_line
    fields: [vw_user_engagement_daily.activity_quarter, vw_user_engagement_daily.avg_avg_session_minutes]
    sorts: [vw_user_engagement_daily.activity_quarter]
    row: 24
    col: 0
    width: 12
    height: 8

  - title: "Plan Mix Trend (Quarterly)"
    name: plan_mix_q
    model: analytics
    explore: vw_subscription_revenue
    type: looker_area
    fields: [vw_subscription_revenue.billing_quarter, vw_subscription_revenue.plan_name, vw_subscription_revenue.sum_billed_accounts]
    pivots: [vw_subscription_revenue.plan_name]
    stacking: percent
    sorts: [vw_subscription_revenue.billing_quarter]
    row: 24
    col: 12
    width: 12
    height: 8
