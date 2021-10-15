resource "aws_cloudwatch_metric_alarm" "cloudfront-500-errors" {
  alarm_name          = "${var.client}-${var.environment}-CloudFront-High-5xx-Error-Rate"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "5xxErrorRate"
  namespace           = "AWS/Cloudfront"
  period              = 60
  statistic           = "Average"
  threshold           = 5
  treat_missing_data  = "notBreaching"
  alarm_actions       = [var.sns_error_topic_arn]
  actions_enabled     = true

  dimensions = {
    DistributionId = aws_cloudfront_distribution.cf.id
    Region         = "Global"
  }
}

resource "aws_cloudwatch_metric_alarm" "cloudfront-400-errors" {
  alarm_name          = "${var.client}-${var.environment}-CloudFront-High-5xx-Error-Rate"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "4xxErrorRate"
  namespace           = "AWS/Cloudfront"
  period              = 60
  statistic           = "Average"
  threshold           = 5
  treat_missing_data  = "notBreaching"
  alarm_actions       = [var.sns_error_topic_arn]
  actions_enabled     = true

  dimensions = {
    DistributionId = aws_cloudfront_distribution.cf.id
    Region         = "Global"
  }
}
