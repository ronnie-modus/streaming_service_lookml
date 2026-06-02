- dashboard: top_titles_leaderboard
  title: "Top Titles Leaderboard"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Leaderboards across views, viewers, watch hours, approval, and ratings volume."

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

  - name: min_views
    title: "Min Views"
    type: field_filter
    default_value: "0"
    allow_multiple_values: true
    required: false
    model: analytics
    explore: vw_content_performance
    field: vw_content_performance.total_views

  elements:
  - title: "Total Views"
    name: kpi_views
    model: analytics
    explore: vw_content_performance
    type: single_value
    fields: [vw_content_performance.sum_views]
    listen:
      content_type: vw_content_performance.type
      min_views: vw_content_performance.total_views
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
      min_views: vw_content_performance.total_views
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
      min_views: vw_content_performance.total_views
    row: 0
    col: 12
    width: 6
    height: 4

  - title: "Titles in Scope"
    name: kpi_count
    model: analytics
    explore: vw_content_performance
    type: single_value
    fields: [vw_content_performance.count]
    listen:
      content_type: vw_content_performance.type
      min_views: vw_content_performance.total_views
    row: 0
    col: 18
    width: 6
    height: 4

  - title: "Top 25 by Views"
    name: top_views
    model: analytics
    explore: vw_content_performance
    type: looker_bar
    fields: [vw_content_performance.title_name, vw_content_performance.total_views]
    sorts: [vw_content_performance.total_views desc]
    limit: 25
    listen:
      content_type: vw_content_performance.type
      min_views: vw_content_performance.total_views
    row: 4
    col: 0
    width: 12
    height: 10

  - title: "Top 25 by Unique Viewers"
    name: top_viewers
    model: analytics
    explore: vw_content_performance
    type: looker_bar
    fields: [vw_content_performance.title_name, vw_content_performance.unique_viewers]
    sorts: [vw_content_performance.unique_viewers desc]
    limit: 25
    listen:
      content_type: vw_content_performance.type
      min_views: vw_content_performance.total_views
    row: 4
    col: 12
    width: 12
    height: 10

  - title: "Top 25 by Watch Hours"
    name: top_hours
    model: analytics
    explore: vw_content_performance
    type: looker_bar
    fields: [vw_content_performance.title_name, vw_content_performance.total_watch_hours]
    sorts: [vw_content_performance.total_watch_hours desc]
    limit: 25
    listen:
      content_type: vw_content_performance.type
      min_views: vw_content_performance.total_views
    row: 14
    col: 0
    width: 12
    height: 10

  - title: "Top 25 by Approval %"
    name: top_approval
    model: analytics
    explore: vw_content_performance
    type: looker_bar
    fields: [vw_content_performance.title_name, vw_content_performance.approval_pct]
    sorts: [vw_content_performance.approval_pct desc]
    limit: 25
    listen:
      content_type: vw_content_performance.type
      min_views: vw_content_performance.total_views
    row: 14
    col: 12
    width: 12
    height: 10

  - title: "Top 25 by Total Ratings"
    name: top_ratings
    model: analytics
    explore: vw_content_performance
    type: looker_bar
    fields: [vw_content_performance.title_name, vw_content_performance.total_ratings]
    sorts: [vw_content_performance.total_ratings desc]
    limit: 25
    listen:
      content_type: vw_content_performance.type
      min_views: vw_content_performance.total_views
    row: 24
    col: 0
    width: 12
    height: 10

  - title: "Bottom 25 by Approval %"
    name: bottom_approval
    model: analytics
    explore: vw_content_performance
    type: looker_bar
    fields: [vw_content_performance.title_name, vw_content_performance.approval_pct, vw_content_performance.total_ratings]
    sorts: [vw_content_performance.approval_pct asc]
    limit: 25
    listen:
      content_type: vw_content_performance.type
      min_views: vw_content_performance.total_views
    row: 24
    col: 12
    width: 12
    height: 10

  - title: "Full Leaderboard"
    name: full_grid
    model: analytics
    explore: vw_content_performance
    type: looker_grid
    fields: [vw_content_performance.title_name, vw_content_performance.type, vw_content_performance.release_year, vw_content_performance.total_views, vw_content_performance.unique_viewers, vw_content_performance.total_watch_hours, vw_content_performance.total_ratings, vw_content_performance.approval_pct]
    sorts: [vw_content_performance.total_views desc]
    limit: 200
    listen:
      content_type: vw_content_performance.type
      min_views: vw_content_performance.total_views
    row: 34
    col: 0
    width: 24
    height: 8
