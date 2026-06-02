connection: "@{CONNECTION_NAME}"

include: "/views/titles.view.lkml"
include: "/views/series.view.lkml"
include: "/views/episodes.view.lkml"
include: "/views/genres.view.lkml"
include: "/views/title_genres.view.lkml"
include: "/views/talent.view.lkml"
include: "/views/title_talent.view.lkml"
include: "/views/languages.view.lkml"
include: "/views/licenses.view.lkml"

# ===================================================================
# Content Catalog Model
# Metadata about every title in the StreamNova library: movies,
# series, episodes, genres, talent, languages, and licensing.
# ===================================================================

explore: titles {
  label: "Content Catalog"
  description: "All movies and series with genres, talent, languages, and licensing."

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

  join: languages {
    type: left_outer
    relationship: one_to_one
    sql_on: ${titles.title_id} = ${languages.title_id} ;;
  }

  join: licenses {
    type: left_outer
    relationship: one_to_one
    sql_on: ${titles.title_id} = ${licenses.title_id} ;;
  }
}

explore: series {
  label: "Series with Episodes"

  join: episodes {
    type: left_outer
    relationship: one_to_many
    sql_on: ${series.title_id} = ${episodes.series_id} ;;
  }
}
