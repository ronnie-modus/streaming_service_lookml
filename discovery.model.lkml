connection: "@{CONNECTION_NAME}"

include: "/views/search.view.lkml"
include: "/views/watchlists.view.lkml"
include: "/views/offline_downloads.view.lkml"
include: "/views/profiles.view.lkml"
include: "/views/titles.view.lkml"
include: "/views/watch.view.lkml"

# ===================================================================
# Discovery Model
# How users find and queue up content: searches, watchlists, and
# offline downloads, with optional join to watch to measure
# discovery-to-play conversion.
# ===================================================================

explore: search {
  label: "Search"
  description: "Queries entered by profiles; useful for intent analysis."

  join: profiles {
    type: left_outer
    relationship: many_to_one
    sql_on: ${search.profile_id} = ${profiles.profile_id} ;;
  }
}

explore: watchlists {
  label: "Watchlists"

  join: titles {
    type: left_outer
    relationship: many_to_one
    sql_on: ${watchlists.title_id} = ${titles.title_id} ;;
  }

  join: profiles {
    type: left_outer
    relationship: many_to_one
    sql_on: ${watchlists.profile_id} = ${profiles.profile_id} ;;
  }

  join: watch {
    type: left_outer
    relationship: one_to_many
    sql_on: ${watchlists.profile_id} = ${watch.profile_id}
        AND ${watchlists.title_id}   = ${watch.title_id} ;;
  }
}

explore: offline_downloads {
  label: "Offline Downloads"

  join: titles {
    type: left_outer
    relationship: many_to_one
    sql_on: ${offline_downloads.title_id} = ${titles.title_id} ;;
  }

  join: profiles {
    type: left_outer
    relationship: many_to_one
    sql_on: ${offline_downloads.profile_id} = ${profiles.profile_id} ;;
  }
}
