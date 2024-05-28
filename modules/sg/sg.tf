resource "aws_security_group" "server_sg" {
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_server

    content {
        description = ingress.value.description
        from_port = ingress.value.from_port
        to_port = ingress.value.to_port
        protocol = ingress.value.protocol
        cidr_blocks = ingress.value.cidr_blocks 
    }
  }

  dynamic "egress" {
    for_each = var.egress_server

    content {
      description = egress.value.description
        from_port = egress.value.from_port
        to_port = egress.value.to_port
        protocol = egress.value.protocol
        cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    Name = "${var.env}-server-${var.region}"
  }
}

resource "aws_security_group" "load_balancer_sg" {
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_lb

    content {
        description = ingress.value.description
        from_port = ingress.value.from_port
        to_port = ingress.value.to_port
        protocol = ingress.value.protocol
        cidr_blocks = ingress.value.cidr_blocks 
    }
  }

  dynamic "egress" {
    for_each = var.egress_lb

    content {
      description = egress.value.description
        from_port = egress.value.from_port
        to_port = egress.value.to_port
        protocol = egress.value.protocol
        cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    Name = "${var.env}-lb-${var.region}"
  }
}