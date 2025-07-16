resource "aws_instance" "aws_vm" {
    ami = "ami-020cba7c55df1f615" # Ubuntu Server
    instance_type = "t2.micro"
    key_name      = aws_key_pair.aws_key.key_name
    }

resource "aws_key_pair" "aws_key" {
    key_name   = "terraform-aws-key"
    public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "google_compute_instance" "gcp_vm" {
    name         = "my-vm"
    machine_type = "e2-medium"
    zone         = var.gcp_zone

    boot_disk {
        initialize_params {
            image = "ubuntu-os-cloud/ubuntu-2204-lts"
        }
    }

    network_interface {
        network = "default"
        access_config {}
    }

    metadata = {
        ssh-keys = "terraform:${tls_private_key.ssh_key.public_key_openssh}"
    }
}

resource "tls_private_key" "ssh_key" {
    algorithm = "RSA"
    rsa_bits  = 4096
}

resource "local_file" "private_key" {
    content         = tls_private_key.ssh_key.private_key_pem
    filename        = "${path.module}/terraform-key.pem"
    file_permission = "0600"
}