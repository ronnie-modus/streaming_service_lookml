connection: "@{CONNECTION_NAME}"

include: "/views/ab_experiments.view.lkml"
include: "/views/ab_assignments.view.lkml"
include: "/views/feature_rollouts.view.lkml"
include: "/views/features.view.lkml"
include: "/views/features_logs.view.lkml"
include: "/views/profiles.view.lkml"
include: "/views/watch.view.lkml"

# ===================================================================
# Product Experiments Model
# A/B experiments, feature rollouts, and feature usage logs.
# ===================================================================

explore: experiments {
  from: ab_experiments
  view_name: ab_experiments
  label: "A/B Experiments"
  description: "Experiments with variant assignments and downstream watch behaviour."

  join: ab_assignments {
    type: left_outer
    relationship: one_to_many
    sql_on: ${ab_experiments.experiment_id} = ${ab_assignments.experiment_id} ;;
  }

  join: profiles {
    type: left_outer
    relationship: many_to_one
    sql_on: ${ab_assignments.profile_id} = ${profiles.profile_id} ;;
  }

  join: watch {
    type: left_outer
    relationship: one_to_many
    sql_on: ${ab_assignments.profile_id} = ${watch.profile_id} ;;
  }
}

explore: feature_rollouts {
  label: "Feature Rollouts"

  join: features {
    type: left_outer
    relationship: many_to_one
    sql_on: ${feature_rollouts.feature_id} = ${features.feature_id} ;;
  }
}

explore: features_logs {
  label: "Feature Usage"

  join: features {
    type: left_outer
    relationship: many_to_one
    sql_on: ${features_logs.feature_id} = ${features.feature_id} ;;
  }
}
