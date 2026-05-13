view: partnerships {
  sql_table_name: `@{DATASET}.partnerships` ;;

  dimension: account_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: partner_name {
    type: string
    sql: ${TABLE}.partner_name ;;
    description: "Samsung TV Bundle, T-Mobile, Verizon."
  }

  measure: count {
    type: count
  }

  measure: partnered_accounts {
    type: count_distinct
    sql: ${account_id} ;;
  }
}
