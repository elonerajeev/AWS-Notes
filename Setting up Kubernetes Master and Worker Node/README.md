# **🚀 Setting up Kubernetes Master and Worker Node on AWS (Step-by-Step Guide)**



FOR BEST RESOURCES: https\://medium.com/@ritusherke86/setting-up-kubernetes-master-and-worker-node-on-amazon-web-service-aws-cf8ae237a3dd

## **📌 Introduction**

Kubernetes (**K8s**) is an **open-source container orchestration** platform that automates the deployment, scaling, and management of containerized applications. Deploying **Kubernetes on AWS** involves setting up a **Kubernetes master node** and **worker nodes** on **EC2 instances** and configuring them to work together.

This guide provides a **detailed, step-by-step** approach to setting up a **Kubernetes cluster manually** on **AWS EC2 instances**.

---

# **📚 Prerequisites**

Before starting, ensure you have:\
✅ **AWS Account** (Free Tier works for small clusters)\
✅ **Basic Linux knowledge & AWS CLI installed**\
✅ **SSH Key Pair** (for secure access to EC2 instances)\
✅ **Internet access to download Kubernetes & dependencies**

---

# **🔹 Step 1: Create EC2 Instances for Master & Worker Nodes**

## **A. Launch Kubernetes Master Node**

1. **Login to AWS Console** → Navigate to **EC2**
2. **Click on "Launch Instance"**
3. **Choose an AMI**:
   - Select **Ubuntu 22.04 LTS** or **Amazon Linux 2**
4. **Choose Instance Type**:
   - `t2.medium` (2 vCPUs, 4GB RAM) **for Master**
   - `t2.micro` **for Worker (Free Tier Eligible)**
5. **Configure Instance Details**:
   - Number of instances: **1** (for master node)
   - **Enable Auto-assign Public IP**
   - **Set User Data (Optional)**:
     ```sh
     #!/bin/bash
     apt update -y && apt upgrade -y
     ```
6. **Add Storage**: 20GB (default is fine)
7. **Configure Security Group**:
   - **Allow** SSH (`22`), HTTP (`80`), Kubernetes (`6443`), and other required ports
8. **Launch Instance** and **Download Key Pair**

## **B. Launch Kubernetes Worker Nodes**

- Repeat the **above steps**, but for worker nodes:
  - **Choose instance type**: `t2.micro`
  - **Launch 2 instances** (for multiple workers)

---

# **🔹 Step 2: SSH into Master and Worker Nodes**

### **A. Connect to Master Node**

1. Open terminal and navigate to the `.pem` file directory
2. Connect to EC2 Master Node:
   ```sh
   ssh -i your-key.pem ubuntu@your-master-public-ip
   ```

### **B. Connect to Worker Nodes**

- Use the same command but replace the **IP address** with the **worker node's public IP**.

---

# **🔹 Step 3: Install Kubernetes and Dependencies**

## **A. Install Required Packages on All Nodes (Master & Workers)**

```sh
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl wget apt-transport-https
```

## **B. Disable Swap Memory (Important for Kubernetes)**

```sh
sudo swapoff -a
sed -i '/ swap / s/^/#/' /etc/fstab
```

## **C. Enable Kernel Modules for Networking**

```sh
sudo modprobe br_netfilter
echo '1' | sudo tee /proc/sys/net/ipv4/ip_forward
```

## **D. Install Docker on All Nodes**

```sh
sudo apt install -y docker.io
sudo systemctl enable docker && sudo systemctl start docker
```

---

# **🔹 Step 4: Install Kubernetes (kubeadm, kubelet, kubectl)**

## **A. Add Kubernetes Repository**

```sh
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
```

## **B. Install Kubernetes Tools**

```sh
sudo apt install -y kubeadm kubelet kubectl
sudo systemctl enable kubelet && sudo systemctl start kubelet
```

---

# **🔹 Step 5: Initialize Kubernetes on Master Node**

1. **Run ********`kubeadm init`******** command**:

   ```sh
   sudo kubeadm init --pod-network-cidr=192.168.0.0/16
   ```

2. **After initialization, set up kubectl access**:

   ```sh
   mkdir -p $HOME/.kube
   sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
   sudo chown $(id -u):$(id -g) $HOME/.kube/config
   ```

3. **Verify Master Node is Ready**:

   ```sh
   kubectl get nodes
   ```

---

# **🔹 Step 6: Configure Network for Kubernetes Cluster**

## **A. Install Calico Network Plugin (Recommended)**

```sh
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
```

✔️ This ensures communication between pods in the cluster.

---

# **🔹 Step 7: Join Worker Nodes to the Cluster**

1. **On the Master Node, run the following to get the join command:**

   ```sh
   kubeadm token create --print-join-command
   ```

2. **Copy the output command and run it on each Worker Node:**

   ```sh
   sudo kubeadm join <master-ip>:6443 --token <your-token> --discovery-token-ca-cert-hash sha256:<hash>
   ```

3. **Verify Nodes Joined Successfully**:

   ```sh
   kubectl get nodes
   ```

✔️ You should see both **master and worker nodes** in a **"Ready" state**.

---

# **🔹 Step 8: Deploy a Test Application**

1. **Create a Deployment**:

   ```sh
   kubectl create deployment nginx --image=nginx
   ```

2. **Expose the Deployment as a Service**:

   ```sh
   kubectl expose deployment nginx --port=80 --type=NodePort
   ```

3. **Get the Service URL**:

   ```sh
   kubectl get svc
   ```

✔️ Open the **Node IP & Port** in a browser to access the Nginx service.

---

# **🔹 Step 9: Enable Dashboard for Kubernetes Management**

1. **Deploy the Kubernetes Dashboard**:

   ```sh
   kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.3.0/aio/deploy/recommended.yaml
   ```

2. **Access the Dashboard**:

   ```sh
   kubectl proxy
   ```

3. Open in a browser:

   ```
   http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
   ```

---

# **📌 Conclusion**

🎯 **Congratulations!** You have successfully **set up a Kubernetes Cluster on AWS EC2** with:\
✔️ A **Master Node** managing the cluster.\
✔️ Multiple **Worker Nodes** running applications.\
✔️ A **Networking Plugin (Calico)** for communication.\
✔️ **Deployment & Service** to run applications.\
✔️ **Kubernetes Dashboard** for visualization.

🔹 **Next Steps:**

- Deploy **stateful applications** using Persistent Volumes.
- Set up **Helm for package management** in Kubernetes.
- Implement **CI/CD Pipelines** for automated deployments.

🚀 **Happy Kubernetes Deployment!** 🎯
