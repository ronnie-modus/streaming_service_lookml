view: vw_account_lifecycle {
  # Per-account lifecycle: cohort, engagement, billing, retention flag.
  # Source: BigQuery view `streaming_service.vw_account_lifecycle`.
  # is_active_30d is anchored to CURRENT_TIMESTAMP() in the underlying view.
  sql_table_name: `@{DATASET}.vw_account_lifecycle` ;;

  dimension: account_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.creation_date ;;
    description: "When the account was created."
  }

  dimension_group: signup_cohort {
    type: time
    timeframes: [raw, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.signup_cohort_month ;;
    description: "Signup month for cohort analysis."
  }

  dimension: profile_count {
    type: number
    sql: ${TABLE}.profile_count ;;
  }

  dimension_group: first_watch {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.first_watch_date ;;
  }

  dimension_group: last_watch {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_watch_date ;;
  }

  dimension: total_sessions {
    type: number
    sql: ${TABLE}.total_sessions ;;
  }

  dimension: total_watch_hours {
    type: number
    sql: ${TABLE}.total_watch_hours ;;
    value_format_name: decimal_2
  }

  dimension: total_billings {
    type: number
    sql: ${TABLE}.total_billings ;;
  }

  dimension_group: first_billing {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.first_billing_date ;;
  }

  dimension_group: last_billing {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_billing_date ;;
  }

  dimension: days_active_since_signup {
    type: number
    sql: ${TABLE}.days_active_since_signup ;;
    description: "Days between account creation and last watch."
  }

  dimension: is_active_30d {
    type: yesno
    sql: ${TABLE}.is_active_30d ;;
    description: "Account had a watch session in the last 30 days (anchored to today)."
  }

  measure: count {
    type: count
    drill_fields: [account_id, created_date, profile_count, total_sessions, is_active_30d]
  }

  measure: count_active_30d {
    type: count
    filters: [is_active_30d: "yes"]
  }

  measure: pct_active_30d {
    type: number
    sql: SAFE_DIVIDE(${count_active_30d}, ${count}) * 100 ;;
    value_format_name: decimal_2
  }

  measure: sum_profiles {
    type: sum
    sql: ${profile_count} ;;
  }

  measure: sum_watch_hours {
    type: sum
    sql: ${total_watch_hours} ;;
    value_format_name: decimal_0
  }

  measure: avg_watch_hours_per_account {
    type: average
    sql: ${total_watch_hours} ;;
    value_format_name: decimal_2
  }
}
