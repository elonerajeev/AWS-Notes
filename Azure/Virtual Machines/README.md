# 🖥️ Azure Virtual Machines

This Azure guide explains **🖥️ Azure Virtual Machines** as a practical Azure service topic: core concepts, how it works, deployment steps, security choices, operations, and best practices. Azure Virtual Machines provide resizable Windows and Linux compute in the cloud for web apps, legacy systems, development environments, batch jobs, and enterprise workloads.

---

## Table of Contents

1. Azure service overview
2. Core concepts
3. Hands-on getting started
4. Common architecture patterns
5. Security and operations best practices
6. Azure CLI quick commands
7. AWS-to-Azure terminology
8. Helpful links

---

## 1. Azure service overview

- **Azure service:** Azure Virtual Machines, VM Scale Sets, Azure Compute Gallery
- **What it does:** Azure Virtual Machines provide resizable Windows and Linux compute in the cloud for web apps, legacy systems, development environments, batch jobs, and enterprise workloads.
- **AWS translation note:** Comparable AWS topic: Amazon EC2

## 2. Core concepts

- Multiple VM families for general purpose, compute optimized, memory optimized, storage optimized, GPU, and high-performance computing
- Images from Azure Marketplace or custom images in Azure Compute Gallery
- Availability sets, availability zones, proximity placement groups, and scale sets
- SSH keys, VM extensions, cloud-init, Run Command, Bastion, and serial console access

## 3. Hands-on getting started

1. Create a resource group and virtual network.
2. Choose an image such as Ubuntu, Windows Server, Red Hat, or Debian.
3. Select a VM size and OS disk type.
4. Configure NSG rules, SSH/RDP access, monitoring, and backups.

## 4. Common architecture patterns

- **Beginner lab:** Deploy a small resource in a dedicated resource group, tag it, monitor it, and delete it after practice.
- **Production baseline:** Use separate subscriptions or resource groups for dev, test, and production; apply Azure Policy; deploy with infrastructure as code.
- **High availability:** Prefer availability zones or zone-redundant services when the region supports them.
- **Private access:** Use private endpoints, VNets, private DNS, and managed identities when the workload should not be exposed publicly.
- **Cost control:** Use budgets, alerts, reservations or savings plans where appropriate, and right-size resources continuously.

## 5. Security and operations best practices

- Use Azure Bastion or just-in-time VM access instead of exposing SSH/RDP broadly.
- Patch with Azure Update Manager and monitor with Azure Monitor Agent.
- Use managed identities instead of secrets on VMs.
- Back up important VMs with Azure Backup and test restore procedures.

## 6. Azure CLI quick commands

```bash
# Login and select a subscription
az login
az account set --subscription "<subscription-id>"

# Create a resource group for practice
az group create --name rg-learning-azure --location eastus

# List resources in the group
az resource list --resource-group rg-learning-azure --output table

# Clean up practice resources when finished
az group delete --name rg-learning-azure --yes --no-wait
```

## 7. AWS-to-Azure terminology

| AWS term | Azure term |
|---|---|
| Account | Tenant + subscription |
| Region | Region |
| Availability Zone | Availability Zone |
| IAM policy | Azure RBAC role assignment / Azure Policy |
| Security Group | Network Security Group |
| VPC | Virtual Network |
| CloudWatch | Azure Monitor |
| CloudFormation | ARM template / Bicep |

## Azure-first deep dive

Azure Virtual Machines are built from a VM resource, network interface, managed OS disk, optional data disks, public IP, and virtual network placement. A production VM design should start with the VNet/subnet, NSG rules, identity, patching, backup, and monitoring model before choosing a VM size. Use VM Scale Sets when you need many identical instances behind a load balancer. Use Azure Bastion or just-in-time access instead of opening SSH/RDP to the internet.

Typical workflow: create a resource group, VNet, subnet, NSG, VM, managed identity, backup policy, and monitoring alerts. After deployment, install apps through cloud-init, Custom Script Extension, Desired State Configuration, or an image pipeline.

## 8. Helpful links

- [Microsoft Azure documentation](https://learn.microsoft.com/azure/)
- [Azure architecture center](https://learn.microsoft.com/azure/architecture/)
- [Azure well-architected framework](https://learn.microsoft.com/azure/well-architected/)
- [Azure CLI documentation](https://learn.microsoft.com/cli/azure/)
