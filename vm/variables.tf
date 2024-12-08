variable "tags" {
  type = map(object({
    env = optional(string)
  }))
  description = "A map of tags to add to all resources"
}

variable "ec2_instance_type" {
  type        = string
  description = "The type of EC2 instance to launch"
  default     = "t2.micro"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID"
}

variable "subnet_id" {
  type        = string
  description = "The Subnet ID"
}

# variable "network_interface_private_ips" {
#   type        = list(string)
#   description = "The private IP addresses to assign to the network interface"
# }

variable "key_pair_name" {
  description = "The name of the key pair to use for the instance"
  type        = string
}

variable "root_block_device_volume_size" {
  type        = number
  description = "The size of the root block device volume in GiB"
  default     = 8
}

variable "security_groups" {
  type        = list(string)
  description = "The security groups to assign to the instance"
}

variable "private_ips" {
  description = "Map of private IPs for the instances"
  type        = map(string)
  default = {
    "vm1" = "192.168.112.7"
    "vm2" = "192.168.112.8"
    "vm3" = "192.168.112.9"
  }
}

variable "admin_password" {
  description = "Password for the admin user"
  type        = string
  default     = "$andB0xL@b"
}

#---------------------------------------------------

variable "aws_access_key" {
  type        = string
  description = "AWS"
  default     = "AKIAXAQ67BDLNG3HKS7I"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS"
  default     = "gUDyvGWKZ9h7VoDhylhQQLGc/ee4cp3tY5v/4lF8"
}