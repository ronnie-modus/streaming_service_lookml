view: video_quality {
  sql_table_name: `@{DATASET}.video_quality` ;;

  dimension: video_quality_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.video_quality_id ;;
  }

  dimension: stream_id {
    type: string
    sql: ${TABLE}.stream_id ;;
    description: "Corresponds to watch.watch_session_id."
  }

  dimension: resolution {
    type: string
    sql: ${TABLE}.resolution ;;
    description: "480p, 720p, 1080p, 4K."
  }

  measure: count {
    type: count
  }
}
