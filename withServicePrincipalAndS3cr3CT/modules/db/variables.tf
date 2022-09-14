
/* for DB */

variable "dbName" {
  type = string
}

variable "dbUserName" {
  type        = string
  default     = "MyUserName"
  description = "UserName for Azure Managed Instance"

}

variable "dbPassword" {
  type        = string
  default     = "MyPassword"
  description = "Password for Azure Managed Instance"
  sensitive   = true
}


variable "size_in_db" {
  type = number

}

variable "vcores" {
  type = number
}


variable "rg_location" {
  type = string
}

variable "rg_name" {
  type = string
}


variable "db_subnet_id" {
  type = string
}
