## Prerequisites 📋

- Amazon EC2 instance running Amazon Linux 2 or Amazon Linux 2023.
- SSH access to the EC2 instance.
- Basic knowledge of AWS and Linux commands.

## Steps

### 1. Launch an EC2 Instance 🌐

- **OS**: Amazon Linux 2 (or Amazon Linux 2023)
- **Instance Type**: t2.micro (or higher as per your needs)
- **Security Group**:
  - **SSH (port 22)**: Your IP
  - **HTTP (port 80)**: Anywhere (0.0.0.0/0)

### 2. Connect to the EC2 Instance 💻

Connect to your EC2 instance using SSH:
```bash
ssh -i "YourKey.pem" ec2-user@<Public-IP>
```

### 3. Install Required Dependencies 🔧

Update your system and install required packages:
```bash
sudo yum update -y
sudo yum install -y gcc glibc glibc-common wget unzip httpd php gcc-c++ make gettext libjpeg-devel libpng-devel gd gd-devel perl postfix openssl-devel net-snmp-utils
```
### Verify Prerequisites 
```bash
sudo yum install -y gcc glibc glibc-common perl httpd php wget gd gd-devel unzip
```

### Clean Previous Build
```bash
sudo yum install -y gcc glibc glibc-common perl httpd php wget gd gd-devel unzip
```

### 4. Download and Extract Nagios Core 📥

Navigate to the `/tmp` directory and download the latest version of Nagios:
```bash
cd /tmp
wget https://github.com/NagiosEnterprises/nagioscore/releases/download/nagios-4.4.13/nagios-4.4.13.tar.gz
tar -zxvf nagios-4.4.13.tar.gz
cd nagios-4.4.13
```

### 5. Configure, Build, and Install Nagios ⚙️

Run the following commands to configure and install Nagios:
```bash
sudo ./configure --with-command-group=nagcmd
sudo make all
sudo make install
sudo make install-init
sudo make install-commandmode
sudo make install-config
sudo make install-webconf
```

### Create Nagios Service
```bash
sudo nano /etc/systemd/system/nagios.service
```
### add following ..
```bash
[Unit]
Description=Nagios Core Monitoring Daemon
Documentation=https://www.nagios.org/documentation
After=network.target httpd.service

[Service]
ExecStart=/usr/local/nagios/bin/nagios /usr/local/nagios/etc/nagios.cfg
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=always

[Install]
WantedBy=multi-user.target
```

### Enable and Start Nagios
```bash
sudo systemctl daemon-reload
sudo systemctl enable nagios
sudo systemctl start nagios
```

### 6. Set Up Nagios Admin User 🛠️

Create a user for the Nagios web interface:
```bash
sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
```
You will be prompted to set a password for the `nagiosadmin` user.

### 7. Install and Start Apache Web Server 🌐

Enable and start Apache (HTTP server) to serve the Nagios web interface:
```bash
sudo systemctl enable httpd
sudo systemctl start httpd
```

### 8. Start Nagios Service 🟢

Enable and start the Nagios service:
```bash
sudo systemctl enable nagios
sudo systemctl start nagios
```

### 9. Configure Security Group for HTTP Access 🔓

Make sure port 80 (HTTP) is open in your EC2 security group:
1. Go to **AWS Console** > **EC2** > **Security Groups**.
2. Edit the security group associated with the instance.
3. Add a new inbound rule:
   - **Type**: HTTP
   - **Port Range**: 80
   - **Source**: Anywhere (0.0.0.0/0)

### 10. Access Nagios in the Web Browser 🌍

Open a web browser and visit the following URL:
```
http://<Public-IP>/nagios
```
- Login with:
  - **Username**: `nagiosadmin`
  - **Password**: (The password you set in Step 6)

### 11. Optional: Secure with HTTPS (Optional)🔒

If you want to secure Nagios with HTTPS, you can use a **SSL certificate** from **Let's Encrypt** or generate a self-signed certificate. Let me know if you need help with this setup!

---

## Troubleshooting 🔍

- **Apache Not Starting**: Ensure that Apache is installed and running:
  ```bash
  sudo systemctl status httpd
  ```
  If not running, start Apache:
  ```bash
  sudo systemctl start httpd
  ```

- **Nagios Not Starting**: Check the status of the Nagios service:
  ```bash
  sudo systemctl status nagios
  ```

---

## Conclusion 🎉

You have successfully installed and set up Nagios on an EC2 instance. Use the web interface to monitor services and hosts on your network.

For further details, check the official Nagios documentation: [Nagios Documentation](https://www.nagios.org/documentation/)

```

You can save the above content to a file named `README.md`. This provides clear and structured instructions for installing Nagios on EC2 and accessing it through a web browser. Let me know if you need any changes!
