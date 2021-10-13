# Указываем, что мы хотим разворачивать окружение в AWS
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}
# Создаем переменную с токеном. Берет токен из файла terraform.tfvars
variable "digitalocean_token" {}

# Указываем провайдер
provider "digitalocean" {
  token = var.digitalocean_token
}

resource "digitalocean_ssh_key" "default" {
  name       = "ssh key for DO"
  public_key = file("~/.ssh/id_rsa.pub")
}

# Ищем образ с последней версией Ubuntu
data "digitalocean_images" "ubuntu" {
  filter {
    key    = "distribution"
    values = ["Ubuntu"]
  }

  filter {
    key    = "regions"
    values = ["fra1"]
  }
}

resource "digitalocean_droplet" "web" {
  # Количество серверов
  count    = 1
  # С найденной Убунтой
  image    = data.digitalocean_images.ubuntu.images[0].slug
  name     = "nginx-${count.index}"
  region   = "fra1"
  size     = "s-1vcpu-1gb"
  ssh_keys = [digitalocean_ssh_key.default.fingerprint]
  tags     = ["nginx"]

  lifecycle {
    create_before_destroy = true
  }
}

output "webserver_ip" {
  description = "IP address of WEB Server"
  value       = digitalocean_droplet.web.*.ipv4_address
}
