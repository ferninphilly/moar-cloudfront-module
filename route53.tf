resource "aws_route53_zone" "zone" {
  name = var.domain_name

  tags = {
    Environment = var.environment
  }
}

// This Route53 record will point at our CloudFront distribution.
resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = "Connection to cloudfront for ${var.client}"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.cf.domain_name
    zone_id                = aws_cloudfront_distribution.cf.hosted_zone_id
    evaluate_target_health = false
  }
}
