- dashboard: new_vs_catalog_performance
  title: "New vs Catalog Performance"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "How recent releases (last 2 years) perform compared to the back catalog."

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
  - title: "Total Views (All)"
    name: kpi_views
    model: analytics
    explore: vw_content_performance
    type: single_value
    fields: [vw_content_performance.sum_views]
    listen:
      content_type: vw_content_performance.type
    row: 0
    col: 0
    width: 8
    height: 4

  - title: "Total Hours (All)"
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

  - title: "Avg Approval (All)"
    name: kpi_approval
    model: analytics
    explore: vw_content_performance
    type: single_value
    fields: [vw_content_performance.avg_approval_pct]
    listen:
      content_type: vw_content_performance.type
    row: 0
    col: 16
    width: 8
    height: 4

  - title: "New (>=2025) Titles - Views"
    name: new_views
    model: analytics
    explore: vw_content_performance
    type: single_value
    fields: [vw_content_performance.sum_views]
    filters:
      vw_content_performance.release_year: ">=2025"
    listen:
      content_type: vw_content_performance.type
    row: 4
    col: 0
    width: 6
    height: 4

  - title: "Catalog (<2025) Titles - Views"
    name: catalog_views
    model: analytics
    explore: vw_content_performance
    type: single_value
    fields: [vw_content_performance.sum_views]
    filters:
      vw_content_performance.release_year: "<2025"
    listen:
      content_type: vw_content_performance.type
    row: 4
    col: 6
    width: 6
    height: 4

  - title: "New (>=2025) - Avg Approval %"
    name: new_approval
    model: analytics
    explore: vw_content_performance
    type: single_value
    fields: [vw_content_performance.avg_approval_pct]
    filters:
      vw_content_performance.release_year: ">=2025"
    listen:
      content_type: vw_content_performance.type
    row: 4
    col: 12
    width: 6
    height: 4

  - title: "Catalog (<2025) - Avg Approval %"
    name: catalog_approval
    model: analytics
    explore: vw_content_performance
    type: single_value
    fields: [vw_content_performance.avg_approval_pct]
    filters:
      vw_content_performance.release_year: "<2025"
    listen:
      content_type: vw_content_performance.type
    row: 4
    col: 18
    width: 6
    height: 4

  - title: "Views by Release Year"
    name: views_year
    model: analytics
    explore: vw_content_performance
    type: looker_column
    fields: [vw_content_performance.release_year, vw_content_performance.sum_views]
    sorts: [vw_content_performance.release_year]
    listen:
      content_type: vw_content_performance.type
    row: 8
    col: 0
    width: 12
    height: 8

  - title: "Watch Hours by Release Year"
    name: hours_year
    model: analytics
    explore: vw_content_performance
    type: looker_column
    fields: [vw_content_performance.release_year, vw_content_performance.sum_watch_hours]
    sorts: [vw_content_performance.release_year]
    listen:
      content_type: vw_content_performance.type
    row: 8
    col: 12
    width: 12
    height: 8

  - title: "Top New Releases (>=2025)"
    name: new_top
    model: analytics
    explore: vw_content_performance
    type: looker_grid
    fields: [vw_content_performance.title_name, vw_content_performance.type, vw_content_performance.release_year, vw_content_performance.total_views, vw_content_performance.total_watch_hours, vw_content_performance.approval_pct]
    filters:
      vw_content_performance.release_year: ">=2025"
    sorts: [vw_content_performance.total_views desc]
    limit: 50
    listen:
      content_type: vw_content_performance.type
    row: 16
    col: 0
    width: 24
    height: 8
