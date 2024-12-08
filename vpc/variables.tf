variable "tags" {
  type = map(object({
    env = optional(string)
  }))
  description = "A map of tags to add to all resources"
}

variable "vpc_cidr_block" {
  type        = string
  description = "value of the CIDR block for the VPC"
}

variable "instance_tenancy" {
  type        = string
  description = "value of the instance tenancy for the VPC"
  default     = "default"
}

variable "subnet_cidr_block" {
  type        = string
  description = "value of the CIDR block for the subnet"
}

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