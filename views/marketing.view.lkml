view: marketing {
  sql_table_name: `@{DATASET}.marketing` ;;

  dimension: account_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
    description: "Acquisition channel (Google Ads, Meta Ads, Organic - Viral, Partnerships, TikTok)."
  }

  dimension_group: acquired {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.creation_date ;;
  }

  measure: count {
    type: count
  }

  measure: acquisitions {
    type: count_distinct
    sql: ${account_id} ;;
    description: "Distinct accounts acquired."
  }
}
