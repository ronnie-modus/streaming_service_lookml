view: profiles {
  sql_table_name: `@{DATASET}.profiles` ;;

  dimension: profile_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.profile_id ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  measure: count {
    type: count
  }

  measure: distinct_profiles {
    type: count_distinct
    sql: ${profile_id} ;;
  }

  measure: distinct_accounts {
    type: count_distinct
    sql: ${account_id} ;;
  }
}
