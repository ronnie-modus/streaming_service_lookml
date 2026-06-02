- dashboard: brand_campaign_scorecard
  title: "Brand Campaign Scorecard"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Scorecard view per brand for advertising partner performance reviews."

  filters:
  - name: brand_filter
    title: "Brand"
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    model: analytics
    explore: vw_ad_campaign_performance
    field: vw_ad_campaign_performance.brand

  elements:
  - title: "Brands in Scope"
    name: kpi_brands
    model: analytics
    explore: vw_ad_campaign_performance
    type: single_value
    fields: [vw_ad_campaign_performance.count]
    listen:
      brand_filter: vw_ad_campaign_performance.brand
    row: 0
    col: 0
    width: 8
    height: 4

  - title: "Total Impressions"
    name: kpi_imp
    model: analytics
    explore: vw_ad_campaign_performance
    type: single_value
    fields: [vw_ad_campaign_performance.sum_impressions]
    listen:
      brand_filter: vw_ad_campaign_performance.brand
    row: 0
    col: 8
    width: 8
    height: 4

  - title: "Total Revenue (USD)"
    name: kpi_rev
    model: analytics
    explore: vw_ad_campaign_performance
    type: single_value
    fields: [vw_ad_campaign_performance.total_revenue_usd]
    listen:
      brand_filter: vw_ad_campaign_performance.brand
    row: 0
    col: 16
    width: 8
    height: 4

  - title: "Brand Revenue Ranking"
    name: brand_rev
    model: analytics
    explore: vw_ad_campaign_performance
    type: looker_bar
    fields: [vw_ad_campaign_performance.brand, vw_ad_campaign_performance.total_revenue_usd, vw_ad_campaign_performance.sum_impressions]
    sorts: [vw_ad_campaign_performance.total_revenue_usd desc]
    listen:
      brand_filter: vw_ad_campaign_performance.brand
    row: 4
    col: 0
    width: 12
    height: 10

  - title: "Brand Skip Rate Ranking"
    name: brand_skip
    model: analytics
    explore: vw_ad_campaign_performance
    type: looker_bar
    fields: [vw_ad_campaign_performance.brand, vw_ad_campaign_performance.portfolio_skip_rate]
    sorts: [vw_ad_campaign_performance.portfolio_skip_rate asc]
    listen:
      brand_filter: vw_ad_campaign_performance.brand
    row: 4
    col: 12
    width: 12
    height: 10

  - title: "Brand Scorecard"
    name: scorecard
    model: analytics
    explore: vw_ad_campaign_performance
    type: looker_grid
    fields: [vw_ad_campaign_performance.brand, vw_ad_campaign_performance.sum_impressions, vw_ad_campaign_performance.sum_viewable_impressions, vw_ad_campaign_performance.sum_skipped_impressions, vw_ad_campaign_performance.portfolio_skip_rate, vw_ad_campaign_performance.total_revenue_usd]
    sorts: [vw_ad_campaign_performance.total_revenue_usd desc]
    listen:
      brand_filter: vw_ad_campaign_performance.brand
    row: 14
    col: 0
    width: 24
    height: 10
