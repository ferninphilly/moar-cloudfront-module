variable "client" {
  description = "The SDV end client this function is billed to"
  type = string
}

variable "environment" {
  description = "The SDV environment to deploy to.  Default to dev"
  type = string
}

variable "domain_name" {
    description = "This is the domain name that we'll be registering"
    type = string
}

variable "s3bucket_endpoint" {
    description = "This is the s3 bucket endpoint starting with http"
    type = string
}

variable "sns_error_topic_arn" {
    description = "This is where errors are going"
    type = string
}

variable "certificate" {
  description = "The aws certificate that you created in us-east-1 for cloudfront (outside of terraform)"
  type = string
}