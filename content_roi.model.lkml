connection: "@{CONNECTION_NAME}"

include: "/views/titles.view.lkml"
include: "/views/licenses.view.lkml"
include: "/views/watch.view.lkml"
include: "/views/genres.view.lkml"
include: "/views/title_genres.view.lkml"

# ===================================================================
# Content ROI Model
# Compares licensing cost against watch engagement to identify which
# titles/genres drive the most value per dollar spent.
# ===================================================================

explore: title_roi {
  from: titles
  view_name: titles
  label: "Title ROI"
  description: "Licensing cost vs. watch hours per title."

  join: licenses {
    type: left_outer
    relationship: one_to_one
    sql_on: ${titles.title_id} = ${licenses.title_id} ;;
  }

  join: watch {
    type: left_outer
    relationship: one_to_many
    sql_on: ${titles.title_id} = ${watch.title_id} ;;
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
