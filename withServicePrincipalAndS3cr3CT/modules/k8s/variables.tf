
/* Cluster Name */
variable "cluster_name" {
  description = "Cluster name to be used to deploy the cluster"
  default     = "atomstate-cluster-name"
  type        = string
}

/* UserName for KubeCluster's VMachine */
variable "admin_user_name" {

  default     = "stateatom-admin-user-name"
  type        = string
  description = "User name for VMachine"

}

/* DNS Prefix for KubeCluster*/

variable "dns_prefix" {
  description = "DNS Prefix for KubeCluster"
  type        = string
  default     = "atomstate.dns.io"
}

/* Node_Pool Modification for KubeCluster*/

variable "vm_name" {
  /* VM Name */
  default     = "MyVMName"
  type        = string
  description = "Name for VM Machine of K8s"

}

variable "vm_size_proccer_ram" {
  /* Specs */
  description = "Define Proccesor and RAM size Based on the Azure "
  default     = "Standard_D2_v2"
  type        = string
}

variable "vm_os_disk_size_gb" {
  /* Disk Size */
  default     = 10
  type        = number
  description = "Disk Size for VM"
}
variable "cluster_node_count" {
  /* Default node count for KubeCluster*/
  type        = number
  description = "Set Default Node count for KubeCluster"
  default     = 2

}

variable "cluster_node_min_count" {
  /* Minimum number of nodes*/
  type        = number
  description = "Set Default Node Minimum count for KubeCluster"
  default     = 2
}

variable "cluster_node_max_count" {
  /* Maximum number of nodes*/
  type        = number
  description = "Set Default Node Maximum count for KubeCluster"
  default     = 10
}

variable "client_id" {
  type = string

}

variable "client_secret" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "rg_location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "admin_group_object_ids" {
  type = list(string)
}


variable "vnet_subnet_id" {

  type = string

}

variable "ssh_key" {
  type = string
}
