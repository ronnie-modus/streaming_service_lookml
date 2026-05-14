- dashboard: watchlist_conversion
  title: "Watchlist Conversion"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "How well watchlist saves convert into actual watch sessions and hours, sliced by content."

  filters:
  - name: content_type
    title: "Content Type"
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    model: analytics
    explore: vw_watchlist_conversion
    field: vw_watchlist_conversion.type

  elements:
  - title: "Watchlist Entries"
    name: kpi_entries
    model: analytics
    explore: vw_watchlist_conversion
    type: single_value
    fields: [vw_watchlist_conversion.count]
    listen:
      content_type: vw_watchlist_conversion.type
    row: 0
    col: 0
    width: 6
    height: 4

  - title: "Watched"
    name: kpi_watched
    model: analytics
    explore: vw_watchlist_conversion
    type: single_value
    fields: [vw_watchlist_conversion.count_watched]
    listen:
      content_type: vw_watchlist_conversion.type
    row: 0
    col: 6
    width: 6
    height: 4

  - title: "Conversion Rate %"
    name: kpi_rate
    model: analytics
    explore: vw_watchlist_conversion
    type: single_value
    fields: [vw_watchlist_conversion.conversion_rate_pct]
    listen:
      content_type: vw_watchlist_conversion.type
    row: 0
    col: 12
    width: 6
    height: 4

  - title: "Distinct Profiles"
    name: kpi_profiles
    model: analytics
    explore: vw_watchlist_conversion
    type: single_value
    fields: [vw_watchlist_conversion.distinct_profiles]
    listen:
      content_type: vw_watchlist_conversion.type
    row: 0
    col: 18
    width: 6
    height: 4

  - title: "Watched vs Not Watched"
    name: watched_pie
    model: analytics
    explore: vw_watchlist_conversion
    type: looker_pie
    fields: [vw_watchlist_conversion.was_watched, vw_watchlist_conversion.count]
    listen:
      content_type: vw_watchlist_conversion.type
    row: 4
    col: 0
    width: 8
    height: 8

  - title: "Conversion Rate by Content Type"
    name: conv_by_type
    model: analytics
    explore: vw_watchlist_conversion
    type: looker_bar
    fields: [vw_watchlist_conversion.type, vw_watchlist_conversion.conversion_rate_pct]
    sorts: [vw_watchlist_conversion.conversion_rate_pct desc]
    listen:
      content_type: vw_watchlist_conversion.type
    row: 4
    col: 8
    width: 8
    height: 8

  - title: "Conversion Rate by Release Year"
    name: conv_by_year
    model: analytics
    explore: vw_watchlist_conversion
    type: looker_column
    fields: [vw_watchlist_conversion.release_year, vw_watchlist_conversion.conversion_rate_pct]
    sorts: [vw_watchlist_conversion.release_year]
    listen:
      content_type: vw_watchlist_conversion.type
    row: 4
    col: 16
    width: 8
    height: 8

  - title: "Top Converting Titles"
    name: top_conv
    model: analytics
    explore: vw_watchlist_conversion
    type: looker_bar
    fields: [vw_watchlist_conversion.title_name, vw_watchlist_conversion.type, vw_watchlist_conversion.count, vw_watchlist_conversion.count_watched, vw_watchlist_conversion.conversion_rate_pct]
    sorts: [vw_watchlist_conversion.count_watched desc]
    limit: 25
    listen:
      content_type: vw_watchlist_conversion.type
    row: 12
    col: 0
    width: 12
    height: 8

  - title: "Worst Converting Titles (Min 25 entries)"
    name: worst_conv
    model: analytics
    explore: vw_watchlist_conversion
    type: looker_bar
    filters:
      vw_watchlist_conversion.count: ">25"
    fields: [vw_watchlist_conversion.title_name, vw_watchlist_conversion.type, vw_watchlist_conversion.count, vw_watchlist_conversion.conversion_rate_pct]
    sorts: [vw_watchlist_conversion.conversion_rate_pct]
    limit: 25
    listen:
      content_type: vw_watchlist_conversion.type
    row: 12
    col: 12
    width: 12
    height: 8

  - title: "Watch Hours from Watchlist Conversions"
    name: hours_from_wl
    model: analytics
    explore: vw_watchlist_conversion
    type: looker_column
    fields: [vw_watchlist_conversion.type, vw_watchlist_conversion.total_watch_hours]
    sorts: [vw_watchlist_conversion.total_watch_hours desc]
    listen:
      content_type: vw_watchlist_conversion.type
    row: 20
    col: 0
    width: 12
    height: 8

  - title: "Watchlist Conversion Detail"
    name: detail_grid
    model: analytics
    explore: vw_watchlist_conversion
    type: looker_grid
    fields: [vw_watchlist_conversion.title_name, vw_watchlist_conversion.type, vw_watchlist_conversion.release_year, vw_watchlist_conversion.count, vw_watchlist_conversion.count_watched, vw_watchlist_conversion.conversion_rate_pct, vw_watchlist_conversion.total_watch_hours]
    sorts: [vw_watchlist_conversion.count desc]
    limit: 200
    listen:
      content_type: vw_watchlist_conversion.type
    row: 20
    col: 12
    width: 12
    height: 8
