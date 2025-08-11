provider "aws" {
  region = "us-east-1"
}

variable "instance_count" {
  default = 3
}

variable "ami_id" {
  default = "ami-0c02fb55956c7d316" # Ubuntu 20.04 in us-east-1
}

variable "instance_type" {
  default = "t2.micro"
}

resource "aws_instance" "slaves" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = "your-keypair" # Change to your AWS keypair
  vpc_security_group_ids = ["sg-xxxxxxxx"] # Change to your SG

  user_data = count.index == 0 ? file("${path.module}/scripts/ansible_master_setup.sh") : ""

  tags = {
    Name = "Slave-${count.index + 1}"
  }
}

output "public_ips" {
  value = aws_instance.slaves[*].public_ip
}
