view: accounts {
  # Derived from the original plan's accounts table (billing entity).
  # The marketing table is the closest materialized equivalent in BigQuery:
  # it has one row per account with account_id, creation_date and channel.
  sql_table_name: `@{DATASET}.marketing` ;;

  dimension: account_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.account_id ;;
    description: "Unique identifier for a billing account."
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
    description: "Acquisition channel for this account (Google Ads, TikTok, etc.)."
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.creation_date ;;
    description: "When the account was created."
  }

  measure: count {
    type: count
    drill_fields: [account_id, channel, created_date]
  }

  measure: distinct_accounts {
    type: count_distinct
    sql: ${account_id} ;;
  }
}
