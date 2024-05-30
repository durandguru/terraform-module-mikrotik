resource "routeros_system_certificate" "root_ca" {
  count        = var.cert_settings.root == true ? 1 : 0
  name         = "Atletiekunie-ES-CA"
  common_name  = "Atletiekunie.ES Root CA"
  key_usage    = ["key-cert-sign", "crl-sign"]
  trusted      = true
  country      = var.cert_settings.country
  state        = var.cert_settings.state
  locality     = var.cert_settings.locality
  organization = var.cert_settings.organization
  unit         = var.cert_settings.unit
  days_valid   = "3650"
  key_size     = var.cert_settings.key_size
  # Sign Root CA.
  sign {
  }
}

# resource "routeros_system_certificate_scep_server" "scep-90-days" {
#   count      = var.cert_settings.root == true ? 1 : 0
#   ca_cert    = routeros_system_certificate.root_ca.name
#   path       = "/scep/90"
#   days_valid = 90

#   depends_on = [routeros_system_certificate.root_ca[0]]
# }

# resource "routeros_system_certificate_scep_server" "scep-365-days" {
#   count      = var.cert_settings.root == true ? 1 : 0
#   ca_cert    = routeros_system_certificate.root_ca.name
#   path       = "/scep/365"
#   days_valid = 365

#   depends_on = [routeros_system_certificate.root_ca[0]]
# }

# resource "routeros_system_certificate" "scep_client" {
#   name             = var.device_settings.identity
#   common_name      = var.device_settings.identity
#   subject_alt_name = "DNS:${var.device_settings.identity},IP:${local.ip}"
#   key_usage        = ["digital-signature", "key-agreement", "tls-client"]
#   country          = var.cert_settings.country
#   state            = var.cert_settings.state
#   locality         = var.cert_settings.locality
#   organization     = var.cert_settings.organization
#   unit             = var.cert_settings.unit
#   key_size         = var.cert_settings.key_size

#   sign_via_scep {
#     scep_url = var.cert_settings.scep_url
#   }

#   depends_on = [routeros_system_certificate.root_ca]
# }