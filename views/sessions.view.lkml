view: sessions {
  # Overarching app sessions (app_sessions in the original plan).
  sql_table_name: `@{DATASET}.sessions` ;;

  dimension: app_session_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.app_session_id ;;
  }

  dimension: profile_id {
    type: string
    sql: ${TABLE}.profile_id ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
    description: "Android, iOS, Smart TV, Web."
  }

  dimension_group: session_start {
    type: time
    timeframes: [raw, time, hour_of_day, date, day_of_week, week, month, quarter, year]
    sql: ${TABLE}.session_start ;;
  }

  dimension_group: session_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.session_end ;;
  }

  dimension: session_duration_sec {
    type: number
    sql: TIMESTAMP_DIFF(${TABLE}.session_end, ${TABLE}.session_start, SECOND) ;;
  }

  dimension: session_duration_min {
    type: number
    sql: ${session_duration_sec} / 60.0 ;;
    value_format_name: decimal_1
  }

  measure: count {
    type: count
    drill_fields: [app_session_id, profile_id, device_type, session_start_time]
  }

  measure: distinct_sessions {
    type: count_distinct
    sql: ${app_session_id} ;;
  }

  measure: distinct_profiles {
    type: count_distinct
    sql: ${profile_id} ;;
  }

  measure: total_session_minutes {
    type: sum
    sql: ${session_duration_min} ;;
    value_format_name: decimal_0
  }

  measure: avg_session_minutes {
    type: average
    sql: ${session_duration_min} ;;
    value_format_name: decimal_1
  }
}
