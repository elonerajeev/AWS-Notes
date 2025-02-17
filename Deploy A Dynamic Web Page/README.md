To deploy a **dynamic** website (a static frontend with a **database backend**) on **AWS EC2**, you need to:

1. **Launch an EC2 instance** for hosting the website and connecting to the database.  
2. **Install and configure a web server** (Apache/NGINX).  
3. **Set up a database** (MySQL/MariaDB/PostgreSQL).  
4. **Connect the website to the database** for dynamic content.  
5. **Open necessary ports** for public access.  

---

# **🚀 Step 1: Launch an AWS EC2 Instance**
1. **Open the AWS Management Console** → Go to **EC2 Dashboard**.  
2. Click **Launch Instance**:
   - **AMI**: Choose **Amazon Linux 2** or **Ubuntu 22.04** (for better support).
   - **Instance Type**: Select **t2.micro** (Free Tier eligible).
   - **Storage**: 8 GB (sufficient for basic websites).
   - **Security Group**: Ensure these ports are open:
     - **HTTP (80)** – for website access.
     - **SSH (22)** – for remote access.
     - **MySQL (3306)** – if you want remote database access.
3. Download the **.pem** key file for SSH access.  

---

# **🔗 Step 2: Connect to Your EC2 Instance**
1. Open a terminal and connect using SSH:
   ```bash
   ssh -i your-key.pem ec2-user@your-ec2-public-ip   # Amazon Linux
   ssh -i your-key.pem ubuntu@your-ec2-public-ip     # Ubuntu
   ```

---

# **🛠️ Step 3: Set Up the Web Server**
### For **Apache** (Amazon Linux 2 / Ubuntu):
1. Update and install Apache:
   ```bash
   sudo yum update -y           # Amazon Linux
   sudo apt update && sudo apt install apache2 -y  # Ubuntu
   ```
2. Start and enable the service:
   ```bash
   sudo systemctl start httpd   # Amazon Linux
   sudo systemctl enable httpd
   sudo systemctl start apache2 # Ubuntu
   sudo systemctl enable apache2
   ```
3. Verify Apache is running:
   ```bash
   sudo systemctl status httpd    # Amazon Linux
   sudo systemctl status apache2  # Ubuntu
   ```

---

# **🗂️ Step 4: Install and Configure a Database**
### For **MySQL** (or MariaDB – Amazon Linux default):
1. **Install MySQL**:
   ```bash
   sudo yum install mariadb-server -y    # Amazon Linux
   sudo apt install mysql-server -y      # Ubuntu
   ```

2. **Start MySQL Service**:
   ```bash
   sudo systemctl start mariadb   # Amazon Linux
   sudo systemctl enable mariadb
   sudo systemctl start mysql     # Ubuntu
   sudo systemctl enable mysql
   ```

3. **Secure the Database**:
   ```bash
   sudo mysql_secure_installation
   ```
   - Set a **root password**.
   - Remove anonymous users, disallow remote login, etc.

---

# **🛢️ Step 5: Create a Database and User**
1. **Access the MySQL Shell**:
   ```bash
   sudo mysql -u root -p
   ```

2. **Create a Database**:
   ```sql
   CREATE DATABASE website_db;
   ```

3. **Create a User and Grant Permissions**:
   ```sql
   CREATE USER 'webuser'@'localhost' IDENTIFIED BY 'yourpassword';
   GRANT ALL PRIVILEGES ON website_db.* TO 'webuser'@'localhost';
   FLUSH PRIVILEGES;
   EXIT;
   ```

---

# **🌐 Step 6: Upload and Connect Website Files**
### 1. **Move to the Web Directory**:
   ```bash
   cd /var/www/html   # Amazon Linux
   cd /var/www/html   # Ubuntu
   ```

### 2. **Upload Website Files**:
   You can upload files using **SCP** (from your local machine):
   ```bash
   scp -i your-key.pem -r /path/to/website ec2-user@your-ec2-public-ip:/var/www/html
   ```

   Or manually create a sample page:
   ```bash
   sudo nano index.php
   ```

### 3. **Connect to the Database (Example `index.php` file)**:
```php
<?php
$host = "localhost";
$username = "webuser";
$password = "yourpassword";
$database = "website_db";

// Create a connection
$conn = new mysqli($host, $username, $password, $database);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully to MySQL database!";

// Fetch data from database
$result = $conn->query("SELECT * FROM users");

while($row = $result->fetch_assoc()) {
    echo "User: " . $row["name"] . "<br>";
}
?>
```

---

# **🔍 Step 7: Adjust Permissions**
1. **Give Apache Ownership of Web Files**:
   ```bash
   sudo chown -R apache:apache /var/www/html  # Amazon Linux
   sudo chown -R www-data:www-data /var/www/html  # Ubuntu
   ```

2. **Set Proper Permissions**:
   ```bash
   sudo chmod -R 755 /var/www/html
   ```

---

# **🌐 Step 8: Access the Website**
1. Open a browser and go to:
   ```
   http://your-ec2-public-ip
   ```
2. If your setup is correct, you will see the **"Connected successfully"** message.

---

# **📊 Step 9: (Optional) Configure Remote Database Access**
If you want to allow external connections to the MySQL database:

1. **Modify MySQL Configuration**:
   Edit the MySQL bind address:
   ```bash
   sudo nano /etc/my.cnf   # Amazon Linux
   sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf  # Ubuntu
   ```

   Update:
   ```
   bind-address = 0.0.0.0
   ```

2. **Allow External Access**:
   ```sql
   GRANT ALL PRIVILEGES ON website_db.* TO 'webuser'@'%' IDENTIFIED BY 'yourpassword';
   FLUSH PRIVILEGES;
   ```

3. **Restart MySQL**:
   ```bash
   sudo systemctl restart mariadb   # Amazon Linux
   sudo systemctl restart mysql     # Ubuntu
   ```

---

# **🛡️ Step 10: Enable SSL (Optional for HTTPS)**
1. **Install Certbot** (for Let's Encrypt):
   ```bash
   sudo yum install epel-release -y
   sudo yum install certbot python3-certbot-apache -y
   ```

2. **Generate SSL Certificate**:
   ```bash
   sudo certbot --apache
   ```

---

# ✅ **Summary**
You have successfully deployed a **dynamic website** on AWS EC2 using:
1. **Apache** for serving your site.
2. **MySQL** for handling the database.
3. **PHP** for dynamic content.

🚀 **Your website is live and ready for production!**
