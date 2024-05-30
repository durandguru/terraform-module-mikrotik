resource "routeros_system_certificate" "root_ca" {
  name         = "Atletiekunie-ES-CA"
  common_name  = "Atletiekunie.ES Root CA"
  key_usage    = ["key-cert-sign", "crl-sign"]
  trusted      = true
  country      = "NL"
  locality     = "Apeldoorn"
  organization = "Durand Guru"
  state        = "Gelderland"
  unit         = "Omnisport"
  days_valid   = "3650"
  key_size     = "4096"
  # Sign Root CA.
  sign {
  }
}

resource "routeros_system_certificate_scep_server" "scep-90-days" {
  ca_cert    = routeros_system_certificate.root_ca.name
  path       = "/scep/90"
  days_valid = 90

  depends_on = [routeros_system_certificate.root_ca]
}

resource "routeros_system_certificate_scep_server" "scep-365-days" {
  ca_cert    = routeros_system_certificate.root_ca.name
  path       = "/scep/365"
  days_valid = 365

  depends_on = [routeros_system_certificate.root_ca]
}