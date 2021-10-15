output "route53_nameservers" {
    description = "You need to copy this to the root account where Fern purchased the root certificate"
    value = aws_route53_zone.zone.name_servers
}

output "domain_name" {
    description = "This is the domain name we'll be using"
    value = "https://${var.domain_name}"
}
