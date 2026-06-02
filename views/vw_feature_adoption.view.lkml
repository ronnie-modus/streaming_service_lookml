view: vw_feature_adoption {
  # Daily feature usage with day-over-day change and 30-day rolling totals.
  # Source: BigQuery view `streaming_service.vw_feature_adoption`.
  sql_table_name: `@{DATASET}.vw_feature_adoption` ;;

  dimension_group: activity {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.activity_date ;;
  }

  dimension: feature_id {
    type: string
    sql: ${TABLE}.feature_id ;;
  }

  dimension: feature_name {
    type: string
    sql: ${TABLE}.feature_name ;;
  }

  dimension: usage_count {
    type: number
    sql: ${TABLE}.usage_count ;;
  }

  dimension: prev_day_usage {
    type: number
    sql: ${TABLE}.prev_day_usage ;;
  }

  dimension: dod_change_pct {
    type: number
    sql: ${TABLE}.dod_change_pct ;;
    value_format_name: decimal_2
    description: "Day-over-day change in usage_count (%)."
  }

  dimension: rolling_30d_usage {
    type: number
    sql: ${TABLE}.rolling_30d_usage ;;
    description: "Rolling 30-day usage total (per feature)."
  }

  measure: count {
    type: count
    drill_fields: [activity_date, feature_name, usage_count, dod_change_pct]
  }

  measure: sum_usage {
    type: sum
    sql: ${usage_count} ;;
  }

  measure: avg_daily_usage {
    type: average
    sql: ${usage_count} ;;
    value_format_name: decimal_2
  }

  measure: avg_dod_change_pct {
    type: average
    sql: ${dod_change_pct} ;;
    value_format_name: decimal_2
  }
}
