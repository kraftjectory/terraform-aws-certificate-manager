variable "domain_name" {
  type = string
  nullable = false
}

variable "subject_alternative_names" {
  type = list(string)
  default = []
  nullable = false
}

variable "dns_zone_id" {
  type = string
  nullable = false
}

variable "key_algorithm" {
  type = string
  default = "RSA_2048"
  nullable = false
}
