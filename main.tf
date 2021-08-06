provider "yandex" {
  # Configuration options
  token     = "${var.yandex-token}"
  cloud_id  = "${var.yandex-cloud-id}"
  folder_id = "${var.yandex-folder-id}"
  zone      = "${var.zones[0]}"
}

data "yandex_vpc_subnet" "VM" {
  name           = "${var.name_subnet}"
}

resource "yandex_compute_instance" "VM" {
  name                      = "${var.name_instance}"
  platform_id               = "standart-v1"
  zone                      = "${var.zones[0]}"
  count                     = "${var.instance_count}"
  description               = "Virtual Machine"

  hostname                  = "${var.hostname}"

  resources {
    cores         = "${var.cores}"
    memory        = "${var.memory}"
    core_fraction = "${var.core_fraction}"
  }

  boot_disk {
    auto_delete = true

    initialize_params {
      #Ubuntu 18.04
      image_id    = "${var.image_id}"
      name        = "disk-root"
      description = "Disk for the root"
      size        = "${var.instance_root_disk}"
    }
  }

  secondary_disk {
    disk_id     = data.yandex_compute_disk.disk-srv.id
    auto_delete = true
  }

  network_interface {
    subnet_id = data.yandex_vpc_subnet.VM.id
    nat       = true
  }

  metadata = {
    ssh-keys = "${var.ssh_username}:${file("${var.ssh_pubkey}")}"
  }

  allow_stopping_for_update = true

  depends_on = [
    data.yandex_vpc_subnet.VM
  ]
}

data "yandex_compute_disk" "disk-srv" {
  disk_id = "${var.disk_id}"
}
