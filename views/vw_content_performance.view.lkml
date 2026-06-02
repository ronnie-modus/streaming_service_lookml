view: vw_content_performance {
  # Per-title performance: views, viewers, watch time, ratings & approval.
  # Source: BigQuery view `streaming_service.vw_content_performance`.
  sql_table_name: `@{DATASET}.vw_content_performance` ;;

  dimension: title_id {
    primary_key: yes
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
    description: "Movie or Series."
  }

  dimension: release_year {
    type: number
    sql: ${TABLE}.release_year ;;
  }

  dimension: total_views {
    type: number
    sql: ${TABLE}.total_views ;;
  }

  dimension: unique_viewers {
    type: number
    sql: ${TABLE}.unique_viewers ;;
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

  dimension: positive_ratings {
    type: number
    sql: ${TABLE}.positive_ratings ;;
  }

  dimension: negative_ratings {
    type: number
    sql: ${TABLE}.negative_ratings ;;
  }

  dimension: total_ratings {
    type: number
    sql: ${TABLE}.total_ratings ;;
  }

  dimension: approval_pct {
    type: number
    sql: ${TABLE}.approval_pct ;;
    value_format_name: decimal_2
    description: "Positive ratings as a percent of total ratings."
  }

  measure: count {
    type: count
    drill_fields: [title_id, title_name, type, release_year, total_views, approval_pct]
  }

  measure: sum_views {
    type: sum
    sql: ${total_views} ;;
  }

  measure: sum_unique_viewers {
    type: sum
    sql: ${unique_viewers} ;;
    description: "Sum of unique viewers per title (note: not deduped across titles)."
  }

  measure: sum_watch_hours {
    type: sum
    sql: ${total_watch_hours} ;;
    value_format_name: decimal_0
  }

  measure: avg_approval_pct {
    type: average
    sql: ${approval_pct} ;;
    value_format_name: decimal_2
  }
}
