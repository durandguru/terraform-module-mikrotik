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
  # Sign Root CA.
  sign {
  }
}