- dashboard: content_catalog_overview
  title: "Content Catalog Overview"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "How the catalog is composed by type, release year and rating quality."

  filters:
  - name: content_type
    title: "Content Type"
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    model: analytics
    explore: vw_content_catalog_summary
    field: vw_content_catalog_summary.type

  - name: release_year
    title: "Release Year"
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    model: analytics
    explore: vw_content_catalog_summary
    field: vw_content_catalog_summary.release_year

  elements:
  - title: "Total Catalog Titles"
    name: kpi_titles
    model: analytics
    explore: vw_content_catalog_summary
    type: single_value
    fields: [vw_content_catalog_summary.sum_titles]
    listen:
      content_type: vw_content_catalog_summary.type
      release_year: vw_content_catalog_summary.release_year
    row: 0
    col: 0
    width: 6
    height: 4

  - title: "Total Views"
    name: kpi_views
    model: analytics
    explore: vw_content_catalog_summary
    type: single_value
    fields: [vw_content_catalog_summary.sum_views]
    listen:
      content_type: vw_content_catalog_summary.type
      release_year: vw_content_catalog_summary.release_year
    row: 0
    col: 6
    width: 6
    height: 4

  - title: "Total Ratings"
    name: kpi_ratings
    model: analytics
    explore: vw_content_catalog_summary
    type: single_value
    fields: [vw_content_catalog_summary.sum_ratings]
    listen:
      content_type: vw_content_catalog_summary.type
      release_year: vw_content_catalog_summary.release_year
    row: 0
    col: 12
    width: 6
    height: 4

  - title: "Avg Rating Score"
    name: kpi_rating
    model: analytics
    explore: vw_content_catalog_summary
    type: single_value
    fields: [vw_content_catalog_summary.avg_rating]
    listen:
      content_type: vw_content_catalog_summary.type
      release_year: vw_content_catalog_summary.release_year
    row: 0
    col: 18
    width: 6
    height: 4

  - title: "Catalog Composition by Type"
    name: type_pie
    model: analytics
    explore: vw_content_catalog_summary
    type: looker_pie
    fields: [vw_content_catalog_summary.type, vw_content_catalog_summary.sum_titles]
    sorts: [vw_content_catalog_summary.sum_titles desc]
    listen:
      content_type: vw_content_catalog_summary.type
      release_year: vw_content_catalog_summary.release_year
    row: 4
    col: 0
    width: 8
    height: 8

  - title: "Title Count by Release Year"
    name: titles_by_year
    model: analytics
    explore: vw_content_catalog_summary
    type: looker_column
    fields: [vw_content_catalog_summary.release_year, vw_content_catalog_summary.sum_titles]
    sorts: [vw_content_catalog_summary.release_year]
    listen:
      content_type: vw_content_catalog_summary.type
      release_year: vw_content_catalog_summary.release_year
    row: 4
    col: 8
    width: 8
    height: 8

  - title: "Avg Rating by Release Year"
    name: rating_by_year
    model: analytics
    explore: vw_content_catalog_summary
    type: looker_line
    fields: [vw_content_catalog_summary.release_year, vw_content_catalog_summary.avg_rating]
    sorts: [vw_content_catalog_summary.release_year]
    listen:
      content_type: vw_content_catalog_summary.type
      release_year: vw_content_catalog_summary.release_year
    row: 4
    col: 16
    width: 8
    height: 8

  - title: "Title Count by Type & Year"
    name: titles_type_year
    model: analytics
    explore: vw_content_catalog_summary
    type: looker_column
    fields: [vw_content_catalog_summary.release_year, vw_content_catalog_summary.type, vw_content_catalog_summary.sum_titles]
    pivots: [vw_content_catalog_summary.type]
    sorts: [vw_content_catalog_summary.release_year]
    stacking: normal
    listen:
      content_type: vw_content_catalog_summary.type
      release_year: vw_content_catalog_summary.release_year
    row: 12
    col: 0
    width: 12
    height: 8

  - title: "Views by Type & Year"
    name: views_type_year
    model: analytics
    explore: vw_content_catalog_summary
    type: looker_area
    fields: [vw_content_catalog_summary.release_year, vw_content_catalog_summary.type, vw_content_catalog_summary.sum_views]
    pivots: [vw_content_catalog_summary.type]
    sorts: [vw_content_catalog_summary.release_year]
    stacking: percent
    listen:
      content_type: vw_content_catalog_summary.type
      release_year: vw_content_catalog_summary.release_year
    row: 12
    col: 12
    width: 12
    height: 8

  - title: "Catalog % Share by Type"
    name: pct_share
    model: analytics
    explore: vw_content_catalog_summary
    type: looker_bar
    fields: [vw_content_catalog_summary.type, vw_content_catalog_summary.pct_of_catalog]
    sorts: [vw_content_catalog_summary.pct_of_catalog desc]
    listen:
      content_type: vw_content_catalog_summary.type
      release_year: vw_content_catalog_summary.release_year
    row: 20
    col: 0
    width: 12
    height: 8

  - title: "Catalog Detail by Type & Year"
    name: catalog_grid
    model: analytics
    explore: vw_content_catalog_summary
    type: looker_grid
    fields: [vw_content_catalog_summary.type, vw_content_catalog_summary.release_year, vw_content_catalog_summary.title_count, vw_content_catalog_summary.total_views, vw_content_catalog_summary.total_ratings, vw_content_catalog_summary.avg_rating_score, vw_content_catalog_summary.pct_of_catalog]
    sorts: [vw_content_catalog_summary.release_year desc, vw_content_catalog_summary.type]
    listen:
      content_type: vw_content_catalog_summary.type
      release_year: vw_content_catalog_summary.release_year
    row: 20
    col: 12
    width: 12
    height: 8
