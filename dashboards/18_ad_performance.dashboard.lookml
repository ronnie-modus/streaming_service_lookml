- dashboard: ad_performance
  title: "Ad Performance"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Detailed ad campaign performance: impressions, viewability, skip rate and revenue."

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
  - title: "Total Impressions"
    name: kpi_imp
    model: analytics
    explore: vw_ad_campaign_performance
    type: single_value
    fields: [vw_ad_campaign_performance.sum_impressions]
    listen:
      brand_filter: vw_ad_campaign_performance.brand
    row: 0
    col: 0
    width: 6
    height: 4

  - title: "Viewable Impressions"
    name: kpi_view_imp
    model: analytics
    explore: vw_ad_campaign_performance
    type: single_value
    fields: [vw_ad_campaign_performance.sum_viewable_impressions]
    listen:
      brand_filter: vw_ad_campaign_performance.brand
    row: 0
    col: 6
    width: 6
    height: 4

  - title: "Portfolio Skip Rate %"
    name: kpi_skip
    model: analytics
    explore: vw_ad_campaign_performance
    type: single_value
    fields: [vw_ad_campaign_performance.portfolio_skip_rate]
    listen:
      brand_filter: vw_ad_campaign_performance.brand
    row: 0
    col: 12
    width: 6
    height: 4

  - title: "Estimated Revenue (USD)"
    name: kpi_rev
    model: analytics
    explore: vw_ad_campaign_performance
    type: single_value
    fields: [vw_ad_campaign_performance.total_revenue_usd]
    listen:
      brand_filter: vw_ad_campaign_performance.brand
    row: 0
    col: 18
    width: 6
    height: 4

  - title: "Impressions by Brand"
    name: imp_by_brand
    model: analytics
    explore: vw_ad_campaign_performance
    type: looker_bar
    fields: [vw_ad_campaign_performance.brand, vw_ad_campaign_performance.sum_impressions]
    sorts: [vw_ad_campaign_performance.sum_impressions desc]
    listen:
      brand_filter: vw_ad_campaign_performance.brand
    row: 4
    col: 0
    width: 8
    height: 8

  - title: "Skip Rate by Brand"
    name: skip_by_brand
    model: analytics
    explore: vw_ad_campaign_performance
    type: looker_bar
    fields: [vw_ad_campaign_performance.brand, vw_ad_campaign_performance.avg_skip_rate]
    sorts: [vw_ad_campaign_performance.avg_skip_rate desc]
    listen:
      brand_filter: vw_ad_campaign_performance.brand
    row: 4
    col: 8
    width: 8
    height: 8

  - title: "Revenue by Brand"
    name: rev_by_brand
    model: analytics
    explore: vw_ad_campaign_performance
    type: looker_bar
    fields: [vw_ad_campaign_performance.brand, vw_ad_campaign_performance.total_revenue_usd]
    sorts: [vw_ad_campaign_performance.total_revenue_usd desc]
    listen:
      brand_filter: vw_ad_campaign_performance.brand
    row: 4
    col: 16
    width: 8
    height: 8

  - title: "Impressions vs Skip Rate (Scatter)"
    name: imp_vs_skip
    model: analytics
    explore: vw_ad_campaign_performance
    type: looker_scatter
    fields: [vw_ad_campaign_performance.brand, vw_ad_campaign_performance.total_impressions, vw_ad_campaign_performance.skip_rate_pct]
    limit: 500
    listen:
      brand_filter: vw_ad_campaign_performance.brand
    row: 12
    col: 0
    width: 12
    height: 8

  - title: "View Rate vs Revenue (Scatter)"
    name: view_vs_rev
    model: analytics
    explore: vw_ad_campaign_performance
    type: looker_scatter
    fields: [vw_ad_campaign_performance.brand, vw_ad_campaign_performance.view_rate_pct, vw_ad_campaign_performance.estimated_revenue_usd]
    limit: 500
    listen:
      brand_filter: vw_ad_campaign_performance.brand
    row: 12
    col: 12
    width: 12
    height: 8

  - title: "Top Campaigns - Revenue"
    name: top_camp_rev
    model: analytics
    explore: vw_ad_campaign_performance
    type: looker_grid
    fields: [vw_ad_campaign_performance.campaign_id, vw_ad_campaign_performance.brand, vw_ad_campaign_performance.total_impressions, vw_ad_campaign_performance.skip_rate_pct, vw_ad_campaign_performance.estimated_revenue_usd]
    sorts: [vw_ad_campaign_performance.estimated_revenue_usd desc]
    limit: 25
    listen:
      brand_filter: vw_ad_campaign_performance.brand
    row: 20
    col: 0
    width: 12
    height: 8

  - title: "Worst Skip Rate Campaigns"
    name: worst_skip
    model: analytics
    explore: vw_ad_campaign_performance
    type: looker_grid
    fields: [vw_ad_campaign_performance.campaign_id, vw_ad_campaign_performance.brand, vw_ad_campaign_performance.total_impressions, vw_ad_campaign_performance.skip_rate_pct, vw_ad_campaign_performance.estimated_revenue_usd]
    sorts: [vw_ad_campaign_performance.skip_rate_pct desc]
    limit: 25
    listen:
      brand_filter: vw_ad_campaign_performance.brand
    row: 20
    col: 12
    width: 12
    height: 8

  - title: "Full Campaign Detail"
    name: full_camp
    model: analytics
    explore: vw_ad_campaign_performance
    type: looker_grid
    fields: [vw_ad_campaign_performance.campaign_id, vw_ad_campaign_performance.brand, vw_ad_campaign_performance.cpm, vw_ad_campaign_performance.total_impressions, vw_ad_campaign_performance.viewable_impressions, vw_ad_campaign_performance.skipped_impressions, vw_ad_campaign_performance.skip_rate_pct, vw_ad_campaign_performance.view_rate_pct, vw_ad_campaign_performance.estimated_revenue_usd]
    sorts: [vw_ad_campaign_performance.total_impressions desc]
    listen:
      brand_filter: vw_ad_campaign_performance.brand
    row: 28
    col: 0
    width: 24
    height: 8
