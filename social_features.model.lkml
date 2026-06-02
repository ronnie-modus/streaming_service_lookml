connection: "@{CONNECTION_NAME}"

include: "/views/watch_parties.view.lkml"
include: "/views/wp_attendees.view.lkml"
include: "/views/ratings.view.lkml"
include: "/views/profiles.view.lkml"
include: "/views/titles.view.lkml"

# ===================================================================
# Social Features Model
# Watch parties, attendee engagement (emojis sent), and thumbs
# up/down ratings behaviour.
# ===================================================================

explore: watch_parties {
  label: "Watch Parties"
  description: "Scheduled group viewing sessions with attendee engagement."

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

explore: ratings {
  label: "Thumbs Up/Down Ratings"

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
