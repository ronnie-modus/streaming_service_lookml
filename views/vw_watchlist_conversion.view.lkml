view: vw_watchlist_conversion {
  # Per (profile, title) pair on the watchlist; was the title actually watched?
  # Source: BigQuery view `streaming_service.vw_watchlist_conversion`.
  sql_table_name: `@{DATASET}.vw_watchlist_conversion` ;;

  dimension: profile_id {
    type: string
    sql: ${TABLE}.profile_id ;;
  }

  dimension: title_id {
    type: string
    sql: ${TABLE}.title_id ;;
  }

  dimension: title_name {
    type: string
    sql: ${TABLE}.title_name ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: release_year {
    type: number
    sql: ${TABLE}.release_year ;;
  }

  dimension: was_watched {
    type: yesno
    sql: ${TABLE}.was_watched ;;
    description: "TRUE if the watchlisted title was watched at least once by the profile."
  }

  dimension: watch_sessions {
    type: number
    sql: ${TABLE}.watch_sessions ;;
  }

  dimension: watch_hours {
    type: number
    sql: ${TABLE}.watch_hours ;;
    value_format_name: decimal_2
  }

  measure: count {
    type: count
    drill_fields: [profile_id, title_name, type, was_watched, watch_sessions, watch_hours]
  }

  measure: count_watched {
    type: count
    filters: [was_watched: "yes"]
  }

  measure: count_not_watched {
    type: count
    filters: [was_watched: "no"]
  }

  measure: conversion_rate_pct {
    type: number
    sql: SAFE_DIVIDE(${count_watched}, ${count}) * 100 ;;
    value_format_name: decimal_2
    description: "Percent of watchlist entries that converted to at least one watch."
  }

  measure: distinct_profiles {
    type: count_distinct
    sql: ${profile_id} ;;
  }

  measure: distinct_titles {
    type: count_distinct
    sql: ${title_id} ;;
  }

  measure: total_watch_hours {
    type: sum
    sql: ${watch_hours} ;;
    value_format_name: decimal_0
  }
}
