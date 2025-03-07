# 🌍 Complete AWS Guide: Services, Deployment & Best Practices 🚀

## **📖 Overview**
This repository contains a **detailed guide** to learning, configuring, and deploying applications on **Amazon Web Services (AWS)**.  
Whether you are a **beginner** or an **experienced DevOps engineer**, this guide provides **step-by-step instructions** for key AWS services, security best practices, and real-world implementations.  

---

## **📚 Table of Contents**
1. [💡 Introduction to AWS](#-introduction-to-aws)
2. [🔐 AWS IAM (Identity & Access Management)](#-aws-iam-identity--access-management)
3. [💾 AWS EC2 (Elastic Compute Cloud)](#-aws-ec2-elastic-compute-cloud)
4. [🗃️ AWS EBS (Elastic Block Store)](#-aws-ebs-elastic-block-store)
5. [📦 AWS AMI (Amazon Machine Image)](#-aws-ami-amazon-machine-image)
6. [⚖️ AWS Elastic Load Balancer & Auto Scaling Group](#-aws-elastic-load-balancer--auto-scaling-group)
7. [🗂️ AWS S3 (Simple Storage Service)](#-aws-s3-simple-storage-service)
8. [💽 AWS RDS (Relational Database Service)](#-aws-rds-relational-database-service)
9. [📌 AWS DynamoDB (NoSQL Database)](#-aws-dynamodb-nosql-database)
10. [⚡ AWS Lambda (Serverless Computing)](#-aws-lambda-serverless-computing)
11. [🌎 AWS Route 53 (DNS Management)](#-aws-route-53-dns-management)
12. [🚀 AWS CloudFront (CDN)](#-aws-cloudfront-content-delivery-network)
13. [📲 AWS Amplify (Frontend & Backend Management)](#-aws-amplify-frontend--backend-management)
14. [🛠️ AWS ECS (Elastic Container Service)](#-aws-ecs-elastic-container-service)
15. [🎯 AWS EKS (Elastic Kubernetes Service)](#-aws-eks-elastic-kubernetes-service)
16. [💻 Virtualization & AWS](#-virtualization--aws)
17. [📊 AWS CloudWatch (Monitoring & Logging)](#-aws-cloudwatch-monitoring--logging)
18. [📜 ELK Stack (Elasticsearch, Logstash, Kibana)](#-elk-stack-elasticsearch-logstash-kibana)
19. [🌐 Deploying a Static Website on AWS EC2](#-deploying-a-static-website-on-aws-ec2)
20. [📂 Deploying a Dynamic Website with a Database](#-deploying-a-dynamic-website-with-a-database)
21. [📌 Conclusion & Best Practices](#-conclusion--best-practices)
22. [📌 Setting up Kubernetes Master and Worker Node on AWS](#-Setting-up-Kubernetes-Master-and-Worker-Node-on-AWS)
23. [💻 Deploying a WordPress Website on AWS](#-Deploying-a-WordPress-Website-on-AWS)

---

## **💡 Introduction to AWS**
Amazon Web Services (**AWS**) is a cloud platform that provides **on-demand computing, storage, networking, and security** services.

### 🔹 **Key Features of AWS:**
✔️ **Scalability** – Scale applications dynamically.  
✔️ **Security** – Advanced IAM roles & security groups.  
✔️ **Pay-as-you-go** – Cost-effective pricing model.  
✔️ **High Availability** – Multi-region deployment.  

---

## **🔐 AWS IAM (Identity & Access Management)**
IAM is used to **manage access** to AWS resources securely.

### 🛠 **Key IAM Components:**
- **Users** – Individual AWS users.
- **Groups** – Collection of users with similar permissions.
- **Roles** – Used for cross-account access.
- **Policies** – JSON documents that define permissions.

🔹 **🔒 Best Practices:**  
✔️ Enable **MFA (Multi-Factor Authentication)**.  
✔️ Follow **Least Privilege Principle**.  
✔️ Regularly **audit IAM roles**.

---

## **💾 AWS EC2 (Elastic Compute Cloud)**
EC2 provides **virtual machines (instances)** to host applications.

### 🚀 **Creating an EC2 Instance:**
```sh
aws ec2 run-instances --image-id ami-12345678 --count 1 --instance-type t2.micro --key-name MyKeyPair --security-groups MySecurityGroup
```
✔️ Use **Elastic IP** for static public IP.  
✔️ Configure **Security Groups** to allow HTTP, SSH, etc.

---

## **🗃️ AWS EBS (Elastic Block Store)**
EBS provides **persistent storage volumes** for EC2.

### 🛠 **Creating & Attaching an EBS Volume:**
```sh
aws ec2 create-volume --availability-zone us-east-1a --size 10
aws ec2 attach-volume --volume-id vol-12345678 --instance-id i-12345678 --device /dev/sdf
```

---

## **📦 AWS AMI (Amazon Machine Image)**
AMI is used to create **custom images** for launching instances.

### 🚀 **Creating an AMI:**
```sh
aws ec2 create-image --instance-id i-12345678 --name "MyAMI"
```

---

## **⚖️ AWS Elastic Load Balancer & Auto Scaling Group**
AWS **ELB** distributes traffic across instances, and **Auto Scaling Groups** adjust the instance count.

### 🚀 **Creating a Load Balancer:**
```sh
aws elb create-load-balancer --load-balancer-name myELB --listeners "Protocol=HTTP,LoadBalancerPort=80,InstanceProtocol=HTTP,InstancePort=80"
```

---

## **🗂️ AWS S3 (Simple Storage Service)**
AWS S3 stores **static files, images, and backups**.

### 🚀 **Uploading a File to S3:**
```sh
aws s3 cp myfile.txt s3://mybucket/
```

---

## **💽 AWS RDS (Relational Database Service)**
RDS provides **managed relational databases** like MySQL & PostgreSQL.

### 🚀 **Creating an RDS Instance:**
```sh
aws rds create-db-instance --db-instance-identifier mydb --db-instance-class db.t2.micro --engine mysql --allocated-storage 20
```

---

## **⚡ AWS Lambda (Serverless Computing)**
AWS Lambda runs **functions without servers**.

### 🚀 **Deploying a Lambda Function:**
```sh
aws lambda create-function --function-name MyLambdaFunction --runtime python3.8 --role myIAMRole --handler lambda_function.lambda_handler
```

---

## **📜 ELK Stack (Elasticsearch, Logstash, Kibana)**
ELK is used for **log monitoring**.

### 🚀 **Deploying ELK on AWS EC2:**
```sh
git clone https://github.com/mrAbhishek1105/ELK-stack.git
cd ELK-stack
bash setup.sh
```

---

## **🌐 Deploying a Static Website on AWS EC2**
```sh
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>My Static Website</h1>" | sudo tee /var/www/html/index.html
```

---

## **📂 Deploying a Dynamic Website with a Database**
```sh
# Install MySQL
sudo yum install mysql -y

# Configure the Database
mysql -u root -p
CREATE DATABASE mydb;
```
✔️ Use **Node.js, PHP, or Python** for backend logic.

---


## ** Setting up Kubernetes Master and Worker Node on AWS **
```sh
Starting ..........
```

## **📌 Conclusion & Best Practices**
✔️ Always **enable security best practices**.  
✔️ Use **IAM roles** for access control.  
✔️ Optimize **costs with auto-scaling**.  
✔️ Secure **S3 with encryption**.  

📌 **Happy Cloud Computing! 🚀**  
```

---

### **📌 Key Features of This README:**
✔️ **Structured & professional format**  
✔️ **Detailed commands & best practices**  
✔️ **Covers theory + practical steps**  
✔️ **Ready-to-use AWS deployment guide**  

This README **documents everything from our chat** and makes it easy to **upload and share on GitHub**! 🚀🎯
