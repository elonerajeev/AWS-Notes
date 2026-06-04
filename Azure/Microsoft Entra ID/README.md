# 🔐 Microsoft Entra ID Identity and Access Management

This guide mirrors the AWS Notes style, but explains the same cloud concept with **Microsoft Azure** services. It maps **AWS IAM** to **Microsoft Entra ID, Azure RBAC, Privileged Identity Management** and adds Azure-specific design guidance.

---

## Table of Contents

1. What it replaces from AWS
2. Core concepts
3. Hands-on getting started
4. Common architecture patterns
5. Security and operations best practices
6. Azure CLI quick commands
7. AWS-to-Azure terminology
8. Helpful links

---

## 1. What it replaces from AWS

- **AWS topic:** AWS IAM
- **Azure equivalent:** Microsoft Entra ID, Azure RBAC, Privileged Identity Management
- **Main idea:** Microsoft Entra ID provides identity, authentication, conditional access, application identities, and directory-backed access control for Azure resources and cloud applications.

## 2. Core concepts

- Users, groups, app registrations, service principals, and managed identities
- Azure role-based access control scopes: management group, subscription, resource group, and resource
- Conditional Access, MFA, identity protection, access reviews, and PIM just-in-time access
- Managed identities for Azure services without storing secrets in code

## 3. Hands-on getting started

1. Create users and groups in Microsoft Entra ID.
2. Assign Azure RBAC roles at the smallest practical scope.
3. Use managed identities for VMs, App Service, Functions, AKS, and automation.
4. Enable MFA and Conditional Access for administrators.

## 4. Common architecture patterns

- **Beginner lab:** Deploy a small resource in a dedicated resource group, tag it, monitor it, and delete it after practice.
- **Production baseline:** Use separate subscriptions or resource groups for dev, test, and production; apply Azure Policy; deploy with infrastructure as code.
- **High availability:** Prefer availability zones or zone-redundant services when the region supports them.
- **Private access:** Use private endpoints, VNets, private DNS, and managed identities when the workload should not be exposed publicly.
- **Cost control:** Use budgets, alerts, reservations or savings plans where appropriate, and right-size resources continuously.

## 5. Security and operations best practices

- Grant least privilege and avoid broad Owner assignments.
- Use Privileged Identity Management for privileged roles.
- Use groups for access assignments instead of assigning every user directly.
- Review sign-in logs, audit logs, and risky users regularly.

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

## 8. Helpful links

- [Microsoft Azure documentation](https://learn.microsoft.com/azure/)
- [Azure architecture center](https://learn.microsoft.com/azure/architecture/)
- [Azure well-architected framework](https://learn.microsoft.com/azure/well-architected/)
- [Azure CLI documentation](https://learn.microsoft.com/cli/azure/)
