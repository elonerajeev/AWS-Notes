# **Deploying a Static Website on AWS EC2 Instance**

Hosting a static website on an **AWS EC2** instance is a straightforward process. A static website consists of **HTML, CSS, and JavaScript** files without requiring a backend server. This guide provides step-by-step instructions for deploying a static website on an EC2 instance.

---

## **Step 1: Launch an EC2 Instance**
1. **Log in to AWS Console** → Open [AWS EC2 Dashboard](https://aws.amazon.com/ec2/).
2. **Launch an EC2 Instance**:
   - Click **Launch Instance**.
   - Choose an **Amazon Linux 2** or **Ubuntu 20.04** AMI.
   - Select **t2.micro** (Free Tier eligible).
   - Configure storage (default 8GB is sufficient).
   - Add a **Security Group** with the following rules:
     - **HTTP (port 80)** → Allow from **Anywhere (0.0.0.0/0)**
     - **SSH (port 22)** → Allow from **your IP**
   - Launch with a key pair (download **.pem** file).

---

## **Step 2: Connect to the EC2 Instance**
1. Open **Terminal (Mac/Linux) or Git Bash (Windows)**.
2. Navigate to the folder where your **.pem key file** is located.
3. Run the SSH command:
   ```bash
   ssh -i your-key.pem ec2-user@your-ec2-public-ip  # (Amazon Linux)
   ssh -i your-key.pem ubuntu@your-ec2-public-ip  # (Ubuntu)
   ```

---

## **Step 3: Install and Configure a Web Server**
### **For Amazon Linux (Apache)**
1. **Update system packages**:
   ```bash
   sudo yum update -y
   ```
2. **Install Apache Web Server (httpd)**:
   ```bash
   sudo yum install httpd -y
   ```
3. **Start Apache and enable it on boot**:
   ```bash
   sudo systemctl start httpd
   sudo systemctl enable httpd
   ```

### **For Ubuntu (NGINX)**
1. **Update system packages**:
   ```bash
   sudo apt update -y
   ```
2. **Install NGINX Web Server**:
   ```bash
   sudo apt install nginx -y
   ```
3. **Start NGINX and enable it on boot**:
   ```bash
   sudo systemctl start nginx
   sudo systemctl enable nginx
   ```

---

## **Step 4: Upload Website Files**
1. **Move to the Web Root Directory**:
   - **For Apache**: `/var/www/html/`
   - **For NGINX**: `/usr/share/nginx/html/`
   
   ```bash
   cd /var/www/html  # For Apache
   cd /usr/share/nginx/html  # For NGINX
   ```

2. **Remove the Default Files**:
   ```bash
   sudo rm -rf *
   ```

3. **Upload Your Website Files**:
   - You can manually **create an index.html** file:
     ```bash
     sudo nano index.html
     ```
     Paste the following simple HTML:
     ```html
     <!DOCTYPE html>
     <html>
     <head>
         <title>My Static Website</title>
     </head>
     <body>
         <h1>Welcome to My Static Website on AWS EC2!</h1>
     </body>
     </html>
     ```
     Save the file (**CTRL + X → Y → ENTER**).

   - Alternatively, **upload files from your local machine** using SCP:
     ```bash
     scp -i your-key.pem -r /path/to/your-website/ ec2-user@your-ec2-public-ip:/var/www/html/
     ```

---

## **Step 5: Adjust Permissions**
1. **Grant the Web Server Permission to Access Files**:
   ```bash
   sudo chmod -R 755 /var/www/html/
   sudo chown -R apache:apache /var/www/html/  # For Apache
   sudo chown -R www-data:www-data /usr/share/nginx/html/  # For NGINX
   ```

---

## **Step 6: Open Your Website in Browser**
- Get your **EC2 Public IP** from AWS Dashboard.
- Open **http://your-ec2-public-ip** in a browser.
- Your static website should now be live! 🎉

---

## **Step 7: Optional - Set Up a Custom Domain (Using Route 53)**
If you own a domain, you can link it to your EC2 instance:
1. **Go to Route 53** → Create a **hosted zone** for your domain.
2. **Add an A Record** pointing to your **EC2 Public IP**.
3. Wait for DNS propagation (~5-10 minutes).
4. Your website will be accessible at **yourdomain.com**!

---

## **Conclusion**
You have successfully deployed a **static website on AWS EC2** using either **Apache (Amazon Linux)** or **NGINX (Ubuntu)**. 🚀
