view: vw_content_catalog_summary {
  # Catalog composition by content type and release year.
  # Source: BigQuery view `streaming_service.vw_content_catalog_summary`.
  sql_table_name: `@{DATASET}.vw_content_catalog_summary` ;;

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
    description: "Movie or Series."
  }

  dimension: release_year {
    type: number
    sql: ${TABLE}.release_year ;;
  }

  dimension: title_count {
    type: number
    sql: ${TABLE}.title_count ;;
  }

  dimension: total_views {
    type: number
    sql: ${TABLE}.total_views ;;
  }

  dimension: avg_rating_score {
    type: number
    sql: ${TABLE}.avg_rating_score ;;
    value_format_name: decimal_3
    description: "Average user rating score (-1 to 1)."
  }

  dimension: total_ratings {
    type: number
    sql: ${TABLE}.total_ratings ;;
  }

  dimension: pct_of_catalog {
    type: number
    sql: ${TABLE}.pct_of_catalog ;;
    value_format_name: decimal_2
  }

  measure: count_buckets {
    type: count
    drill_fields: [type, release_year, title_count, total_views, avg_rating_score]
  }

  measure: sum_titles {
    type: sum
    sql: ${title_count} ;;
  }

  measure: sum_views {
    type: sum
    sql: ${total_views} ;;
  }

  measure: avg_rating {
    type: average
    sql: ${avg_rating_score} ;;
    value_format_name: decimal_3
  }

  measure: sum_ratings {
    type: sum
    sql: ${total_ratings} ;;
  }
}
