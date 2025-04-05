# ************ VPC ******************* #

module "vpc" {
    source = "./modules/vpc"
    cidr_vpc = var.cidr_vpc_out
    pub_sub_1 = var.pub_sub_1_out
    az_pub_1 = var.az_pub_1_out
    pub_sub_2 = var.pub_sub_2_out
    az_pub_2 = var.az_pub_2_out
    pvt_sub_1 = var.pvt_sub_1_out
    az_pvt_1 = var.az_pvt_1_out
    pvt_sub_2 = var.pvt_sub_2_out
    az_pvt_2 = var.az_pvt_2_out
}


# *************** EC2 ***************** #

module "ec2" {
    source = "./modules1/ec2"
    my_ami = var.ami_id_out
    instance_type = var.instance_type_out
    public_subnet_1_ec2 = module.vpc.public_subnet_1_output
    public_sg_ec2 = module.vpc.public_sg_output
    public_subnet_2_ec2 = module.vpc.public_subnet_2_output
}


# ***************** DB ********************* #

module "db" {
    source = "./modules2/db"
    db_username = var.db_username_out
    db_password = var.db_password_out
    az_db = var.az_db_out
    private_sg_db = module.vpc.private_sg_output
    private_subnet_1_db = module.vpc.private_subnet_1_output
    private_subnet_2_db = module.vpc.private_subnet_2_output
}

# ***************** ELB ********************* #

module "elb" {
    source = "./modules3/elb"
    load_balan_type = var.load_balan_type_out
    public_sg_elb = module.vpc.public_sg_output
    public_subnet_1_elb = module.vpc.public_subnet_1_output
    public_subnet_2_elb = module.vpc.public_subnet_2_output
    myvpc_elb = module.vpc.myvpc_output
    web_1_elb = module.ec2.web_1_output
    web_2_elb = module.ec2.web_2_output
}

