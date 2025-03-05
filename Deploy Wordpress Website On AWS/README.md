# **📌 Deploying a WordPress Website on AWS (Step-by-Step Guide)**  

Deploying **WordPress on AWS** allows you to build a **scalable, secure, and high-performance** website using AWS services. This guide walks you through the **entire process**, covering **EC2 setup, database configuration, WordPress installation, security enhancements, and optimization techniques**.  

---

# **🔹 Prerequisites**  
Before starting, ensure you have:  
✅ **AWS Account** with access to EC2, RDS, and S3.  
✅ **Basic knowledge of Linux commands** and AWS CLI.  
✅ **SSH Key Pair** to access the EC2 instance.  
✅ **A domain name (optional)** for configuring DNS with Route 53.  

---

# **🚀 Step 1: Launch an AWS EC2 Instance for WordPress**  

### **1️⃣ Choose an AMI (Amazon Machine Image)**  
1. Go to **AWS Management Console** → Navigate to **EC2**.  
2. Click **Launch Instance** → Select an **AMI**:  
   - Choose **Ubuntu 22.04 LTS** (or **Amazon Linux 2**).  

### **2️⃣ Choose Instance Type**  
- **t2.micro** (Free Tier eligible) for small websites.  
- **t2.medium or t3.medium** for better performance.  

### **3️⃣ Configure Security Groups**  
- Allow the following **inbound rules**:  
  - **HTTP (80)** → Open to `0.0.0.0/0` (for public access).  
  - **HTTPS (443)** → Open to `0.0.0.0/0` (for SSL).  
  - **SSH (22)** → Open to **your IP** for security.  

### **4️⃣ Create Key Pair & Launch Instance**  
- Download the **.pem key file** for SSH access.  

---

# **🔹 Step 2: Connect to EC2 Instance & Update System**  

### **1️⃣ SSH into the EC2 Instance**  
```sh
ssh -i your-key.pem ubuntu@your-ec2-public-ip
```

### **2️⃣ Update System Packages**  
```sh
sudo apt update && sudo apt upgrade -y
```

---

# **🔹 Step 3: Install Apache, MySQL & PHP (LAMP Stack)**  

### **1️⃣ Install Apache Web Server**  
```sh
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
```

### **2️⃣ Install MySQL Database Server**  
```sh
sudo apt install mysql-server -y
sudo systemctl start mysql
sudo systemctl enable mysql
```

### **3️⃣ Secure MySQL**  
```sh
sudo mysql_secure_installation
```
- Set **root password**.  
- Remove anonymous users.  
- Disable remote root login.  

### **4️⃣ Install PHP & Required Extensions**  
```sh
sudo apt install php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc -y
```

### **5️⃣ Restart Apache**  
```sh
sudo systemctl restart apache2
```

---

# **🔹 Step 4: Create a MySQL Database for WordPress**  

### **1️⃣ Login to MySQL**  
```sh
sudo mysql -u root -p
```

### **2️⃣ Create WordPress Database & User**  
```sql
CREATE DATABASE wordpress_db;
CREATE USER 'wordpress_user'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wordpress_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

---

# **🔹 Step 5: Install & Configure WordPress**  

### **1️⃣ Download WordPress**  
```sh
cd /var/www/html
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xvzf latest.tar.gz
sudo rm latest.tar.gz
```

### **2️⃣ Set File Permissions**  
```sh
sudo chown -R www-data:www-data /var/www/html/wordpress
sudo chmod -R 755 /var/www/html/wordpress
```

### **3️⃣ Configure WordPress Database Connection**  
```sh
cd /var/www/html/wordpress
sudo cp wp-config-sample.php wp-config.php
sudo nano wp-config.php
```
- Update **Database Name**, **Username**, and **Password**:
```php
define('DB_NAME', 'wordpress_db');
define('DB_USER', 'wordpress_user');
define('DB_PASSWORD', 'your_password');
define('DB_HOST', 'localhost');
```
- Save and exit (**CTRL+X → Y → ENTER**).  

---

# **🔹 Step 6: Configure Apache for WordPress**  

### **1️⃣ Create a Virtual Host for WordPress**  
```sh
sudo nano /etc/apache2/sites-available/wordpress.conf
```

Add the following content:
```apache
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/wordpress
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```
Save the file.

### **2️⃣ Enable the Site & Restart Apache**  
```sh
sudo a2ensite wordpress
sudo a2enmod rewrite
sudo systemctl restart apache2
```

### **3️⃣ Allow HTTP & HTTPS Traffic**  
```sh
sudo ufw allow 'Apache Full'
```

---

# **🔹 Step 7: Setup SSL for HTTPS (Let's Encrypt)**  

### **1️⃣ Install Certbot for SSL**  
```sh
sudo apt install certbot python3-certbot-apache -y
```

### **2️⃣ Obtain SSL Certificate**  
```sh
sudo certbot --apache
```
- Enter **your domain name** (e.g., `yourwebsite.com`).  
- Certbot will configure **HTTPS automatically**.  

---

# **🔹 Step 8: Access WordPress & Complete Installation**  

1. Open **your browser** and go to:  
   ```
   http://your-ec2-public-ip
   ```
2. Follow the **WordPress installation wizard**:
   - Choose **Language**.
   - Set **Site Title, Username, and Password**.
   - Configure **Admin Account**.
   - Click **Install WordPress**.

🎉 **WordPress is now installed on AWS!** 🎉  

---

# **🔹 Step 9: Optional - Set Up AWS RDS for WordPress Database**  

Instead of **local MySQL**, you can use **AWS RDS** for better scalability.

### **1️⃣ Create an RDS MySQL Database**
```sh
aws rds create-db-instance \
    --db-instance-identifier wordpress-db \
    --db-instance-class db.t2.micro \
    --engine mysql \
    --allocated-storage 20 \
    --master-username admin \
    --master-user-password yourpassword
```

### **2️⃣ Update WordPress Database Connection**
Modify `wp-config.php` and change:
```php
define('DB_HOST', 'your-rds-endpoint.amazonaws.com');
```

---

# **🔹 Step 10: Optimize WordPress Performance on AWS**  

✅ **Enable Caching**: Install **W3 Total Cache** plugin.  
✅ **Use CloudFront CDN**: Serve static content faster.  
✅ **Enable Auto Scaling**: Use AWS **Auto Scaling Groups**.  
✅ **Backup to S3**: Store media files on **Amazon S3**.  

---

# **📌 Conclusion**  
🎯 **You have successfully deployed WordPress on AWS EC2** with:  
✔️ **Apache, MySQL, and PHP** configured correctly.  
✔️ **SSL secured HTTPS** enabled with **Let's Encrypt**.  
✔️ **WordPress optimized for AWS performance**.  
✔️ **Optional RDS setup for scalable database hosting**.  

🚀 **Your WordPress website is now live on AWS!** 🎯