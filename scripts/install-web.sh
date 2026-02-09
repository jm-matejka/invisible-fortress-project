#!/bin/bash
sudo dnf update -y
sudo dnf install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo "<h1>Invisible Fortress - Public Server</h1>" | sudo tee /usr/share/nginx/html/index.html