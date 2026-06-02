view: support_tickets {
  sql_table_name: `@{DATASET}.support_tickets` ;;

  dimension: ticket_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ticket_id ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: issue_category {
    type: string
    sql: ${TABLE}.issue_category ;;
    description: "Billing, Login Issue, Streaming Bug."
  }

  dimension_group: opened {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.open_date ;;
  }

  measure: count {
    type: count
  }
}
