view: payment_methods {
  sql_table_name: `@{DATASET}.payment_methods` ;;

  dimension: payment_method_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.payment_method_id ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}.payment_type ;;
    description: "Apple Pay, Credit Card, PayPal."
  }

  measure: count {
    type: count
  }
}
