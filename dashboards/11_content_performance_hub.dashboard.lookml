- dashboard: content_performance_hub
  title: "Content Performance Hub"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Comprehensive title-level performance: views, viewers, watch hours, ratings and approval %."

  filters:
  - name: content_type
    title: "Content Type"
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    model: analytics
    explore: vw_content_performance
    field: vw_content_performance.type

  - name: release_year
    title: "Release Year"
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    model: analytics
    explore: vw_content_performance
    field: vw_content_performance.release_year

  elements:
  - title: "Total Views"
    name: kpi_views
    model: analytics
    explore: vw_content_performance
    type: single_value
    fields: [vw_content_performance.sum_views]
    listen:
      content_type: vw_content_performance.type
      release_year: vw_content_performance.release_year
    row: 0
    col: 0
    width: 6
    height: 4

  - title: "Total Watch Hours"
    name: kpi_hours
    model: analytics
    explore: vw_content_performance
    type: single_value
    fields: [vw_content_performance.sum_watch_hours]
    listen:
      content_type: vw_content_performance.type
      release_year: vw_content_performance.release_year
    row: 0
    col: 6
    width: 6
    height: 4

  - title: "Avg Approval %"
    name: kpi_approval
    model: analytics
    explore: vw_content_performance
    type: single_value
    fields: [vw_content_performance.avg_approval_pct]
    listen:
      content_type: vw_content_performance.type
      release_year: vw_content_performance.release_year
    row: 0
    col: 12
    width: 6
    height: 4

  - title: "Titles in Scope"
    name: kpi_titles
    model: analytics
    explore: vw_content_performance
    type: single_value
    fields: [vw_content_performance.count]
    listen:
      content_type: vw_content_performance.type
      release_year: vw_content_performance.release_year
    row: 0
    col: 18
    width: 6
    height: 4

  - title: "Top 20 Titles by Views"
    name: top_views
    model: analytics
    explore: vw_content_performance
    type: looker_bar
    fields: [vw_content_performance.title_name, vw_content_performance.total_views]
    sorts: [vw_content_performance.total_views desc]
    limit: 20
    listen:
      content_type: vw_content_performance.type
      release_year: vw_content_performance.release_year
    row: 4
    col: 0
    width: 12
    height: 10

  - title: "Top 20 Titles by Watch Hours"
    name: top_hours
    model: analytics
    explore: vw_content_performance
    type: looker_bar
    fields: [vw_content_performance.title_name, vw_content_performance.total_watch_hours]
    sorts: [vw_content_performance.total_watch_hours desc]
    limit: 20
    listen:
      content_type: vw_content_performance.type
      release_year: vw_content_performance.release_year
    row: 4
    col: 12
    width: 12
    height: 10

  - title: "Views by Content Type"
    name: views_type_pie
    model: analytics
    explore: vw_content_performance
    type: looker_pie
    fields: [vw_content_performance.type, vw_content_performance.sum_views]
    sorts: [vw_content_performance.sum_views desc]
    listen:
      content_type: vw_content_performance.type
      release_year: vw_content_performance.release_year
    row: 14
    col: 0
    width: 8
    height: 8

  - title: "Watch Hours by Release Year"
    name: hours_by_year
    model: analytics
    explore: vw_content_performance
    type: looker_column
    fields: [vw_content_performance.release_year, vw_content_performance.sum_watch_hours]
    sorts: [vw_content_performance.release_year]
    listen:
      content_type: vw_content_performance.type
      release_year: vw_content_performance.release_year
    row: 14
    col: 8
    width: 8
    height: 8

  - title: "Avg Approval % by Release Year"
    name: approval_by_year
    model: analytics
    explore: vw_content_performance
    type: looker_line
    fields: [vw_content_performance.release_year, vw_content_performance.avg_approval_pct]
    sorts: [vw_content_performance.release_year]
    listen:
      content_type: vw_content_performance.type
      release_year: vw_content_performance.release_year
    row: 14
    col: 16
    width: 8
    height: 8

  - title: "Approval % vs Views (Scatter)"
    name: scatter
    model: analytics
    explore: vw_content_performance
    type: looker_scatter
    fields: [vw_content_performance.title_name, vw_content_performance.total_views, vw_content_performance.approval_pct, vw_content_performance.type]
    pivots: [vw_content_performance.type]
    limit: 500
    listen:
      content_type: vw_content_performance.type
      release_year: vw_content_performance.release_year
    row: 22
    col: 0
    width: 12
    height: 8

  - title: "Ratings Distribution by Title (Top 20)"
    name: ratings_dist
    model: analytics
    explore: vw_content_performance
    type: looker_column
    fields: [vw_content_performance.title_name, vw_content_performance.positive_ratings, vw_content_performance.negative_ratings]
    sorts: [vw_content_performance.total_ratings desc]
    limit: 20
    listen:
      content_type: vw_content_performance.type
      release_year: vw_content_performance.release_year
    row: 22
    col: 12
    width: 12
    height: 8

  - title: "Most Viewed (Detail)"
    name: detail_views
    model: analytics
    explore: vw_content_performance
    type: looker_grid
    fields: [vw_content_performance.title_name, vw_content_performance.type, vw_content_performance.release_year, vw_content_performance.total_views, vw_content_performance.unique_viewers, vw_content_performance.total_watch_hours, vw_content_performance.approval_pct]
    sorts: [vw_content_performance.total_views desc]
    limit: 100
    listen:
      content_type: vw_content_performance.type
      release_year: vw_content_performance.release_year
    row: 30
    col: 0
    width: 12
    height: 8

  - title: "Highest Approval (Detail)"
    name: detail_approval
    model: analytics
    explore: vw_content_performance
    type: looker_grid
    fields: [vw_content_performance.title_name, vw_content_performance.type, vw_content_performance.release_year, vw_content_performance.total_ratings, vw_content_performance.approval_pct]
    sorts: [vw_content_performance.approval_pct desc]
    limit: 100
    listen:
      content_type: vw_content_performance.type
      release_year: vw_content_performance.release_year
    row: 30
    col: 12
    width: 12
    height: 8

  - title: "Underperformers (Low Approval, High Views)"
    name: underperformers
    model: analytics
    explore: vw_content_performance
    type: looker_grid
    fields: [vw_content_performance.title_name, vw_content_performance.type, vw_content_performance.total_views, vw_content_performance.total_ratings, vw_content_performance.approval_pct]
    filters:
      vw_content_performance.approval_pct: "<50"
    sorts: [vw_content_performance.total_views desc]
    limit: 50
    listen:
      content_type: vw_content_performance.type
      release_year: vw_content_performance.release_year
    row: 38
    col: 0
    width: 24
    height: 8
