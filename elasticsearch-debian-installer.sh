#!/bin/bash

# Download and install the public signing key
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg

# Install the apt-transport-https package
sudo apt-get install apt-transport-https

# Save the repository definition to /etc/apt/sources.list.d/elastic-9.x.list
echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/9.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-9.x.list

# To install the latest version of Elasticsearch
sudo apt-get update && sudo apt-get install elasticsearch

# To install a specific version of Elasticsearch
# sudo apt-get update && sudo apt-get install elasticsearch=<SPECIFIC.VERSION.NUMBER>
