connection: "@{CONNECTION_NAME}"

include: "/views/sessions.view.lkml"
include: "/views/watch.view.lkml"
include: "/views/ui.view.lkml"
include: "/views/titles.view.lkml"
include: "/views/profiles.view.lkml"
include: "/views/accounts.view.lkml"
include: "/views/episodes.view.lkml"

# ===================================================================
# Engagement Model
# How users interact with the product: app sessions, watch sessions,
# and UI events (e.g., Skip Intro clicks).
# ===================================================================

explore: sessions {
  label: "App Sessions"
  description: "Overall app sessions with joins to profiles/accounts and UI events."

  join: profiles {
    type: left_outer
    relationship: many_to_one
    sql_on: ${sessions.profile_id} = ${profiles.profile_id} ;;
  }

  join: accounts {
    type: left_outer
    relationship: many_to_one
    sql_on: ${profiles.account_id} = ${accounts.account_id} ;;
  }

  join: ui {
    type: left_outer
    relationship: one_to_many
    sql_on: ${sessions.app_session_id} = ${ui.app_session_id} ;;
  }
}

explore: watch {
  label: "Watch Sessions"
  description: "Video playback sessions; drill into titles and viewers."

  join: titles {
    type: left_outer
    relationship: many_to_one
    sql_on: ${watch.title_id} = ${titles.title_id} ;;
  }

  join: profiles {
    type: left_outer
    relationship: many_to_one
    sql_on: ${watch.profile_id} = ${profiles.profile_id} ;;
  }

  join: accounts {
    type: left_outer
    relationship: many_to_one
    sql_on: ${profiles.account_id} = ${accounts.account_id} ;;
  }

  join: sessions {
    type: left_outer
    relationship: many_to_one
    sql_on: ${watch.app_session_id} = ${sessions.app_session_id} ;;
  }
}

explore: ui_events {
  from: ui
  view_name: ui
  label: "UI Events (Skip Intro)"
  description: "Use this for the Skip Intro UI-bug analysis (time_to_click_sec)."

  join: sessions {
    type: left_outer
    relationship: many_to_one
    sql_on: ${ui.app_session_id} = ${sessions.app_session_id} ;;
  }

  join: profiles {
    type: left_outer
    relationship: many_to_one
    sql_on: ${ui.profile_id} = ${profiles.profile_id} ;;
  }
}
