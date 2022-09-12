/* Principal ID */

principal_id = "RANDOM"


/* Subscription ID */
subscription_id = "RANDOM"

/* Client ID */
client_id = "RANDOM"

/* Client Secret */
client_secret = "RANDOM"


/* Tenant ID */
tenant_id = "RANDOM"



/* Resource Group Name */
resource_group_name = "atomstate-resource-group-name"

/* Key Vault Name */

key_vault_name             = "MyKeyVaultName"
soft_delete_retention_days = 2
certificate_permissions    = ["create", "delete", "deleteissuers", "get", "update"]
key_permissions            = ["backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", "recover", "restore", "sign", "unwrapKey", "update", "verify", "wrapKey", ]
secret_permissions         = ["get"]
storage_permissions        = ["get"]


/* Key Secret Name */
key_secret_name = "MyKeySecretName"

/* Location for RG */
location = "East US"



cluster_name = "atomstate-cluster-name"

/* UserName for KubeCluster's VMachine */
admin_user_name = "stateatom-admin-user-name"


/* DNS Prefix for KubeCluster*/

dns_prefix = "atomstate.dns.io"


/* Node_Pool Modification for KubeCluster*/
vm_name                = "MyVMName"
vm_size_proccer_ram    = "Standard_D2_v2"
vm_os_disk_size_gb     = 10
cluster_node_count     = 2
cluster_node_min_count = 2
cluster_node_max_count = 10


/* NSG */

nsg_name = "MyNSG"

/* VNet Name */

vnet_name = "MyKubeVnetName"

/* SubNet Name */

subnet_name = "Name for Subnet to be used for KubeCluster"


/* Variables for Role Definition */


role_definition = ["123456789012345678901234567890123", "NameforCurrentUserRole", "/subscription_id/etc"]
/* [ role_id, role_name, role_scope ] */

role_permissions = ["value", "value", "value", "value", "value", "value", "value"]



/* Role Assignmet */
role_assignment_name = "MyRoleAssignmentName"



/* for DB */
dbUserName = "MyUserName"
dbPassword = "MyPassword"

