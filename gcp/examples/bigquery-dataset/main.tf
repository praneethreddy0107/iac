module "bigquery" {
  source       = "../../modules/bigquery"
#  for_each   = var.datasets

#   project_id = var.project_id
#   dataset_id = each.value.dataset_id
#   dataset_name = each.value.dataset_name
#   location   = each.value.location
project_id = var.project_id
dataset_id = var.dataset_id
dataset_name = var.dataset_name
location   = var.location
tables = [
    {
      table_id           = "foo",
      schema             = <<EOF
[
  {
    "name": "fullVisitorId",
    "type": "STRING",
    "mode": "REQUIRED"
  },
  {
    "name": "visitId",
    "type": "INTEGER",
    "mode": "REQUIRED"
  },
  {
    "name": "visitStartTime",
    "type": "TIMESTAMP",
    "mode": "NULLABLE"
  },
  {
    "name": "device",
    "type": "RECORD",
    "mode": "NULLABLE",
    "fields": [
      {
        "name": "browser",
        "type": "STRING",
        "mode": "NULLABLE"
      },
      {
        "name": "operatingSystem",
        "type": "STRING",
        "mode": "NULLABLE"
      },
      {
        "name": "isMobile",
        "type": "BOOLEAN",
        "mode": "NULLABLE"
      }
    ]
  },
  {
    "name": "trafficSource",
    "type": "RECORD",
    "mode": "NULLABLE",
    "fields": [
      {
        "name": "source",
        "type": "STRING",
        "mode": "NULLABLE"
      },
      {
        "name": "medium",
        "type": "STRING",
        "mode": "NULLABLE"
      }
    ]
  }
]
EOF
      time_partitioning  = {
        type                     = "DAY",
        field                    = null,
        require_partition_filter = false,
        expiration_ms            = null,
      },
      range_partitioning = null,
      expiration_time = null,
      clustering      = ["fullVisitorId", "visitId"],
      labels          = {
        env      = "dev"
        billable = "true"
        owner    = "joedoe"
      },
    }
  ]
}
