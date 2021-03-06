variable "name_subnet" {
  type    = string
}

variable "name_instance" {
  type    = string
}

variable "instance_count" {
  description = "Count instance"
  type        = number
  default     = 1 
}

variable "zones" {
  type    = list(string)
  default = ["ru-central1-a", "ru-central1-b", "ru-central1-c"]
}

variable "hostname" {
  type    = string
}

variable "yandex-token" {
  default = "<token>"
}

variable "yandex-cloud-id" {
  default = "<cloud-id>"
}

variable "yandex-folder-id" {
  default = "<folder-id>"
}

variable "instance_root_disk" {
  default = "20"
}

variable "instance_additional_disk" {
  default = "5"
}

variable "image_id" {
  type    = string
  default = "fd81d2d9ifd50gmvc03g"
}

variable "core_fraction" {
  type    = number
  default = 50
}

variable "cores" {
  type        = number
  default     = 2
}

variable "memory" {
  type        = number
  default     = 6
}

variable "ssh_username" {
  type    = string
  default = "ubuntu"
}

variable "ssh_pubkey" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}

variable "disk_id" {
  type    = string
  default = ""
}
