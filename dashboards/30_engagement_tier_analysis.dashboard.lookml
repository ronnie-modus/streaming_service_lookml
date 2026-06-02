- dashboard: engagement_tier_analysis
  title: "Engagement Tier Analysis"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Deep look at the four engagement tiers (Power / Engaged / Casual / Inactive) and their behaviors."

  elements:
  - title: "Power Users"
    name: kpi_power
    model: analytics
    explore: vw_profile_activity_360
    type: single_value
    filters:
      vw_profile_activity_360.engagement_tier: "1. Power"
    fields: [vw_profile_activity_360.count]
    row: 0
    col: 0
    width: 6
    height: 4

  - title: "Engaged Users"
    name: kpi_engaged
    model: analytics
    explore: vw_profile_activity_360
    type: single_value
    filters:
      vw_profile_activity_360.engagement_tier: "2. Engaged"
    fields: [vw_profile_activity_360.count]
    row: 0
    col: 6
    width: 6
    height: 4

  - title: "Casual Users"
    name: kpi_casual
    model: analytics
    explore: vw_profile_activity_360
    type: single_value
    filters:
      vw_profile_activity_360.engagement_tier: "3. Casual"
    fields: [vw_profile_activity_360.count]
    row: 0
    col: 12
    width: 6
    height: 4

  - title: "Inactive Users"
    name: kpi_inactive
    model: analytics
    explore: vw_profile_activity_360
    type: single_value
    filters:
      vw_profile_activity_360.engagement_tier: "4. Inactive"
    fields: [vw_profile_activity_360.count]
    row: 0
    col: 18
    width: 6
    height: 4

  - title: "Watch Hours Share by Tier"
    name: hours_share
    model: analytics
    explore: vw_profile_activity_360
    type: looker_pie
    fields: [vw_profile_activity_360.engagement_tier, vw_profile_activity_360.sum_watch_hours]
    sorts: [vw_profile_activity_360.engagement_tier]
    row: 4
    col: 0
    width: 12
    height: 8

  - title: "Avg Watch Hours / Profile by Tier"
    name: avg_hours
    model: analytics
    explore: vw_profile_activity_360
    type: looker_bar
    fields: [vw_profile_activity_360.engagement_tier, vw_profile_activity_360.avg_watch_hours_per_profile]
    sorts: [vw_profile_activity_360.engagement_tier]
    row: 4
    col: 12
    width: 12
    height: 8

  - title: "Engagement Tier Detail"
    name: tier_detail
    model: analytics
    explore: vw_profile_activity_360
    type: looker_grid
    fields: [vw_profile_activity_360.engagement_tier, vw_profile_activity_360.count, vw_profile_activity_360.count_active_30d, vw_profile_activity_360.pct_active_30d, vw_profile_activity_360.sum_sessions, vw_profile_activity_360.sum_watch_hours, vw_profile_activity_360.avg_watch_hours_per_profile, vw_profile_activity_360.sum_ratings]
    sorts: [vw_profile_activity_360.engagement_tier]
    row: 12
    col: 0
    width: 24
    height: 8
