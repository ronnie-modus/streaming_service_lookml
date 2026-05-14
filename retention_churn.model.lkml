connection: "@{CONNECTION_NAME}"

include: "/views/accounts.view.lkml"
include: "/views/cancels.view.lkml"
include: "/views/support_tickets.view.lkml"
include: "/views/offline_downloads.view.lkml"
include: "/views/billing.view.lkml"
include: "/views/profiles.view.lkml"

# ===================================================================
# Retention & Churn Model
# Who churns, how long they stayed, and which signals (support
# tickets, downloads, billing gaps) correlate with churn.
# ===================================================================

explore: retention {
  from: accounts
  view_name: accounts
  label: "Retention & Churn"
  description: "Account lifecycle joined to cancels, support tickets, and billing."

  join: cancels {
    type: left_outer
    relationship: one_to_one
    sql_on: ${accounts.account_id} = ${cancels.account_id} ;;
  }

  join: support_tickets {
    type: left_outer
    relationship: one_to_many
    sql_on: ${accounts.account_id} = ${support_tickets.account_id} ;;
  }

  join: billing {
    type: left_outer
    relationship: one_to_many
    sql_on: ${accounts.account_id} = ${billing.account_id} ;;
  }

  join: profiles {
    type: left_outer
    relationship: one_to_many
    sql_on: ${accounts.account_id} = ${profiles.account_id} ;;
  }

  join: offline_downloads {
    type: left_outer
    relationship: one_to_many
    sql_on: ${profiles.profile_id} = ${offline_downloads.profile_id} ;;
  }
}
