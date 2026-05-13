view: watchlists {
  sql_table_name: `@{DATASET}.watchlists` ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${profile_id}, '-', ${title_id}) ;;
  }

  dimension: profile_id {
    type: string
    sql: ${TABLE}.profile_id ;;
  }

  dimension: title_id {
    type: string
    sql: ${TABLE}.title_id ;;
  }

  measure: count {
    type: count
  }

  measure: distinct_watchlisters {
    type: count_distinct
    sql: ${profile_id} ;;
  }
}
