dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y
cp catalouge.service  /etc/systemd/system/catalogue.service
cp mongo.repo /etc/yum.repos.d/mongo.repo
useradd roboshop

mkdir /app
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip
cd /app
unzip /tmp/catalogue.zip
cd /app
npm install
systemctl enable catalogue
systemctl start catalogue
dnf install mongodb-mongosh -y