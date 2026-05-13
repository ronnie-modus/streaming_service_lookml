# StreamNova LookML Project

A LookML model defining the analytical semantic layer over the **StreamNova** streaming-service data warehouse (BigQuery dataset: `streaming_service`).

## Structure

```
manifest.lkml                 # Project manifest & constants
models/
  streamnova.model.lkml       # Model: connection, includes, explores
views/
  accounts.view.lkml          # Account-level (billing) view
  marketing.view.lkoml         # Acquisition channel & creation date
