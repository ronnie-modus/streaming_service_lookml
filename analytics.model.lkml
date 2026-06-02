connection: "@{CONNECTION_NAME}"

include: "/views/vw_user_engagement_daily.view.lkml"
include: "/views/vw_content_performance.view.lkml"
include: "/views/vw_subscription_revenue.view.lkml"
include: "/views/vw_ad_campaign_performance.view.lkml"
include: "/views/vw_account_lifecycle.view.lkml"
include: "/views/vw_device_usage.view.lkml"
include: "/views/vw_watchlist_conversion.view.lkml"
include: "/views/vw_feature_adoption.view.lkml"
include: "/views/vw_profile_activity_360.view.lkml"
include: "/views/vw_content_catalog_summary.view.lkml"

# Base views for drill-through joins.
include: "/views/titles.view.lkml"
include: "/views/profiles.view.lkml"
include: "/views/accounts.view.lkml"

# Dashboards
include: "/dashboards/*.dashboard.lookml"

# ============================================================================
# Analytics Model
# Pre-aggregated analytical views on top of `streaming_service`,
# designed for direct consumption by Tableau, Looker dashboards, and other BI tools.
# All underlying BigQuery views are anchored to CURRENT_TIMESTAMP() so they
# treat the dataset as a true "as of today" snapshot.
# ============================================================================

label: "StreamNova - Analytics (Tableau-ready)"

# ----------------------------------------------------------------------------
# Engagement
# ----------------------------------------------------------------------------
explore: vw_user_engagement_daily {
  label: "Daily User Engagement"
  description: "Day-grain DAUs, sessions, and watch hours."
}

explore: vw_device_usage {
  label: "Device Usage (Daily)"
  description: "Daily watch sessions broken down by device type."
}

# ----------------------------------------------------------------------------
# Content
# ----------------------------------------------------------------------------
explore: vw_content_performance {
  label: "Content Performance"
  description: "Title-level views, viewers, watch time and approval ratings."

  join: titles {
    type: left_outer
    relationship: one_to_one
    sql_on: ${vw_content_performance.title_id} = ${titles.title_id} ;;
    fields: []
  }
}

explore: vw_content_catalog_summary {
  label: "Content Catalog Summary"
  description: "Catalog composition by type and release year."
}

# ----------------------------------------------------------------------------
# Revenue & Advertising
# ----------------------------------------------------------------------------
explore: vw_subscription_revenue {
  label: "Subscription Revenue"
  description: "Monthly subscription revenue by plan."
}

explore: vw_ad_campaign_performance {
  label: "Ad Campaign Performance"
  description: "Per-campaign impressions, skip rate and estimated revenue."
}

# ----------------------------------------------------------------------------
# Growth & Retention
# ----------------------------------------------------------------------------
explore: vw_account_lifecycle {
  label: "Account Lifecycle"
  description: "Per-account cohort, engagement, billing and 30-day active flag."

  join: accounts {
    type: left_outer
    relationship: one_to_one
    sql_on: ${vw_account_lifecycle.account_id} = ${accounts.account_id} ;;
    fields: []
  }
}

# ----------------------------------------------------------------------------
# User Behavior
# ----------------------------------------------------------------------------
explore: vw_profile_activity_360 {
  label: "Profile Activity 360"
  description: "Per-profile behavior summary across watch, ratings and watchlists."

  join: profiles {
    type: left_outer
    relationship: one_to_one
    sql_on: ${vw_profile_activity_360.profile_id} = ${profiles.profile_id} ;;
    fields: []
  }

  join: accounts {
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_profile_activity_360.account_id} = ${accounts.account_id} ;;
    fields: []
  }
}

explore: vw_watchlist_conversion {
  label: "Watchlist Conversion"
  description: "Per (profile, title) watchlist entry and whether it converted to a watch."

  join: titles {
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_watchlist_conversion.title_id} = ${titles.title_id} ;;
    fields: []
  }
}

# ----------------------------------------------------------------------------
# Product
# ----------------------------------------------------------------------------
explore: vw_feature_adoption {
  label: "Feature Adoption"
  description: "Daily feature usage with day-over-day change and 30-day rolling totals."
}
