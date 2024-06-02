server_ingress = {
    "ingress1" = {
        description = "My homepage"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    "ingress2" = {
        description = "My homepage secure"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    "ingress3" = {
        description = "SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

server_egress = {
    "egress" = {
        description = "No egress"
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }
}

lb_ingress = {
    "ingress1" = {
        description = "LB External"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    "ingress2" = {
        description = "LB External Secure"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

lb_egress = {
    "egress" = {
        description = "No egress"
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }
}

env = "dev"

region = "us-west-2"

vpc_cidr_block = "10.0.0.0/16"

azs = ["us-west-2a","us-west-2b","us-west-2c"]

private_subnets = ["10.0.11.0/24","10.0.12.0/24","10.0.13.0/24"]

public_subnets = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]

private_subnets_tags = {
    type = "private"
}

public_subnets_tags = {
    type = "public"
}

image_id = "ami-0a70b9d193ae8a799"

instance_name = "MyLinuxBox"

instance_type = "t2.micro"

lt_tags = {
    Name = "LoadBalancer"
}

tg_name = "TargetGroup"

tg_tags = {
    Name = "TargetGroup"
}

email = "carlosvillette@gmail.com"