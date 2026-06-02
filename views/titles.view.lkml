view: titles {
  sql_table_name: `@{DATASET}.titles` ;;

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

  measure: count {
    type: count
    drill_fields: [title_id, title_name, type, release_year]
  }

  measure: distinct_titles {
    type: count_distinct
    sql: ${title_id} ;;
  }
}
