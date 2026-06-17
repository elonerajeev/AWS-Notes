# 💽 Azure Managed Disks

This Azure guide explains **💽 Azure Managed Disks** as a practical Azure service topic: core concepts, how it works, deployment steps, security choices, operations, and best practices. Azure Managed Disks are block-level storage volumes for Azure VMs, providing OS disks, data disks, snapshots, encryption, bursting, and high-performance tiers.

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

- **Azure service:** Azure Managed Disks, snapshots, shared disks
- **What it does:** Azure Managed Disks are block-level storage volumes for Azure VMs, providing OS disks, data disks, snapshots, encryption, bursting, and high-performance tiers.
- **AWS translation note:** Comparable AWS topic: Amazon EBS

## 2. Core concepts

- Disk types include Standard HDD, Standard SSD, Premium SSD, Premium SSD v2, and Ultra Disk
- Automatic storage account management and high durability within a region
- Snapshots, incremental snapshots, disk encryption sets, and customer-managed keys
- Shared disks for clustered workloads requiring shared block storage

## 3. Hands-on getting started

1. Attach one or more data disks to a VM.
2. Initialize and format the disk inside the guest OS.
3. Create snapshots before risky changes.
4. Tune disk size, IOPS, throughput, and caching for the workload.

## 4. Common architecture patterns

- **Beginner lab:** Deploy a small resource in a dedicated resource group, tag it, monitor it, and delete it after practice.
- **Production baseline:** Use separate subscriptions or resource groups for dev, test, and production; apply Azure Policy; deploy with infrastructure as code.
- **High availability:** Prefer availability zones or zone-redundant services when the region supports them.
- **Private access:** Use private endpoints, VNets, private DNS, and managed identities when the workload should not be exposed publicly.
- **Cost control:** Use budgets, alerts, reservations or savings plans where appropriate, and right-size resources continuously.

## 5. Security and operations best practices

- Separate OS and data disks.
- Use Premium SSD or Ultra Disk for latency-sensitive workloads.
- Enable host caching only when it matches read/write patterns.
- Protect critical disks with snapshots, Azure Backup, or application-native backups.

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

Managed Disks provide persistent block storage for VMs. Every VM has an OS disk and can attach multiple data disks. Disk performance depends on disk type, size, provisioned IOPS/throughput, VM size limits, and host caching settings. Snapshots are point-in-time copies and incremental snapshots reduce storage consumption.

Choose Standard SSD for dev/test and general workloads, Premium SSD for production performance, Premium SSD v2 or Ultra Disk for high IOPS/low latency workloads. Use disk encryption, backup policies, and snapshots before risky changes.

## 8. Helpful links

- [Microsoft Azure documentation](https://learn.microsoft.com/azure/)
- [Azure architecture center](https://learn.microsoft.com/azure/architecture/)
- [Azure well-architected framework](https://learn.microsoft.com/azure/well-architected/)
- [Azure CLI documentation](https://learn.microsoft.com/cli/azure/)
