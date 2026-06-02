- dashboard: power_user_profiles
  title: "Power User Profiles"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Identifies power users — top profiles by watch hours, sessions, ratings and watchlist size."

  elements:
  - title: "Total Profiles"
    name: kpi_profiles
    model: analytics
    explore: vw_profile_activity_360
    type: single_value
    fields: [vw_profile_activity_360.count]
    row: 0
    col: 0
    width: 6
    height: 4

  - title: "Avg Watch Hours / Profile"
    name: kpi_avg_hours
    model: analytics
    explore: vw_profile_activity_360
    type: single_value
    fields: [vw_profile_activity_360.avg_watch_hours_per_profile]
    row: 0
    col: 6
    width: 6
    height: 4

  - title: "Active 30d %"
    name: kpi_active_pct
    model: analytics
    explore: vw_profile_activity_360
    type: single_value
    fields: [vw_profile_activity_360.pct_active_30d]
    row: 0
    col: 12
    width: 6
    height: 4

  - title: "Total Watch Hours"
    name: kpi_total_hours
    model: analytics
    explore: vw_profile_activity_360
    type: single_value
    fields: [vw_profile_activity_360.sum_watch_hours]
    row: 0
    col: 18
    width: 6
    height: 4

  - title: "Top 25 Power Users (by Watch Hours)"
    name: top_users
    model: analytics
    explore: vw_profile_activity_360
    type: looker_bar
    fields: [vw_profile_activity_360.profile_id, vw_profile_activity_360.total_watch_hours, vw_profile_activity_360.total_sessions, vw_profile_activity_360.unique_titles_watched]
    sorts: [vw_profile_activity_360.total_watch_hours desc]
    limit: 25
    row: 4
    col: 0
    width: 24
    height: 8

  - title: "Engagement Tier Mix"
    name: tier_mix
    model: analytics
    explore: vw_profile_activity_360
    type: looker_pie
    fields: [vw_profile_activity_360.engagement_tier, vw_profile_activity_360.count]
    sorts: [vw_profile_activity_360.engagement_tier]
    row: 12
    col: 0
    width: 8
    height: 8

  - title: "Power User Watch Hours by Primary Device"
    name: power_device
    model: analytics
    explore: vw_profile_activity_360
    type: looker_column
    filters:
      vw_profile_activity_360.engagement_tier: "1. Power"
    fields: [vw_profile_activity_360.primary_device, vw_profile_activity_360.sum_watch_hours]
    sorts: [vw_profile_activity_360.sum_watch_hours desc]
    row: 12
    col: 8
    width: 8
    height: 8

  - title: "Top Raters (Profiles by Ratings Given)"
    name: top_raters
    model: analytics
    explore: vw_profile_activity_360
    type: looker_bar
    fields: [vw_profile_activity_360.profile_id, vw_profile_activity_360.ratings_given, vw_profile_activity_360.positive_ratings, vw_profile_activity_360.negative_ratings]
    sorts: [vw_profile_activity_360.ratings_given desc]
    limit: 25
    row: 12
    col: 16
    width: 8
    height: 8

  - title: "Watchlist Size Distribution"
    name: wl_dist
    model: analytics
    explore: vw_profile_activity_360
    type: looker_column
    fields: [vw_profile_activity_360.watchlist_size, vw_profile_activity_360.count]
    sorts: [vw_profile_activity_360.watchlist_size]
    limit: 50
    row: 20
    col: 0
    width: 12
    height: 8

  - title: "Power User Detail"
    name: detail
    model: analytics
    explore: vw_profile_activity_360
    type: looker_grid
    filters:
      vw_profile_activity_360.engagement_tier: "1. Power"
    fields: [vw_profile_activity_360.profile_id, vw_profile_activity_360.account_id, vw_profile_activity_360.total_sessions, vw_profile_activity_360.total_watch_hours, vw_profile_activity_360.unique_titles_watched, vw_profile_activity_360.ratings_given, vw_profile_activity_360.watchlist_size, vw_profile_activity_360.primary_device]
    sorts: [vw_profile_activity_360.total_watch_hours desc]
    limit: 200
    row: 20
    col: 12
    width: 12
    height: 8
