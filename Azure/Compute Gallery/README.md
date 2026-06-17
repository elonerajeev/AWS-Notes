# 🧩 Azure Compute Gallery Images

This Azure guide explains **🧩 Azure Compute Gallery Images** as a practical Azure service topic: core concepts, how it works, deployment steps, security choices, operations, and best practices. Azure Compute Gallery helps standardize VM images, versions, replication, sharing, and regional rollout for repeatable VM deployments.

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

- **Azure service:** Azure Compute Gallery and managed images
- **What it does:** Azure Compute Gallery helps standardize VM images, versions, replication, sharing, and regional rollout for repeatable VM deployments.
- **AWS translation note:** Comparable AWS topic: Amazon Machine Images (AMI)

## 2. Core concepts

- Image definitions and versions for Linux and Windows builds
- Regional replication and version lifecycle management
- Sharing across subscriptions, tenants, or communities
- Integration with Azure Image Builder and automation pipelines

## 3. Hands-on getting started

1. Create a golden VM or image build pipeline.
2. Generalize the OS when required.
3. Publish an image version to Azure Compute Gallery.
4. Deploy VMs or VM Scale Sets from the versioned image.

## 4. Common architecture patterns

- **Beginner lab:** Deploy a small resource in a dedicated resource group, tag it, monitor it, and delete it after practice.
- **Production baseline:** Use separate subscriptions or resource groups for dev, test, and production; apply Azure Policy; deploy with infrastructure as code.
- **High availability:** Prefer availability zones or zone-redundant services when the region supports them.
- **Private access:** Use private endpoints, VNets, private DNS, and managed identities when the workload should not be exposed publicly.
- **Cost control:** Use budgets, alerts, reservations or savings plans where appropriate, and right-size resources continuously.

## 5. Security and operations best practices

- Automate image builds instead of manual image capture.
- Patch and rotate base images regularly.
- Document image owners, installed agents, and hardening baselines.
- Use semantic image versioning and retire old versions safely.

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

Azure Compute Gallery manages reusable VM images at scale. Instead of manually configuring every VM, build a hardened image with required agents, packages, security settings, and baseline configuration, then publish it as an image version. Versions can be replicated to multiple regions and consumed by VMs or VM Scale Sets.

Use Azure Image Builder or a CI pipeline to create images repeatedly. Keep images small, patched, documented, and versioned. Retire old image versions only after all dependent deployments are migrated.

## 8. Helpful links

- [Microsoft Azure documentation](https://learn.microsoft.com/azure/)
- [Azure architecture center](https://learn.microsoft.com/azure/architecture/)
- [Azure well-architected framework](https://learn.microsoft.com/azure/well-architected/)
- [Azure CLI documentation](https://learn.microsoft.com/cli/azure/)
