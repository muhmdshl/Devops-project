# Devops-project
# End-to-End Infrastructure Automation & CI/CD Pipeline

## Overview
This project automates AWS infrastructure provisioning, server configuration, and application deployment using Terraform, Ansible, Docker, and Jenkins.

## Architecture
- **Terraform** provisions 3 EC2 instances (default VPC)
- **Ansible** configures Java, Python, MySQL, and Jenkins
- **Jenkins** automates Dockerized website deployment from GitHub
- **Docker** container runs on port 99

## Steps to Reproduce
1. Clone this repo.
2. Update AWS credentials & keypair in Terraform.
3. `terraform init && terraform apply`
4. Update Ansible `inventory` with public IPs from Terraform output.
5. `ansible-playbook -i inventory playbook.yml`
6. Access Jenkins on `<Slave2-IP>:8080`
7. Create pipeline with provided `Jenkinsfile`.
8. Push changes to GitHub to trigger redeployment.

## Tech Stack
- AWS EC2
- Terraform
- Ansible
- Jenkins
- Docker
- GitHub Webhooks
