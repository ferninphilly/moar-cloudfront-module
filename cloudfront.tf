/* cloudfront */


resource "aws_cloudfront_distribution" "cf" {
  // origin is where CloudFront gets its content from.
  comment = "Cloudfront Distribution for ${var.client} in the ${var.environment} environment"
  origin {
    # custom_origin_config {
    #   // These are all the defaults.
    #   http_port              = "80"
    #   https_port             = "443"
    #   origin_protocol_policy = "http-only"
    #   origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    # }

    domain_name = var.s3bucket_endpoint
    // This can be any name to identify this origin.
    origin_id   = var.domain_name
    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/ABCDEFG1234567"
    }
  }

  enabled             = true
  default_root_object = "index.html"

  // All values are defaults from the AWS console.
  default_cache_behavior {
    viewer_protocol_policy = "redirect-to-https"
    compress               = true
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]
    // This needs to match the `origin_id` above.
    target_origin_id       = var.domain_name
    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0

    forwarded_values {
      query_string = false
      headers = ["*"]
      cookies {
        forward = "none"
      }
    }
  }

  // Here we're ensuring we can hit this distribution using www.runatlantis.io
  // rather than the domain name CloudFront gives us.
  aliases = [var.domain_name]

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  // Here's where our certificate is loaded in!
  viewer_certificate {
    acm_certificate_arn = var.certificate
    ssl_support_method  = "sni-only"
  }
}