#!/usr/bin/env bash
# Set-up web server for deployment

sudo apt-get -y update
sudo apt-get -y install nginx

sudo mkdir -p /data/web_static/shared/
sudo mkdir -p /data/web_static/releases/test/

echo -e "<html>\n\t<head>\n\t</head>\n\t<body>\n\t\tChezzoManizzo\n\t</body>\n</html>" >/data/web_static/releases/test/index.html

sudo ln -sf /data/web_static/releases/test/ /data/web_static/current

sudo chown -R ubuntu:ubuntu /data

new_str="location /hbnb_static {\nalias /data/web_static/current;\n}"
sudo sed -i "/# Only/ i $new_str" /etc/nginx/sites-enabled/default

sudo service nginx restart
