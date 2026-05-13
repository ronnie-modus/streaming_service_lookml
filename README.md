# StreamNova LookML Project

A LookML model defining the analytical semantic layer over the **StreamNova** streaming-service data warehouse (BigQuery dataset: `streaming_service`).

## Structure

```
manifest.lkml                 # Project manifest & constants
models/
  streamnova.model.lkml       # Model: connection, includes, explores
views/
  accounts.view.lkml          # Account-level (billing) view
  marketing.view.lkml         # Acquisition channel & creation date
  profiles.view.lkml          # Viewer profiles
  plans.view.lkml             # Subscription plans (Basic / Standard / Premium / Ad-Supported)
  payment_methods.view.lkml
  partnerships.view.lkml      # Telco/TV bundles
  support_tickets.view.lkml
  titles.view.lkml            # Content catalog
  series.view.lkml
  genres.view.lkml
  title_genres.view.lkml
  talent.view.lkml
  title_talent.view.lkml
  languages.view.lkml
  licenses.view.lkml          # Content licensing cost/time window
  sessions.view.lkml          # App sessions (umbrella)
  watch.view.lkml             # Playback sessions
  ui.view.lkml                # UI interactions (Skip Intro, time-to-click)
  video_quality.view.lkml
  search.view.lkml
  ratings.view.lkml
  offline_downloads.view.lkml
  watchlists.view.lkml
  watch_parties.view.lkml
  wp_attendees.view.lkml
  feature_rollouts.view.lkml
```

## Explores

| Explore | Purpose |
|---|---|
| `sessions` | App-level engagement; joins watch, ui, profiles, accounts, titles, genres |
| `watch` | Playback analytics; joins titles, genres, licenses, video_quality, profiles |
| `accounts` | Subscribers, churn, revenue, partnerships, marketing |
| `titles` | Content catalog with genres, talent, licenses, languages, series |
| `watch_parties` | Co-viewing events & emoji engagement |
| `search`, `ratings`, `offline_downloads`, `watchlists`, `support_tickets`, `feature_rollouts` | Targeted single-fact explores |

## Key analyses this model supports

Aligned with the **StreamNova Data Architecture & Analytics Blueprint**:

1. **Decision Fatigue / Friction Time** — compare `sessions.total_session_minutes` vs. `watch.total_watch_hours` per profile.
2. **Watchlists Cure Fatigue** — cohort profiles with/without `watchlists` entries; compare friction.
3. **Commuter Retention** — `offline_downloads` in first 30 days → retention cohorts.
4. **Content ROI (Cost per Hour Viewed)** — `licenses.total_cost_usd` / `watch.total_watch_hours`.
5. **LTV vs CAC by Channel** — `marketing.channel` × account billing history.
6. **UI Bug (Q2/Q3 2026)** — track `ui.avg_time_to_click_sec` over time to surface the May 2026 Skip-Intro regression.
7. **Social LTV** — watch-party attendees (`wp_attendees`) → LTV comparison.

## Configuration

The connection name is controlled by the `CONNECTION_NAME` constant in `manifest.lkml` (default: `bigquery_streamnova`). The BigQuery dataset is controlled by the `DATASET` constant (default: `streaming_service`). Override at the environment level if needed.
