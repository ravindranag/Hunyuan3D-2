#!/bin/bash

# Retrieve the public IP and token
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
PUBLIC_IPV4=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/public-ipv4)

# Write the environment variables to a file that will be sourced for new shells
sudo echo "export PUBLIC_IPV4=$PUBLIC_IPV4" > /etc/profile.d/gradio_app_env.sh
sudo echo "export TOKEN=$TOKEN" >> /etc/profile.d/gradio_app_env.sh

# Make the new script executable
chmod +x /etc/profile.d/gradio_app_env.sh
