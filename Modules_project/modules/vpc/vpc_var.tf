variable cidr_vpc {
  type        = string
  #default     = "10.0.0.0/16"
}


variable pub_sub_1 {
  type        = string
  #default     = "10.0.1.0/24"
  
}

variable az_pub_1 {
  type        = string
  #default     = "ap-south-1a"
  
}

variable pub_sub_2 {
  type        = string
  #default     = "10.0.2.0/24"
  
}

variable az_pub_2 {
  type        = string
  #default     = "ap-south-1b"
  
}

# Private Subnet

variable pvt_sub_1 {
  type        = string
  #default     = "10.0.3.0/24"
  
}

variable az_pvt_1 {
  type        = string
  #default     = "ap-south-1a"
  
}

variable pvt_sub_2 {
  type        = string
  #default     = "10.0.4.0/24"
  
}

variable az_pvt_2 {
  type        = string
  #default     = "ap-south-1b"
  
}

