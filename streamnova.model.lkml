connection: "@{CONNECTION_NAME}"

# Include all the views
include: "/views/**/*.view.lkml"

label: "StreamNova - Streaming Service Analytics"

datagroup: streamnova_default_datagroup {
  sql_trigger: SELECT MAX(session_start) FROM `@{DATASET}.sessions` ;;
  max_cache_age: "12 hours"
}

persist_with: streamnova_default_datagroup

################################################################
# Core Explore: App Sessions (Engagement)
################################################################
explore: sessions {
  label: "App Sessions & Engagement"
  description: "Overarching app usage sessions. Join to watch sessions, UI events, profiles, accounts."

  join: profiles {
    type: left_outer
    relationship: many_to_one
    sql_on: ${sessions.profile_id} = ${profiles.profile_id} ;;
  }

  join: accounts {
    type: left_outer
    relationship: many_to_one
    sql_on: ${profiles.account_id} = ${accounts.account_id} ;;
    view_label: "Account"
  }

  join: watch {
    type: left_outer
    relationship: one_to_many
    sql_on: ${sessions.app_session_id} = ${watch.app_session_id} ;;
  }

  join: ui {
    type: left_outer
    relationship: one_to_many
    sql_on: ${sessions.app_session_id} = ${ui.app_session_id} ;;
  }

  join: titles {
    type: left_outer
    relationship: many_to_one
    sql_on: ${watch.title_id} = ${titles.title_id} ;;
  }

  join: title_genres {
    type: left_outer
    relationship: one_to_many
    sql_on: ${titles.title_id} = ${title_genres.title_id} ;;
  }

  join: genres {
    type: left_outer
    relationship: many_to_one
    sql_on: ${title_genres.genre_id} = ${genres.genre_id} ;;
  }
}

################################################################
# Watch (Playback) explore
################################################################
explore: watch {
  label: "Watch Sessions (Playback)"
  description: "Actual video playback events. Core of the Content ROI / engagement analyses."

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

  join: titles {
    type: left_outer
    relationship: many_to_one
    sql_on: ${watch.title_id} = ${titles.title_id} ;;
  }

  join: title_genres {
    type: left_outer
    relationship: one_to_many
    sql_on: ${titles.title_id} = ${title_genres.title_id} ;;
  }

  join: genres {
    type: left_outer
    relationship: many_to_one
    sql_on: ${title_genres.genre_id} = ${genres.genre_id} ;;
  }

  join: licenses {
    type: left_outer
    relationship: many_to_one
    sql_on: ${watch.title_id} = ${licenses.title_id} ;;
  }

  join: video_quality {
    type: left_outer
    relationship: one_to_one
    sql_on: ${watch.watch_session_id} = ${video_quality.stream_id} ;;
  }
}

################################################################
# Accounts (Subscribers, Churn, Revenue)
################################################################
explore: accounts {
  label: "Accounts & Subscribers"
  description: "Billing-level view of users, partnerships, marketing acquisition and support."

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

  join: marketing {
    type: left_outer
    relationship: one_to_one
    sql_on: ${accounts.account_id} = ${marketing.account_id} ;;
  }

  join: partnerships {
    type: left_outer
    relationship: one_to_one
    sql_on: ${accounts.account_id} = ${partnerships.account_id} ;;
  }

  join: support_tickets {
    type: left_outer
    relationship: one_to_many
    sql_on: ${accounts.account_id} = ${support_tickets.account_id} ;;
  }
}

################################################################
# Titles (Content catalog)
################################################################
explore: titles {
  label: "Content Catalog"
  description: "Catalog of movies and shows, with genres, talent, licenses and languages."

  join: title_genres {
    type: left_outer
    relationship: one_to_many
    sql_on: ${titles.title_id} = ${title_genres.title_id} ;;
  }

  join: genres {
    type: left_outer
    relationship: many_to_one
    sql_on: ${title_genres.genre_id} = ${genres.genre_id} ;;
  }

  join: title_talent {
    type: left_outer
    relationship: one_to_many
    sql_on: ${titles.title_id} = ${title_talent.title_id} ;;
  }

  join: talent {
    type: left_outer
    relationship: many_to_one
    sql_on: ${title_talent.talent_id} = ${talent.talent_id} ;;
  }

  join: licenses {
    type: left_outer
    relationship: one_to_one
    sql_on: ${titles.title_id} = ${licenses.title_id} ;;
  }

  join: languages {
    type: left_outer
    relationship: one_to_one
    sql_on: ${titles.title_id} = ${languages.title_id} ;;
  }

  join: series {
    type: left_outer
    relationship: one_to_one
    sql_on: ${titles.title_id} = ${series.title_id} ;;
  }
}

################################################################
# Watch Parties
################################################################
explore: watch_parties {
  label: "Watch Parties"
  description: "Co-viewing events and attendee engagement (emojis sent)."

  join: wp_attendees {
    type: left_outer
    relationship: one_to_many
    sql_on: ${watch_parties.party_id} = ${wp_attendees.party_id} ;;
  }

  join: profiles {
    type: left_outer
    relationship: many_to_one
    sql_on: ${wp_attendees.profile_id} = ${profiles.profile_id} ;;
  }
}

################################################################
# Search
################################################################
explore: search {
  label: "Search Queries"

  join: profiles {
    type: left_outer
    relationship: many_to_one
    sql_on: ${search.profile_id} = ${profiles.profile_id} ;;
  }
}

################################################################
# Ratings
################################################################
explore: ratings {
  label: "User Ratings"

  join: titles {
    type: left_outer
    relationship: many_to_one
    sql_on: ${ratings.title_id} = ${titles.title_id} ;;
  }

  join: profiles {
    type: left_outer
    relationship: many_to_one
    sql_on: ${ratings.profile_id} = ${profiles.profile_id} ;;
  }
}

################################################################
# Offline Downloads
################################################################
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

################################################################
# Watchlists
################################################################
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
}

################################################################
# Support Tickets
################################################################
explore: support_tickets {
  label: "Support Tickets"

  join: accounts {
    type: left_outer
    relationship: many_to_one
    sql_on: ${support_tickets.account_id} = ${accounts.account_id} ;;
  }
}

################################################################
# Feature Rollouts
################################################################
explore: feature_rollouts {
  label: "Feature Rollouts"
}
