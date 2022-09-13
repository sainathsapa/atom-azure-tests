module "netowrk" {
  source                   = "./modules/network"
  nsg_name                 = "MyNSG"
  rg_location              = "East US"
  rg_name                  = "AtomRG"
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
