view: vw_user_engagement_daily {
  # Daily aggregated engagement metrics: DAUs, sessions, watch time.
  # Source: BigQuery view `streaming_service.vw_ser_engagement_daily`.
  # Filtered to data up to CURRENT_TIMESTAMP() in the underlying view.
  sql_table_name: `@{DATASET}.vw_user_engagement_daily` ;;

  dimension_group: activity {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.activity_date ;;
    description: "Calendar date of the engagement metrics."
  }
}
