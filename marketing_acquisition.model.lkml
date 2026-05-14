connection: "@{CONNECTION_NAME}"

include: "/views/marketing.view.lkml"
include: "/views/partnerships.view.lkml"
include: "/views/accounts.view.lkml"
include: "/views/billing.view.lkml"
include: "/views/cancels.view.lkml"

# ===================================================================
# Marketing Acquisition Model
# Channel and partner-level acquisition: where accounts come from,
# and how they pay back through billing events.
# ===================================================================

explore: marketing {
  label: "Acquisition by Channel"
  description: "Accounts acquired through each marketing channel."

  join: accounts {
    type: left_outer
    relationship: one_to_one
    sql_on: ${marketing.account_id} = ${accounts.account_id} ;;
  }

  join: billing {
    type: left_outer
    relationship: one_to_many
    sql_on: ${marketing.account_id} = ${billing.account_id} ;;
  }

  join: cancels {
    type: left_outer
    relationship: one_to_one
    sql_on: ${marketing.account_id} = ${cancels.account_id} ;;
  }
}

explore: partnerships {
  label: "Partner Bundles"
  description: "Accounts acquired/retained through partner bundles (T-Mobile, Verizon, Samsung)."

  join: accounts {
    type: left_outer
    relationship: one_to_one
    sql_on: ${partnerships.account_id} = ${accounts.account_id} ;;
  }

  join: billing {
    type: left_outer
    relationship: one_to_many
    sql_on: ${partnerships.account_id} = ${billing.account_id} ;;
  }

  join: cancels {
    type: left_outer
    relationship: one_to_one
    sql_on: ${partnerships.account_id} = ${cancels.account_id} ;;
  }
}
