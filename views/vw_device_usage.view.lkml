view: vw_device_usage {
  # Daily watch sessions broken down by device type.
  # Source: BigQuery view `streaming_service.vw_device_usage`.
  sql_table_name: `@{DATASET}.vw_device_usage` ;;

  dimension_group: activity {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.activity_date ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: unique_profiles {
    type: number
    sql: ${TABLE}.unique_profiles ;;
  }

  dimension: total_watch_hours {
    type: number
    sql: ${TABLE}.total_watch_hours ;;
    value_format_name: decimal_2
  }

  dimension: total_watch_seconds {
    type: number
    sql: ${TABLE}.total_watch_seconds ;;
    hidden: yes
  }

  dimension: avg_session_minutes {
    type: number
    sql: ${TABLE}.avg_session_minutes ;;
    value_format_name: decimal_2
  }

  measure: count {
    type: count
    drill_fields: [activity_date, device_type, sessions, total_watch_hours]
  }

  measure: sum_sessions {
    type: sum
    sql: ${sessions} ;;
  }

  measure: sum_unique_profiles {
    type: sum
    sql: ${unique_profiles} ;;
  }

  measure: sum_watch_hours {
    type: sum
    sql: ${total_watch_hours} ;;
    value_format_name: decimal_0
  }

  measure: avg_session_minutes_weighted {
    type: number
    sql: SAFE_DIVIDE(SUM(${total_watch_seconds}) / 60.0, SUM(${sessions})) ;;
    value_format_name: decimal_2
    description: "Weighted average session length in minutes."
  }
}
