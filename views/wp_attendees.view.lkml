view: wp_attendees {
  sql_table_name: `@{DATASET}.wp_attendees` ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${party_id}, '-', ${profile_id}) ;;
  }

  dimension: party_id {
    type: string
    sql: ${TABLE}.party_id ;;
  }

  dimension: profile_id {
    type: string
    sql: ${TABLE}.profile_id ;;
  }

  dimension: emojis_sent {
    type: number
    sql: ${TABLE}.emojis_sent ;;
  }

  measure: count {
    type: count
  }

  measure: total_emojis {
    type: sum
    sql: ${emojis_sent} ;;
  }

  measure: avg_emojis_per_attendee {
    type: average
    sql: ${emojis_sent} ;;
    value_format_name: decimal_1
  }

  measure: distinct_attendees {
    type: count_distinct
    sql: ${profile_id} ;;
  }
}
