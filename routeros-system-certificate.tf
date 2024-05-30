resource "routeros_system_certificate" "root_ca" {
  name        = "Test-Root-CA"
  common_name = "RootCA"
  key_usage   = ["key-cert-sign", "crl-sign"]
  trusted     = true
  # Sign Root CA.
  sign {
  }
}