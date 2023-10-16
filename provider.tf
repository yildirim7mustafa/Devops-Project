provider "kubernetes" {
  host = "https://192.168.49.2:8443"
  config_path = "~/.kube/config"

  client_certificate     = "${file("~/.kube/client-cert.pem")}"
  client_key             = "${file("~/.kube/client-key.pem")}"
  cluster_ca_certificate = "${file("~/.kube/cluster-ca-cert.pem")}"
}