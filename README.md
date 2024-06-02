# vpc-vms

This project creates an vpc with public and private subnets and hosts autoscaling linux instances in the private subnets that distributes traffic using an application load balancer (alb). The instances are spread evenly between the availability zones.
After running this command in the terminal of the root diractory of the project:
> `terraform apply`
the infrastructure will be built and the url to reach the instance will be diplayed in the console:
> `lb_dns_name = $URL`