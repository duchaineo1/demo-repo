#/bin/sh
sudo apt-get update 
sudo apt-get install -y git curl


curl -s https://api.github.com/repos/Lusitaniae/apache_exporter/releases/latest | grep browser_download_url | grep linux-amd64 | cut -d '"' -f 4 | wget -qi -

tar xvf apache_exporter-*.linux-amd64.tar.gz
sudo cp apache_exporter-*.linux-amd64/apache_exporter /usr/local/bin
sudo chmod +x /usr/local/bin/apache_exporter

git clone https://github.com/duchaineo1/demo-repo.git

sudo cp ./demo-repo/blog-monitoring/apache_exporter/apache_exporter.service /etc/systemd/system/apache_exporter.service

sudo useradd -s /sbin/nologin --system -g prometheus prometheus

sudo systemctl daemon-reload
sudo systemctl enable apache_exporter.service
sudo systemctl start apache_exporter.service