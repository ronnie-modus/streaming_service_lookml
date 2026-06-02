view: title_genres {
  sql_table_name: `@{DATASET}.title_genres` ;;

  dimension: title_id {
    type: string
    sql: ${TABLE}.title_id ;;
  }

  dimension: genre_id {
    type: number
    sql: ${TABLE}.genre_id ;;
  }

  dimension: pk {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${title_id}, '-', CAST(${genre_id} AS STRING)) ;;
  }

  measure: count {
    type: count
  }
}
