view: vw_profile_activity_360 {
  # 360-degree per-profile summary: watch, ratings, watchlist, primary device.
  # Source: BigQuery view `streaming_service.vw_profile_activity_360`.
  sql_table_name: `@{DATASET}.vw_profile_activity_360` ;;

  dimension: profile_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.profile_id ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: total_sessions {
    type: number
    sql: ${TABLE}.total_sessions ;;
  }

  dimension: unique_titles_watched {
    type: number
    sql: ${TABLE}.unique_titles_watched ;;
  }

  dimension: total_watch_hours {
    type: number
    sql: ${TABLE}.total_watch_hours ;;
    value_format_name: decimal_2
  }

  dimension_group: first_watch {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.first_watch_date ;;
  }

  dimension_group: last_watch {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_watch_date ;;
  }

  dimension: ratings_given {
    type: number
    sql: ${TABLE}.ratings_given ;;
  }

  dimension: positive_ratings {
    type: number
    sql: ${TABLE}.positive_ratings ;;
  }

  dimension: negative_ratings {
    type: number
    sql: ${TABLE}.negative_ratings ;;
  }

  dimension: watchlist_size {
    type: number
    sql: ${TABLE}.watchlist_size ;;
  }

  dimension: primary_device {
    type: string
    sql: ${TABLE}.primary_device ;;
  }

  dimension: is_active_30d {
    type: yesno
    sql: ${TABLE}.is_active_30d ;;
  }

  dimension: engagement_tier {
    type: string
    sql:
      CASE
        WHEN ${total_watch_hours} >= 20 THEN '1. Power'
        WHEN ${total_watch_hours} >= 5  THEN '2. Engaged'
        WHEN ${total_watch_hours} > 0   THEN '3. Casual'
        ELSE '4. Inactive'
      END ;;
    description: "Engagement segment based on total watch hours."
  }

  measure: count {
    type: count
    drill_fields: [profile_id, account_id, total_sessions, total_watch_hours, primary_device]
  }

  measure: count_active_30d {
    type: count
    filters: [is_active_30d: "yes"]
  }

  measure: pct_active_30d {
    type: number
    sql: SAFE_DIVIDE(${count_active_30d}, ${count}) * 100 ;;
    value_format_name: decimal_2
  }

  measure: sum_sessions {
    type: sum
    sql: ${total_sessions} ;;
  }

  measure: sum_watch_hours {
    type: sum
    sql: ${total_watch_hours} ;;
    value_format_name: decimal_0
  }

  measure: avg_watch_hours_per_profile {
    type: average
    sql: ${total_watch_hours} ;;
    value_format_name: decimal_2
  }

  measure: sum_ratings {
    type: sum
    sql: ${ratings_given} ;;
  }
}
