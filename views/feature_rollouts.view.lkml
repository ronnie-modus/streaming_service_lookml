view: feature_rollouts {
  sql_table_name: `@{DATASET}.feature_rollouts` ;;

  dimension: rollout_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.rollout_id ;;
  }

  dimension: feature_id {
    type: string
    sql: ${TABLE}.feature_id ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
    description: "EMEA, Global, North America."
  }

  dimension: rollout_pct {
    type: number
    sql: ${TABLE}.rollout_pct ;;
  }

  measure: count {
    type: count
  }

  measure: avg_rollout_pct {
    type: average
    sql: ${rollout_pct} ;;
    value_format_name: decimal_1
  }
}
