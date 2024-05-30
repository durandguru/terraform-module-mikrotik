resource "routeros_ip_service" "api" {
  numbers  = "api"
  port     = "8728"
  disabled = "true"
}

resource "routeros_ip_service" "api-ssl" {
  numbers     = "api-ssl"
  port        = "8729"
  disabled    = "true"
  certificate = "none"
  tls_version = "any"
}

resource "routeros_ip_service" "ftp" {
  numbers  = "ftp"
  port     = "21"
  disabled = "true"
}

resource "routeros_ip_service" "telnet" {
  numbers  = "telnet"
  port     = "23"
  disabled = "true"
}

resource "routeros_ip_service" "www" {
  numbers  = "www"
  port     = "80"
  disabled = "false"
}