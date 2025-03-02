# Terraform Dynamic Website Deployment with EC2

This project demonstrates how to use **Terraform** to deploy a dynamic website infrastructure on **AWS EC2**. The infrastructure consists of two EC2 instances:
1. **Web Server (Nginx)**: Hosts a static website that explains Terraform.
2. **Database Server (MySQL)**: Pre-configured for future use (e.g., dynamic website, e-commerce site).

---

## **Project Overview**

In this project, we use Terraform to:
- Launch two EC2 instances: one for the web server and one for the database server.
- Configure security groups to allow HTTP/SSH traffic for the web server and MySQL traffic for the database server.
- Deploy a static website on the web server that explains what Terraform is and its uses.

---

## **Technologies Used**

- **Terraform**: Infrastructure as Code (IaC) tool for provisioning resources.
- **AWS EC2**: Virtual machines (instances) running on AWS.
- **Nginx**: Web server running on the web server instance.
- **MySQL**: Database server (configured but not yet connected to the web server).