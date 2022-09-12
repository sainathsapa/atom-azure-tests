/* Azure Managed DB */

resource "azurerm_sql_managed_instance" "example" {
  name                         = var.dbName
  resource_group_name          = var.resource_group_name
  location                     = var.location
  administrator_login          = var.dbUserName
  administrator_login_password = var.dbPassword
  license_type                 = "BasePrice"
  subnet_id                    = azurerm_subnet.db_subnet.id
  sku_name                     = "GP_Gen5"
  vcores                       = 4
  storage_size_in_gb           = 32

}

