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

# add name=sw06 common-name=sw06.durand.es country=NL state=UT locality=Utrecht organization="Durand Guru" unit=Events subject-alt-name=DNS:sw06.durand.es,IP:172.22.5.16

resource "routeros_system_certificate" "scep_client" {
  name             = var.device_settings.identity
  common_name      = var.device_settings.identity
  subject_alt_name = "DNS:${var.device_settings.identity},IP:${local.ip}"
  key_usage        = ["digital-signature", "key-agreement", "tls-client"]
  country          = "NL"
  locality         = "Apeldoorn"
  organization     = "Durand Guru"
  state            = "Gelderland"
  unit             = "Omnisport"
  key_size         = "4096"

  sign_via_scep {
    scep_url = "http://172.22.5.1/scep/90"
  }
}