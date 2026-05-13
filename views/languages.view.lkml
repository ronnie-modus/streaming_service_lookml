view: languages {
  sql_table_name: `@{DATASET}.languages` ;;

  dimension: title_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.title_id ;;
  }

  dimension: audio_languages {
    type: string
    sql: ARRAY_TO_STRING(${TABLE}.audio_languages, ', ') ;;
    description: "Audio tracks available (ISO 639-1 codes)."
  }

  dimension: subtitle_languages {
    type: string
    sql: ARRAY_TO_STRING(${TABLE}.subtitle_languages, ', ') ;;
  }

  measure: count {
    type: count
  }
}
