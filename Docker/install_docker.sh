#!/bin/bash

# Check if Docker is already installed
if docker --version &>/dev/null; then
  echo "Docker is already installed."
  exit 0
fi

# Update package repositories
echo "Updating package repositories..."
sudo apt-get update

# Install dependencies
echo "Installing dependencies..."
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker GPG key
echo "Adding Docker GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update package repositories (again) with the new repository
echo "Updating package repositories..."
sudo apt-get update

# Install Docker
echo "Installing Docker..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Manually add user to docker group
echo "Adding user to docker group..."
usermod -aG docker ubuntu
sudo usermod -aG docker $USER

# Install docker-compose
echo "Installing Docker Compose..."
curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


# Verify installation
if docker --version &>/dev/null; then
  echo "Docker installation completed successfully."
else
  echo "Failed to install Docker."
fi