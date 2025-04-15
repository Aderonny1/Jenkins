
#!/bin/bash

# Author: Aderonke
# Date: 14/04/2025
# Description: Installing Jenkins on RHEL 7/8/9, CentOS 7/8/9,ubuntu or Amazon Linux OS.
# Note: This script can be used as user-data when launching your EC2 VM.

# Set the timezone
sudo timedatectl set-timezone America/New_York

# Set the hostname
sudo hostnamectl set-hostname jenkins

# Install necessary packages
sudo yum install -y wget git nano tree vim unzip

# Add Jenkins repository
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import Jenkins GPG key
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Upgrade packages
sudo yum upgrade -y

# Install Java (required for Jenkins)
sudo yum install -y fontconfig java-17-openjdk

# Install Jenkins
sudo yum install -y jenkins

# Reload systemd manager configuration
sudo systemctl daemon-reexec

# Enable and start Jenkins service
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Check Jenkins service status
sudo systemctl status jenkins

# Switch to ec2-user
sudo su - ec2-user

