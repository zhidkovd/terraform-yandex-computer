output "internal_ip" {
  description = "The Internal IP Address"
  value       = yandex_compute_instance.VM.*.network_interface.0.ip_address
}

output "external_ip" {
  description = "The External IP Address"
  value       = yandex_compute_instance.VM.*.network_interface.0.nat_ip_address
}

output "fqdn" {
  value       = yandex_compute_instance.VM.*.fqdn
}
