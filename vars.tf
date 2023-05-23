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

variable "sns_error_topic_arn" {
    description = "This is where errors are going"
    type = string
}

variable "certificate" {
  description = "The aws certificate that you created in us-east-1 for cloudfront (outside of terraform)"
  type = string
}

variable "lambda_url_domain" {
  description = "This is the lambda url that we're pointed to; get it from the lambda_url terraform object"
  type = string
}

# variable "lambda_association" {
#   description = "Is there a lambda associated with the cloudfront endpoint?"
#   type = bool
#   default = false
# }

# variable "lambda_endpoint" {
#   description = "If Lambda Association is true then this is the endpoint of the lambda we're hitting"
#   type = string
# }
