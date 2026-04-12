
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

  user     = var.snowflake_user
  password = var.snowflake_password"
  role     = "ACCOUNTADMIN"
}

variable "snowflake_user" {}
variable "snowflake_password" {}

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

#  NEW DBs
resource "snowflake_database" "DB_DP_QA" {
  name = "DB_DP_QA"
}

resource "snowflake_database" "DB_DP_PROD" {
  name = "DB_DP_PROD"
}

#  NEW schemas
resource "snowflake_schema" "BR_IN_QA" {
  database = snowflake_database.DB_DP_QA.name
  name     = "BR_IN"

  is_transient        = false
  with_managed_access = false
}

resource "snowflake_schema" "BR_IN_PROD" {
  database = snowflake_database.DB_DP_PROD.name
  name     = "BR_IN"

  is_transient        = false
  with_managed_access = false
}