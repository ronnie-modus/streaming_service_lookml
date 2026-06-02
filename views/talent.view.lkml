view: talent {
  sql_table_name: `@{DATASET}.talent` ;;

  dimension: talent_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.talent_id ;;
  }

  dimension: talent_name {
    type: string
    sql: ${TABLE}.talent_name ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  measure: count {
    type: count
  }
}
