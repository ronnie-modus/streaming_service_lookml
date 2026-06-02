- dashboard: user_segmentation
  title: "User Segmentation"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Segment the user base by engagement tier, device preference and behavior signals."

  elements:
  - title: "Total Profiles"
    name: kpi_total
    model: analytics
    explore: vw_profile_activity_360
    type: single_value
    fields: [vw_profile_activity_360.count]
    row: 0
    col: 0
    width: 8
    height: 4

  - title: "Active 30d %"
    name: kpi_active
    model: analytics
    explore: vw_profile_activity_360
    type: single_value
    fields: [vw_profile_activity_360.pct_active_30d]
    row: 0
    col: 8
    width: 8
    height: 4

  - title: "Avg Watch Hours / Profile"
    name: kpi_avg
    model: analytics
    explore: vw_profile_activity_360
    type: single_value
    fields: [vw_profile_activity_360.avg_watch_hours_per_profile]
    row: 0
    col: 16
    width: 8
    height: 4

  - title: "Engagement Tier Mix"
    name: tier_mix
    model: analytics
    explore: vw_profile_activity_360
    type: looker_pie
    fields: [vw_profile_activity_360.engagement_tier, vw_profile_activity_360.count]
    sorts: [vw_profile_activity_360.engagement_tier]
    row: 4
    col: 0
    width: 8
    height: 8

  - title: "Profiles by Primary Device"
    name: by_device
    model: analytics
    explore: vw_profile_activity_360
    type: looker_bar
    fields: [vw_profile_activity_360.primary_device, vw_profile_activity_360.count]
    sorts: [vw_profile_activity_360.count desc]
    row: 4
    col: 8
    width: 8
    height: 8

  - title: "Active 30d by Tier"
    name: active_tier
    model: analytics
    explore: vw_profile_activity_360
    type: looker_column
    fields: [vw_profile_activity_360.engagement_tier, vw_profile_activity_360.count_active_30d, vw_profile_activity_360.count]
    sorts: [vw_profile_activity_360.engagement_tier]
    row: 4
    col: 16
    width: 8
    height: 8

  - title: "Watch Hours by Tier"
    name: hours_tier
    model: analytics
    explore: vw_profile_activity_360
    type: looker_bar
    fields: [vw_profile_activity_360.engagement_tier, vw_profile_activity_360.sum_watch_hours]
    sorts: [vw_profile_activity_360.engagement_tier]
    row: 12
    col: 0
    width: 12
    height: 8

  - title: "Tier x Primary Device Heatmap"
    name: tier_device
    model: analytics
    explore: vw_profile_activity_360
    type: looker_grid
    fields: [vw_profile_activity_360.engagement_tier, vw_profile_activity_360.primary_device, vw_profile_activity_360.count]
    pivots: [vw_profile_activity_360.primary_device]
    sorts: [vw_profile_activity_360.engagement_tier]
    row: 12
    col: 12
    width: 12
    height: 8
