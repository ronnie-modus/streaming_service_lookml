view: ratings {
  sql_table_name: `@{DATASET}.ratings` ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${profile_id}, '-', ${title_id}) ;;
  }

  dimension: profile_id {
    type: string
    sql: ${TABLE}.profile_id ;;
  }

  dimension: title_id {
    type: string
    sql: ${TABLE}.title_id ;;
  }

  dimension: rating {
    type: number
    sql: ${TABLE}.rating ;;
    description: "1 = thumbs up, -1 = thumbs down."
  }

  dimension: rating_label {
    type: string
    sql: CASE WHEN ${rating} = 1 THEN 'Thumbs Up'
              WHEN ${rating} = -1 THEN 'Thumbs Down'
              ELSE 'Neutral' END ;;
  }

  measure: count {
    type: count
  }

  measure: thumbs_up_count {
    type: count
    filters: [rating: "1"]
  }

  measure: thumbs_down_count {
    type: count
    filters: [rating: "-1"]
  }

  measure: avg_rating {
    type: average
    sql: ${rating} ;;
    value_format_name: decimal_2
  }
}
