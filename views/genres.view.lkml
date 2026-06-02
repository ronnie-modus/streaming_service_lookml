view: genres {
  sql_table_name: `@{DATASET}.genres` ;;

  dimension: genre_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.genre_id ;;
  }

  dimension: genre_name {
    type: string
    sql: ${TABLE}.genre_name ;;
  }

  measure: count {
    type: count
  }
}
