- dashboard: content_roi_and_approval
  title: "Content ROI & Approval"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Approval-driven view of content ROI: which titles are loved, which are not, and where viewing time is spent."

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

  elements:
  - title: "Avg Approval %"
    name: kpi_approval
    model: analytics
    explore: vw_content_performance
    type: single_value
    fields: [vw_content_performance.avg_approval_pct]
    listen:
      content_type: vw_content_performance.type
    row: 0
    col: 0
    width: 8
    height: 4

  - title: "Total Watch Hours"
    name: kpi_hours
    model: analytics
    explore: vw_content_performance
    type: single_value
    fields: [vw_content_performance.sum_watch_hours]
    listen:
      content_type: vw_content_performance.type
    row: 0
    col: 8
    width: 8
    height: 4

  - title: "Total Ratings"
    name: kpi_ratings
    model: analytics
    explore: vw_content_performance
    type: single_value
    fields: [vw_content_performance.count]
    listen:
      content_type: vw_content_performance.type
    row: 0
    col: 16
    width: 8
    height: 4

  - title: "Approval % by Release Year"
    name: approval_year
    model: analytics
    explore: vw_content_performance
    type: looker_line
    fields: [vw_content_performance.release_year, vw_content_performance.avg_approval_pct]
    sorts: [vw_content_performance.release_year]
    listen:
      content_type: vw_content_performance.type
    row: 4
    col: 0
    width: 12
    height: 8

  - title: "Watch Hours vs Approval (Scatter)"
    name: hours_vs_approval
    model: analytics
    explore: vw_content_performance
    type: looker_scatter
    fields: [vw_content_performance.title_name, vw_content_performance.total_watch_hours, vw_content_performance.approval_pct, vw_content_performance.type]
    pivots: [vw_content_performance.type]
    limit: 500
    listen:
      content_type: vw_content_performance.type
    row: 4
    col: 12
    width: 12
    height: 8

  - title: "Top Approval Champions"
    name: champions
    model: analytics
    explore: vw_content_performance
    type: looker_grid
    fields: [vw_content_performance.title_name, vw_content_performance.type, vw_content_performance.total_views, vw_content_performance.total_watch_hours, vw_content_performance.approval_pct]
    sorts: [vw_content_performance.approval_pct desc]
    limit: 25
    listen:
      content_type: vw_content_performance.type
    row: 12
    col: 0
    width: 12
    height: 8

  - title: "Approval Underperformers (>0 ratings)"
    name: underperformers
    model: analytics
    explore: vw_content_performance
    type: looker_grid
    fields: [vw_content_performance.title_name, vw_content_performance.type, vw_content_performance.total_views, vw_content_performance.total_watch_hours, vw_content_performance.approval_pct]
    filters:
      vw_content_performance.total_ratings: ">0"
    sorts: [vw_content_performance.approval_pct asc]
    limit: 25
    listen:
      content_type: vw_content_performance.type
    row: 12
    col: 12
    width: 12
    height: 8

  - title: "Approval Distribution"
    name: approval_dist
    model: analytics
    explore: vw_content_performance
    type: looker_column
    fields: [vw_content_performance.approval_pct, vw_content_performance.count]
    sorts: [vw_content_performance.approval_pct]
    listen:
      content_type: vw_content_performance.type
    row: 20
    col: 0
    width: 12
    height: 8

  - title: "Hours Concentration (Top 50 Titles vs Rest)"
    name: hours_concentration
    model: analytics
    explore: vw_content_performance
    type: looker_grid
    fields: [vw_content_performance.title_name, vw_content_performance.total_watch_hours, vw_content_performance.total_views]
    sorts: [vw_content_performance.total_watch_hours desc]
    limit: 50
    listen:
      content_type: vw_content_performance.type
    row: 20
    col: 12
    width: 12
    height: 8
