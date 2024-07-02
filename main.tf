provider "aws" {
  region = var.region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.62"
    }
  }
}


module "vpc" {
  source = "./modules/vpc"

  env = var.env

  azs                  = var.azs
  private_subnets      = var.private_subnets
  public_subnets       = var.public_subnets
  private_subnets_tags = var.private_subnets_tags
  public_subnets_tags  = var.public_subnets_tags
}

module "security_groups" {
  source         = "./modules/sg"
  vpc_id         = module.vpc.vpc_id
  env            = var.env
  region         = var.region
  server_egress  = var.server_egress
  server_ingress = var.server_ingress
  lb_egress      = var.lb_egress
  lb_ingress     = var.lb_ingress
}

module "launchTemplate" {
  source             = "./modules/LaunchTemplate"
  image_id           = var.image_id
  instance_name      = var.instance_name
  instance_type      = var.instance_type
  user_data          = file("startupScript.sh")
  security_group_ids = [module.security_groups.server_sg_id]
  lt_tags            = var.lt_tags

}

module "targetGroup" {
  source  = "./modules/TargetGroup"
  vpc_id  = module.vpc.vpc_id
  tg_name = var.tg_name
  tg_tags = var.tg_tags
}

module "loadBalancer" {
  source           = "./modules/lb"
  env              = var.env
  subnets          = module.vpc.public_subnet_ids
  region           = var.region
  target_group_arn = module.targetGroup.target_group_arn
  security_groups  = [module.security_groups.load_balancer_sg_id]
}

module "asg" {
  source             = "./modules/AutoScalingGroup"
  target_group_arn   = module.targetGroup.target_group_arn
  subnet_ids         = module.vpc.private_subnet_ids
  launch_template_id = module.launchTemplate.id
  min_size           = 3
  max_size           = 15
  desired_capacity   = 6

}

module "sns" {
  source      = "./modules/SNS"
  email       = var.email
  group_names =[module.asg.asg_name]
}
