connection: "@{CONNECTION_NAME}"

include: "/views/video_quality.view.lkml"
include: "/views/cdn.view.lkml"
include: "/views/crashes.view.lkml"
include: "/views/watch.view.lkml"
include: "/views/titles.view.lkml"
include: "/views/devices.view.lkml"

# ===================================================================
# Quality of Service Model
# Streaming quality, CDN bandwidth, and app stability.
# ===================================================================

explore: video_quality {
  label: "Video Quality"
  description: "Resolution delivered per stream, joined to watch sessions and titles."

  join: watch {
    type: left_outer
    relationship: one_to_one
    sql_on: ${video_quality.stream_id} = ${watch.watch_session_id} ;;
  }

  join: titles {
    type: left_outer
    relationship: many_to_one
    sql_on: ${watch.title_id} = ${titles.title_id} ;;
  }
}

explore: cdn {
  label: "CDN Delivery"
  description: "Bytes delivered per watch session; used for bandwidth/cost analysis."

  join: watch {
    type: left_outer
    relationship: one_to_one
    sql_on: ${cdn.watch_session_id} = ${watch.watch_session_id} ;;
  }

  join: titles {
    type: left_outer
    relationship: many_to_one
    sql_on: ${watch.title_id} = ${titles.title_id} ;;
  }
}

explore: crashes {
  label: "App Crashes"
  description: "Crash events by device_type over time."
}
