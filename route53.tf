resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain_name
  validation_method = "DNS"
}

resource "aws_route53_zone" "zone" {
  name = var.domain_name
}

resource "aws_route53_record" "ns" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = var.domain_name
  type    = "NS"
  ttl     = "30"
  records = aws_route53_zone.zone.name_servers
}

resource "aws_route53_record" "record" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.zone.zone_id
}
