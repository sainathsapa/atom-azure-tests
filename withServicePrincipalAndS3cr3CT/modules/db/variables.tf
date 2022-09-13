
/* for DB */

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
