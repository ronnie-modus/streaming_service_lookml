- dashboard: weekly_business_review
  title: "Weekly Business Review"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Cross-functional weekly snapshot covering engagement, revenue, content, and growth."

  filters:
  - name: date_range
    title: "Date Range"
    type: field_filter
    default_value: "12 weeks"
    allow_multiple_values: true
    required: false
    model: analytics
    explore: vw_user_engagement_daily
    field: vw_user_engagement_daily.activity_date

  elements:
  - title: "Weekly DAUs (avg per week)"
    name: weekly_dau
    model: analytics
    explore: vw_user_engagement_daily
    type: single_value
    fields: [vw_user_engagement_daily.avg_daily_active_profiles]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 0
    col: 0
    width: 6
    height: 4

  - title: "Watch Hours This Window"
    name: weekly_hours
    model: analytics
    explore: vw_user_engagement_daily
    type: single_value
    fields: [vw_user_engagement_daily.sum_watch_hours]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 0
    col: 6
    width: 6
    height: 4

  - title: "Subscription Revenue (USD)"
    name: weekly_revenue
    model: analytics
    explore: vw_subscription_revenue
    type: single_value
    fields: [vw_subscription_revenue.total_revenue_usd]
    row: 0
    col: 12
    width: 6
    height: 4

  - title: "Active Accounts (30d)"
    name: weekly_active_acc
    model: analytics
    explore: vw_account_lifecycle
    type: single_value
    fields: [vw_account_lifecycle.count_active_30d]
    row: 0
    col: 18
    width: 6
    height: 4

  - title: "DAUs by Week"
    name: dau_by_week
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_line
    fields: [vw_user_engagement_daily.activity_week, vw_user_engagement_daily.avg_daily_active_profiles]
    sorts: [vw_user_engagement_daily.activity_week]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 4
    col: 0
    width: 12
    height: 8

  - title: "Watch Hours by Week"
    name: hours_by_week
    model: analytics
    explore: vw_user_engagement_daily
    type: looker_column
    fields: [vw_user_engagement_daily.activity_week, vw_user_engagement_daily.sum_watch_hours]
    sorts: [vw_user_engagement_daily.activity_week]
    listen:
      date_range: vw_user_engagement_daily.activity_date
    row: 4
    col: 12
    width: 12
    height: 8

  - title: "Revenue by Plan over Time"
    name: revenue_by_plan_time
    model: analytics
    explore: vw_subscription_revenue
    type: looker_area
    fields: [vw_subscription_revenue.billing_month, vw_subscription_revenue.plan_name, vw_subscription_revenue.total_revenue_usd]
    pivots: [vw_subscription_revenue.plan_name]
    sorts: [vw_subscription_revenue.billing_month]
    stacking: normal
    row: 12
    col: 0
    width: 12
    height: 8

  - title: "Plan Mix (Billed Accounts)"
    name: plan_mix
    model: analytics
    explore: vw_subscription_revenue
    type: looker_pie
    fields: [vw_subscription_revenue.plan_name, vw_subscription_revenue.sum_billed_accounts]
    sorts: [vw_subscription_revenue.sum_billed_accounts desc]
    row: 12
    col: 12
    width: 12
    height: 8

  - title: "Top 10 Titles by Watch Hours"
    name: top_titles
    model: analytics
    explore: vw_content_performance
    type: looker_bar
    fields: [vw_content_performance.title_name, vw_content_performance.sum_watch_hours]
    sorts: [vw_content_performance.sum_watch_hours desc]
    limit: 10
    row: 20
    col: 0
    width: 12
    height: 8

  - title: "Sessions by Device (Weekly Trend)"
    name: sessions_device_weekly
    model: analytics
    explore: vw_device_usage
    type: looker_line
    fields: [vw_device_usage.activity_week, vw_device_usage.device_type, vw_device_usage.sum_sessions]
    pivots: [vw_device_usage.device_type]
    sorts: [vw_device_usage.activity_week]
    listen:
      date_range: vw_device_usage.activity_date
    row: 20
    col: 12
    width: 12
    height: 8

  - title: "Avg Approval %"
    name: avg_approval
    model: analytics
    explore: vw_content_performance
    type: single_value
    fields: [vw_content_performance.avg_approval_pct]
    row: 28
    col: 0
    width: 8
    height: 4

  - title: "Total Watchlist Entries"
    name: watchlist_entries
    model: analytics
    explore: vw_watchlist_conversion
    type: single_value
    fields: [vw_watchlist_conversion.count]
    row: 28
    col: 8
    width: 8
    height: 4

  - title: "Watchlist Conversion Rate %"
    name: watchlist_conv_rate
    model: analytics
    explore: vw_watchlist_conversion
    type: single_value
    fields: [vw_watchlist_conversion.conversion_rate_pct]
    row: 28
    col: 16
    width: 8
    height: 4

  - title: "Feature Usage (last window)"
    name: feature_usage_summary
    model: analytics
    explore: vw_feature_adoption
    type: looker_bar
    fields: [vw_feature_adoption.feature_name, vw_feature_adoption.sum_usage]
    sorts: [vw_feature_adoption.sum_usage desc]
    listen:
      date_range: vw_feature_adoption.activity_date
    row: 32
    col: 0
    width: 24
    height: 6
