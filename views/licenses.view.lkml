view: licenses {
  sql_table_name: `@{DATASET}.licenses` ;;

  dimension: title_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.title_id ;;
  }

  dimension: cost_usd {
    type: number
    sql: ${TABLE}.cost_usd ;;
    value_format_name: usd_0
  }

  dimension_group: license_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.license_start ;;
  }

  dimension_group: license_end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.license_end ;;
  }

  dimension: license_length_days {
    type: number
    sql: DATE_DIFF(DATE(${TABLE}.license_end), DATE(${TABLE}.license_start), DAY) ;;
  }

  measure: count {
    type: count
  }

  measure: total_cost_usd {
    type: sum
    sql: ${cost_usd} ;;
    value_format_name: usd_0
  }

  measure: avg_cost_usd {
    type: average
    sql: ${cost_usd} ;;
    value_format_name: usd_0
  }
}
