# data "terraform_remote_state" "akzhol-data" {
#   backend = "azurerm"
#   config = {
#     resource_group_name = "akzhol-rg"
#     storage_account_name = "akzholex70e2b"
#     container_name = "akzhol"
#     key = "terraform.tfstate"

#   }
# }