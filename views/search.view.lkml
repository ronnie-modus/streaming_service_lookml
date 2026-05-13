view: search {
  sql_table_name: `@{DATASET}.search` ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${profile_id}, '-', ${search_query}) ;;
  }

  dimension: profile_id {
    type: string
    sql: ${TABLE}.profile_id ;;
  }

  dimension: search_query {
    type: string
    sql: ${TABLE}.search_query ;;
  }

  measure: count {
    type: count
  }

  measure: distinct_searchers {
    type: count_distinct
    sql: ${profile_id} ;;
  }
}
