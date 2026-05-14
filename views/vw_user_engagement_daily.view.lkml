view: vw_user_engagement_daily {
  # Daily aggregated engagement metrics: DAUs, sessions, watch time.
  # Source: BigQuery view `streaming_service.vw_user_engagement_daily`.
  # Filtered to data up to CURRENT_TIMESTAMP() in the underlying view.
  sql_table_name: `@{DATASET}.vw_user_engagement_daily` ;;

  dimension_group: activity {
    type: time
    timeframes: [raw, date, day_of_week, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.activity_date ;;
    description: "Calendar date of the engagement metrics."
  }

  dimension: daily_active_profiles {
    type: number
    sql: ${TABLE}.daily_active_profiles ;;
    description: "Distinct profiles active on this date."
  }

  dimension: total_sessions {
    type: number
    sql: ${TABLE}.total_sessions ;;
  }

  dimension: total_watch_hours {
    type: number
    sql: ${TABLE}.total_watch_hours ;;
    value_format_name: decimal_2
  }

  dimension: avg_session_minutes {
    type: number
    sql: ${TABLE}.avg_session_minutes ;;
    value_format_name: decimal_2
  }

  dimension: total_watch_seconds {
    type: number
    sql: ${TABLE}.total_watch_seconds ;;
    hidden: yes
  }

  measure: count_days {
    type: count
    drill_fields: [activity_date, daily_active_profiles, total_sessions, total_watch_hours]
  }

  measure: sum_daily_active_profiles {
    type: sum
    sql: ${daily_active_profiles} ;;
    description: "Sum of DAUs across the selected date range (note: not deduped across days)."
  }

  measure: avg_daily_active_profiles {
    type: average
    sql: ${daily_active_profiles} ;;
    value_format_name: decimal_0
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

  measure: avg_avg_session_minutes {
    type: average
    sql: ${avg_session_minutes} ;;
    value_format_name: decimal_2
    label: "Avg Session Minutes"
  }
}
