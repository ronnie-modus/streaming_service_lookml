view: plans {
  sql_table_name: `@{DATASET}.plans` ;;

  dimension: plan_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.plan_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    description: "Basic, Standard, Premium, Ad-Supported."
  }

  measure: count {
    type: count
  }
}
