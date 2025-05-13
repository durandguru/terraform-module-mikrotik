# resource "routeros_system_user_group" "mktxp" {
#   name   = "mktxp"
#   policy = ["api", "!ftp", "!local", "!password", "!policy", "read", "!reboot", "!rest-api", "!romon", "!sensitive", "!sniff", "!ssh", "!telnet", "!test", "!web", "!winbox", "!write"]
# }