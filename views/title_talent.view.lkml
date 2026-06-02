view: title_talent {
  sql_table_name: `@{DATASET}.title_talent` ;;

  dimension: title_id {
    type: string
    sql: ${TABLE}.title_id ;;
  }

  dimension: talent_id {
    type: string
    sql: ${TABLE}.talent_id ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.role ;;
    description: "Actor, Director, Producer, Writer."
  }

  dimension: pk {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${title_id}, '-', ${talent_id}, '-', ${role}) ;;
  }

  measure: count {
    type: count
  }
}
