view: vw_ad_campaign_performance {
  # Per-campaign ad performance: impressions, skip rate, estimated revenue.
  # Source: BigQuery view `streaming_service.vw_ad_campaign_performance`.
  sql_table_name: `@{DATASET}.vw_ad_campaign_performance` ;;

  dimension: campaign_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: cpm {
    type: number
    sql: ${TABLE}.cpm ;;
    value_format_name: usd
    description: "Cost per thousand impressions."
  }

  dimension: total_impressions {
    type: number
    sql: ${TABLE}.total_impressions ;;
  }

  dimension: skipped_impressions {
    type: number
    sql: ${TABLE}.skipped_impressions ;;
  }

  dimension: viewable_impressions {
    type: number
    sql: ${TABLE}.viewable_impressions ;;
  }

  dimension: skip_rate_pct {
    type: number
    sql: ${TABLE}.skip_rate_pct ;;
    value_format_name: decimal_2
  }

  dimension: view_rate_pct {
    type: number
    sql: ${TABLE}.view_rate_pct ;;
    value_format_name: decimal_2
  }

  dimension: estimated_revenue_usd {
    type: number
    sql: ${TABLE}.estimated_revenue_usd ;;
    value_format_name: usd
  }

  measure: count {
    type: count
    drill_fields: [campaign_id, brand, total_impressions, skip_rate_pct, estimated_revenue_usd]
  }

  measure: sum_impressions {
    type: sum
    sql: ${total_impressions} ;;
  }

  measure: sum_viewable_impressions {
    type: sum
    sql: ${viewable_impressions} ;;
  }

  measure: sum_skipped_impressions {
    type: sum
    sql: ${skipped_impressions} ;;
  }

  measure: total_revenue_usd {
    type: sum
    sql: ${estimated_revenue_usd} ;;
    value_format_name: usd
  }

  measure: avg_skip_rate {
    type: average
    sql: ${skip_rate_pct} ;;
    value_format_name: decimal_2
  }

  measure: portfolio_skip_rate {
    type: number
    sql: SAFE_DIVIDE(SUM(${skipped_impressions}), SUM(${total_impressions})) * 100 ;;
    value_format_name: decimal_2
    description: "Skip rate computed across all selected campaigns."
  }
}
