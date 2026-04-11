
terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
    }
  }
}

provider "snowflake" {
  organization_name = "nlvnyvj"
  account_name      = "ww58104"

  user     = "YOGITA24KSHIRSAGAR"
  password = "Manjirica@2907"
  role     = "ACCOUNTADMIN"
}

resource "snowflake_database" "DB_DP_DEV" {
  name = "DB_DP_DEV"
}

resource "snowflake_schema" "BR_IN" {
  database = snowflake_database.DB_DP_DEV.name
  name     = "BR_IN"
  
   # IMPORTANT: prevents recreation issue
  is_transient = false
  with_managed_access = false
}