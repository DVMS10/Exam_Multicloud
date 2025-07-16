output "aws_public_ip" {
    value = aws_instance.aws_vm.public_ip
}

output "gcp_public_ip" {
    value = google_compute_instance.gcp_vm.network_interface[0].access_config[0].nat_ip
}

output "private_key_path" {
    value       = local_file.private_key.filename
    description = "Chemin de la clé privée générée"
}