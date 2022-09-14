module "rg" {
  source      = "./modules/resource_grp"
  rg_location = "East US"
  rg_name     = "MyRG"



}


module "k8s" {
  source = "./modules/k8s"

  cluster_name           = "MyK8sCluster"
  rg_location            = module.rg.rg_location
  rg_name                = module.rg.rg_name
  dns_prefix             = "atomstate.dns.io"
  vm_name                = "MyK8sClusterVM"
  cluster_node_count     = 2
  cluster_node_max_count = 10
  cluster_node_min_count = 5
  vm_size_proccer_ram    = "Standard_D2_v2"
  vm_os_disk_size_gb     = 10
  vnet_subnet_id         = module.netowrk.subnet.id
  admin_user_name        = "stateatom"
  # ssh_key                = module.az_key.public_ssh_key
  ssh_key                = "MyNAme"
  client_id              = module.user_details.user.client_id
  client_secret          = module.user_details.user.object_id
  subnet_name            = module.netowrk.subnet.name
  admin_group_object_ids = ["value", "value"]
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
  pvt_lnk_service_k8s_ip   = module.k8s.cluster_ip


}


module "db" {
  source       = "./modules/db"
  dbName       = "MyDB"
  rg_location  = module.rg.rg_location
  rg_name      = module.rg.rg_name
  dbPassword   = "atomS3Cr3t"
  dbUserName   = "stateAtom"
  vcores       = 2
  size_in_db   = 30
  db_subnet_id = module.netowrk.db_subnet.id


}

module "user_details" {
  source = "./modules/client_dt"

}

# module "az_key" {
#   source                     = "./modules/az_key"
#   key_vault_name             = "MyKeyValut"
#   rg_location                = module.rg.rg_location
#   rg_name                    = module.rg.rg_name
#   soft_delete_retention_days = 2
#   certificate_permissions    = ["create"]
#   secret_permissions         = ["get"]
#   storage_permissions        = ["get"]
#   vnet_subnet_id             = module.netowrk.subnet.id
#   tenant_id                  = module.user_details.0.tenant_id
#   principal_id               = module.user_details.0.principal_id



# }
