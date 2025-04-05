variable db_username {
     type        = string
 # default     = "admin"
}

variable db_password {
  type        = string
 # default     = "Admin123"
  sensitive = true
}

variable az_db {
  type        = string
 # default     = "ap-south-1a"
  
}

variable private_sg_db {}

variable private_subnet_1_db {}

variable private_subnet_2_db {}