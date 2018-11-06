provider "aws" {
  region = "us-east-1"
}

module "ecs" {
  source = "modules/ecs"

  environment          = "${var.environment}"
  cluster              = "${var.environment}"
  cloudwatch_prefix    = "${var.environment}"           #See ecs_instances module when to set this and when not!
  vpc_cidr             = "${var.vpc_cidr}"
  public_subnet_cidrs  = "${var.public_subnet_cidrs}"
  private_subnet_cidrs = "${var.private_subnet_cidrs}"
  availability_zones   = "${var.availability_zones}"
  max_size             = "${var.max_size}"
  min_size             = "${var.min_size}"
  desired_capacity     = "${var.desired_capacity}"
  key_name             = "${aws_key_pair.ecs.key_name}"
  instance_type        = "${var.instance_type}"
  ecs_aws_ami          = "${var.ecs_aws_ami}"
}

resource "aws_key_pair" "ecs" {
  key_name   = "ecs-key-${var.environment}"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCo/oUQw+Bb72uvRv1Vj/OeeMY3euj8fHV+YNJ/JFca/6km+LcKl3tbzgxfn2Gmu2Nyb8wJnrfogh22+PnLANWC2Uk6s8WxXCMa6xIEqom0R51+Bm48ROMrrFwpwcsWw4LifCFZ1pe3XNAy9SwKriVALa/cKW+JGQeSF/sMNL/acsSQXLXAwW8+QMf93v9BByDFOtQl4QwEYx300EkJ/zhp+NTlpT/bjvO4FPH5RHvDz76cxMiPGMVcxM1DKpitBpqtf9tpY4ArMqNhejewF+cjJE3uYlJWqd84IMbdL1/VaGydXt64lKZ14IiVTBVPoNu4lhxkmaYmq4nKLbTdxzjx ec2-user@ip-172-31-27-173e"
}

variable "vpc_cidr" {}
variable "environment" {}
variable "max_size" {}
variable "min_size" {}
variable "desired_capacity" {}
variable "instance_type" {}
variable "ecs_aws_ami" {}

variable "private_subnet_cidrs" {
  type = "list"
}

variable "public_subnet_cidrs" {
  type = "list"
}

variable "availability_zones" {
  type = "list"
}

output "default_alb_target_group" {
  value = "${module.ecs.default_alb_target_group}"
}
