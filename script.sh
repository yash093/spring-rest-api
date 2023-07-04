#!/bin/bash

#####################################
# Description: This script automates the process of running a Dockerized application.
# Author: Yash
# Version: v1
# Date: 4/7/2023
#####################################

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed on your system."
    read -p "Would you like to install Docker now? (y/n): " choice
    if [ "$choice" == "y" ]; then
        echo " "
        echo "Installing Docker..."
        sudo apt update
        sudo apt install docker.io -y
        sudo usermod -aG docker $USER
        echo " "
        echo "Docker has been installed. Please log out and back in to apply the changes."
        echo "After Logging back run the script again for next process"
    else
        echo "Exiting the script. Install Docker manually to continue."
        exit 1
    fi
fi

# Pull the Docker image
echo "Pulling the Docker image..."
docker pull yash0903/spring-api:latest

# Check if the container already exists
if docker ps -a --format '{{.Names}}' | grep -q '^spring-api-container$'; then
    echo "The container 'spring-api-container' already exists."
    read -p "Would you like to remove the existing container and recreate it? (y/n): " choice
    if [ "$choice" == "y" ]; then
        docker stop spring-api-container
        docker rm spring-api-container
    else
        echo "Exiting the script."
        exit 0
    fi
fi

# Create and run the Docker container
echo " "
echo "Creating and running the container..."
docker run -d --name spring-api-container -p 8080:8080 yash0903/spring-api

echo "The Docker container 'spring-api-container' has been created and is now running."
echo " "
echo "You can access the application at: http://localhost:8080/home"