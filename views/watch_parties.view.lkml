view: watch_parties {
  sql_table_name: `@{DATASET}.watch_parties` ;;

  dimension: party_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.party_id ;;
  }

  dimension_group: started {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.start_time ;;
  }

  measure: count {
    type: count
  }

  measure: distinct_parties {
    type: count_distinct
    sql: ${party_id} ;;
  }
}
