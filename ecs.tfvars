vpc_cidr = "10.0.0.0/16"

environment = "dpp"

public_subnet_cidrs = ["10.0.0.0/24", "10.0.1.0/24"]

private_subnet_cidrs = ["10.0.50.0/24", "10.0.51.0/24"]

availability_zones = ["us-east-2a", "us-east-2b"]

max_size = 2

min_size = 2

desired_capacity = 2

instance_type = "t2.micro"

ecs_aws_ami = "ami-0a0c6574ce16ce87a"
