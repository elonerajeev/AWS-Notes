
![Flow Logs](https://github.com/saikiranpi/mastering-aws/assets/109568252/15614265-ebd8-4769-a7f2-636e56188098)

# 📋 **VPC Flow Logs Guide** 🛠️  

Welcome to the **VPC Flow Logs Guide**! This guide will help you understand the importance of VPC flow logs and provide step-by-step instructions to set them up in AWS.  

---

## 🌟 **Understanding VPC Flow Logs**

When you launch an EC2 instance, how does it connect to the internet? Here's a breakdown of the traffic flow:  
1. **ENI to Subnet**: Traffic between the **Elastic Network Interface (ENI)** and the **subnet**.  
2. **Subnet to VPC**: Traffic between the **subnet** and the **VPC**.  
3. **ENI to VPC**: Aggregated traffic between the **ENI** and the **VPC**.  

---

## 🔍 **Purpose of VPC Flow Logs**

VPC flow logs provide:  
- **Visibility** into network traffic.  
- **Auditing and tracing** for monitoring and investigating network activities.  
- **Compliance support** for standards like **PCI DSS** by maintaining transaction history.  

### 💡 **Use Case Example**  
If there's a **security breach**, the audit team can analyze flow logs to trace traffic sources and destinations, helping identify vulnerabilities or malicious activity.  

---

## 🛠️ **Setting Up VPC Flow Logs**

### Step-by-Step Guide:  
1. **🚀 Launch an EC2 Instance**  
   - Create an instance to generate network traffic.  

2. **📦 Create an S3 Bucket**  
   - Use the S3 dashboard to create a bucket where flow logs will be stored centrally.  

3. **⚙️ Configure VPC Flow Logs**  
   - Navigate to the **VPC Dashboard**.  
   - Choose the desired VPC and **enable flow logs**:  
     - Select the **log destination** (S3 bucket or CloudWatch).  
     - Specify filters:  
       - **Accept**: Captures allowed traffic.  
       - **Reject**: Captures denied traffic.  
       - **All**: Captures all traffic.  

---

## 🧪 **Generating Logs**

Use the following **bash script** to simulate continuous network traffic and generate logs:  

```bash
# Hit the website once
curl ec2-35-173-233-127.compute-1.amazonaws.com

# Generate continuous traffic
while true
do
  curl ec2-35-173-233-127.compute-1.amazonaws.com | grep -I nginx
  sleep 1
done
```  

### What This Script Does:  
- **`curl`**: Hits the EC2 instance's public DNS to generate traffic.  
- **`while true`**: Runs the script in a loop, simulating continuous traffic.  
- **`grep -I nginx`**: Filters responses containing "nginx".  
- **`sleep 1`**: Adds a 1-second delay between each request.  

---

## ✅ **Benefits of VPC Flow Logs**

1. **Enhanced Security**: Monitor traffic for unusual patterns or threats.  
2. **Improved Troubleshooting**: Diagnose connectivity issues or identify misconfigurations.  
3. **Compliance Support**: Maintain detailed network activity logs for audits.  

---

🎉 **Happy Logging!** 🌐 Ensure better visibility and security for your AWS environment with VPC flow logs! 🚀  

Let me know if you'd like further adjustments! 😊
