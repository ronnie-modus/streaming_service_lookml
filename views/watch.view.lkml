view: watch {
  # Actual video playback sessions.
  sql_table_name: `@{DATASET}.watch` ;;

  dimension: watch_session_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.watch_session_id ;;
  }

  dimension: app_session_id {
    type: string
    sql: ${TABLE}.app_session_id ;;
  }

  dimension: profile_id {
    type: string
    sql: ${TABLE}.profile_id ;;
  }

  dimension: title_id {
    type: string
    sql: ${TABLE}.title_id ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
  }

  dimension: watch_duration_sec {
    type: number
    sql: ${TABLE}.watch_duration_sec ;;
  }

  dimension: watch_duration_min {
    type: number
    sql: ${TABLE}.watch_duration_sec / 60.0 ;;
    value_format_name: decimal_1
  }

  dimension: watch_duration_hours {
    type: number
    sql: ${TABLE}.watch_duration_sec / 3600.0 ;;
    value_format_name: decimal_2
  }

  dimension_group: session_start {
    type: time
    timeframes: [raw, time, hour_of_day, date, week, month, quarter, year]
    sql: ${TABLE}.session_start ;;
  }

  dimension_group: session_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.session_end ;;
  }

  measure: count {
    type: count
    drill_fields: [watch_session_id, title_id, profile_id, watch_duration_min, session_start_date]
  }

  measure: distinct_watch_sessions {
    type: count_distinct
    sql: ${watch_session_id} ;;
  }

  measure: distinct_viewers {
    type: count_distinct
    sql: ${profile_id} ;;
  }

  measure: total_watch_hours {
    type: sum
    sql: ${watch_duration_hours} ;;
    value_format_name: decimal_0
  }

  measure: avg_watch_minutes {
    type: average
    sql: ${watch_duration_min} ;;
    value_format_name: decimal_1
  }
}
