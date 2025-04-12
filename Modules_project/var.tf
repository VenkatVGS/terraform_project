variable aws_region_output {
  type        = string
  #default     = "ap-south-1"
}


# ************ VPC variables ***************# 
variable cidr_vpc_out {
  type        = string
  # default     = "10.0.0.0/16"
}

variable pub_sub_1_out {
  type        = string
  # default     = "10.0.1.0/24"
}

variable az_pub_1_out {
  type        = string
  # default     = "ap-south-1a"
  
}

variable pub_sub_2_out {
  type        = string
  # default     = "10.0.2.0/24"
}

variable az_pub_2_out {
  type        = string
  # default     = "ap-south-1b"
 
}

variable  pvt_sub_1_out {
  type        = string
  # default     = "10.0.3.0/24"
}

variable az_pvt_1_out {
  type        = string
  # default     = "ap-south-1a"
}

variable  pvt_sub_2_out {
  type        = string
  # default     = "10.0.4.0/24"
  
}

variable  az_pvt_2_out {
  type        = string
  # default     = "ap-south-1b"
 
}


# ************ EC2 variables ***************# 

variable ami_id_out {
  type        = string
  # default     = "ami-076c6dbba59aa92e6"
  
}

variable instance_type_out {
  type        = string
  # default     = "t2.micro"
}

# ************ DB variables ***************# 

variable db_username_out {
  type        = string
  # default     = "admin"
  
}

variable db_password_out {
  type        = string
  # default     = "Admin123"
  sensitive = true
  
}

variable az_db_out {
  type        = string
  # default     = "ap-south-1a"
  
}


# ************ ELB variables *************** #

variable load_balan_type_out {
  type        = string
  # default     = "application"
  
}


