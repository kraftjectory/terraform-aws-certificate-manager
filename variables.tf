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

variable "options" {
  type = object({
    certificate_transparency_logging_preference = string
  })
  default = {
    certificate_transparency_logging_preference = "ENABLED"
  }
  nullable = false
  validation {
    condition = contains(["ENABLED", "DISABLED"], var.options.certificate_transparency_logging_preference)
    error_message = "The certificate_transparency_logging_preference must be either 'ENABLED' or 'DISABLED'."
  }
}
