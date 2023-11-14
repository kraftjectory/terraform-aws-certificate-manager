resource "aws_acm_certificate" "this" {
  domain_name = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method = "DNS"
  key_algorithm = var.key_algorithm

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "validation" {
  for_each = {
    for dvo in aws_acm_certificate.this.domain_validation_options : dvo.domain_name => {
      name = dvo.resource_record_name
      record = dvo.resource_record_value
      type = dvo.resource_record_type
    }
  }

  zone_id = var.dns_zone_id
  name = each.value.name
  records = [each.value.record]
  type = each.value.type
  ttl = 300
  allow_overwrite = true
  depends_on = [aws_acm_certificate.this]
}

resource "aws_acm_certificate_validation" "this" {
  certificate_arn = aws_acm_certificate.this.arn
  validation_record_fqdns = values(aws_route53_record.validation)[*].fqdn
}
