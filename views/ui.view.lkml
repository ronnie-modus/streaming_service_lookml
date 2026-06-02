view: ui {
  sql_table_name: `@{DATASET}.ui` ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${app_session_id}, '-', ${profile_id}, '-', CAST(${TABLE}.session_start AS STRING)) ;;
  }

  dimension: app_session_id {
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
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
    description: "Currently just Click_Skip_Intro."
  }

  dimension: time_to_click_sec {
    type: number
    sql: ${TABLE}.time_to_click_sec ;;
    description: "Seconds from session start to the UI click event."
  }

  dimension_group: session_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.session_start ;;
  }

  dimension_group: session_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.session_end ;;
  }

  measure: count {
    type: count
  }

  measure: avg_time_to_click_sec {
    type: average
    sql: ${time_to_click_sec} ;;
    value_format_name: decimal_2
    description: "Average seconds to Skip Intro. Used for the Q2/Q3 2026 UI bug analysis."
  }

  measure: median_time_to_click_sec {
    type: median
    sql: ${time_to_click_sec} ;;
    value_format_name: decimal_2
  }
}
