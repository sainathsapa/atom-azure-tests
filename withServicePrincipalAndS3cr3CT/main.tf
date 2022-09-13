module "rg" {
  source      = "./modules/resource_grp"
  rg_location = "East US"
  rg_name     = "MyRG"



}
module "netowrk" {
  source                   = "./modules/network"
  nsg_name                 = "MyNSG"
  rg_location              = module.rg.rg_location
  rg_name                  = module.rg.rg_location
  vnet_name                = "MyVnet"
  vnet_address_space       = ["value"]
  vnet_dns_servers         = ["value"]
  dns_zone_name            = "MyDNSZone"
  subnet_name              = "MySubNet"
  subnet_address_prifix    = ["value"]
  db_subnet_name           = "MyDBSubnetName"
  db_subnet_address_prefix = ["value"]
  db_action                = ["va", "val"]
  pip_name                 = "MyPublicIP"
  pip_alloc_method         = "Dynamic"
  az_lb_name               = "MyAZLB"
  pvt_lnk_service_name     = "MyPvtService"
  pvt_lnk_service_k8s_ip   = azurerm_kubernetes_cluster.k8s


}


module "db" {
  source     = "./modules/db"
  dbPassword = "atomS3Cr3t"
  dbUserName = "stateAtom"
  vcores     = 2
  size_in_db = 30

}

# USer Detaisl
data "azurerm_client_config" "current" {
}

module "az_key" {
  source                     = "./modules/az_key"
  key_vault_name             = "MyKeyValut"
  rg_location                = module.rg.rg_location
  rg_name                    = module.rg.rg_name
  soft_delete_retention_days = 2
  certificate_permissions    = ["create"]
  secret_permissions         = ["get"]
  storage_permissions        = ["get"]
  vnet_subnet_id             = module.netowrk.subnet_name.id


}


