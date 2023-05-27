#!/bin/bash

# Check if Ansible is already installed
if ansible --version &>/dev/null; then
  echo "Ansible is already installed."
  exit 0
fi

# Update package repositories
echo "Updating package repositories..."
sudo apt-get update

# Install dependencies
echo "Installing dependencies..."
sudo apt-get install -y software-properties-common

# Add Ansible repository
echo "Adding Ansible repository..."
sudo apt-add-repository -y ppa:ansible/ansible

# Update package repositories (again) with the new repository
echo "Updating package repositories..."
sudo apt-get update

# Install Ansible
echo "Installing Ansible..."
sudo apt-get install -y ansible

# Verify installation
if ansible --version &>/dev/null; then
  echo "Ansible installation completed successfully."
else
  echo "Failed to install Ansible."
fi
