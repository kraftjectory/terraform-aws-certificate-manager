A [Terraform](https://www.terraform.io) module for [AWS Certificate Manager](https://aws.amazon.com/certificate-manager/).

## Usage

```hcl
module "example_certificate" {
  source = "github.com/kraftjectory/terraform-aws-certificate-manager"

  domain_name = "example.com"
  subject_alternative_names = ["example.com"]
  dns_zone_id = aws_route53_zone.main.zone_id
  key_algorithm = "EC_prime256v1" # Defaults to "RSA_2048".

  providers = {
    aws = aws.global
  }
}
```
