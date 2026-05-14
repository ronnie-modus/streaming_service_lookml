connection: "@{CONNECTION_NAME}"

include: "/views/accounts.view.lkml"
include: "/views/profiles.view.lkml"
include: "/views/plans.view.lkml"
include: "/views/payment_methods.view.lkml"
include: "/views/devices.view.lkml"
include: "/views/billing.view.lkml"

# ===================================================================
# Subscribers Model
# Account-level view of who subscribers are: profiles per account,
# plans, payment methods, and registered devices.
# ===================================================================

explore: accounts {
  label: "Subscribers"
  description: "One row per account with profiles, plan, payment method, and devices."

  join: profiles {
    type: left_outer
    relationship: one_to_many
    sql_on: ${accounts.account_id} = ${profiles.account_id} ;;
  }

  join: payment_methods {
    type: left_outer
    relationship: one_to_many
    sql_on: ${accounts.account_id} = ${payment_methods.account_id} ;;
  }

  join: devices {
    type: left_outer
    relationship: one_to_many
    sql_on: ${accounts.account_id} = ${devices.account_id} ;;
  }

  join: billing {
    type: left_outer
    relationship: one_to_many
    sql_on: ${accounts.account_id} = ${billing.account_id} ;;
  }

  join: plans {
    type: left_outer
    relationship: many_to_one
    sql_on: ${billing.plan_id} = ${plans.plan_id} ;;
  }
}
