view: vw_subscription_revenue {
  # Monthly subscription revenue by plan.
  # Source: BigQuery view `streaming_service.vw_subscription_revenue`.
  # Plan prices are hardcoded in the underlying view (Basic/Standard/Premium/Ultra).
  sql_table_name: `@{DATASET}.vw_subscription_revenue` ;;

  dimension_group: billing {
    type: time
    timeframes: [raw, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.billing_month ;;
    description: "Calendar month of the billing events."
  }

  dimension: plan_id {
    type: number
    sql: ${TABLE}.plan_id ;;
  }

  dimension: plan_name {
    type: string
    sql: ${TABLE}.plan_name ;;
  }

  dimension: plan_price_usd {
    type: number
    sql: ${TABLE}.plan_price_usd ;;
    value_format_name: usd
  }

  dimension: billing_events {
    type: number
    sql: ${TABLE}.billing_events ;;
  }

  dimension: billed_accounts {
    type: number
    sql: ${TABLE}.billed_accounts ;;
  }

  dimension: estimated_revenue_usd {
    type: number
    sql: ${TABLE}.estimated_revenue_usd ;;
    value_format_name: usd
  }

  measure: count {
    type: count
    drill_fields: [billing_month, plan_name, billing_events, estimated_revenue_usd]
  }

  measure: sum_billing_events {
    type: sum
    sql: ${billing_events} ;;
  }

  measure: sum_billed_accounts {
    type: sum
    sql: ${billed_accounts} ;;
    description: "Sum of billed accounts (not deduped across months)."
  }

  measure: total_revenue_usd {
    type: sum
    sql: ${estimated_revenue_usd} ;;
    value_format_name: usd
  }

  measure: avg_revenue_per_event {
    type: number
    sql: SAFE_DIVIDE(SUM(${estimated_revenue_usd}), SUM(${billing_events})) ;;
    value_format_name: usd
  }
}
