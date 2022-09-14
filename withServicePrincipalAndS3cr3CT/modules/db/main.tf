/* Azure Managed DB */

resource "azurerm_mssql_managed_instance" "db" {
  name                         = var.dbName
  resource_group_name          = var.rg_name
  location                     = var.rg_location
  administrator_login          = var.dbUserName
  administrator_login_password = var.dbPassword
  license_type                 = "BasePrice"
  subnet_id                    = var.db_subnet_id
  sku_name                     = "GP_Gen5"
  vcores                       = var.vcores
  storage_size_in_gb           = var.size_in_db

}

