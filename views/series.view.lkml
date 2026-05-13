view: series {
  sql_table_name: `@{DATASET}.series` ;;

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
  }

  dimension: release_year {
    type: number
    sql: ${TABLE}.release_year ;;
  }

  dimension: total_seasons {
    type: number
    sql: ${TABLE}.total_seasons ;;
  }

  measure: count {
    type: count
  }

  measure: avg_seasons {
    type: average
    sql: ${total_seasons} ;;
    value_format_name: decimal_2
  }
}
