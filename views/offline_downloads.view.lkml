view: offline_downloads {
  sql_table_name: `@{DATASET}.offline_downloads` ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${profile_id}, '-', ${title_id}, '-', CAST(${TABLE}.download_date AS STRING)) ;;
  }

  dimension: profile_id {
    type: string
    sql: ${TABLE}.profile_id ;;
  }

  dimension: title_id {
    type: string
    sql: ${TABLE}.title_id ;;
  }

  dimension_group: download {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.download_date ;;
  }

  measure: count {
    type: count
  }

  measure: distinct_downloaders {
    type: count_distinct
    sql: ${profile_id} ;;
  }
}
