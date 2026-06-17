# 🌐 Azure DNS

This Azure guide explains **🌐 Azure DNS** as a practical Azure service topic: core concepts, how it works, deployment steps, security choices, operations, and best practices. Azure DNS hosts public and private DNS zones with Azure-native management, RBAC, private resolver integration, and private endpoint name resolution patterns.

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

- **Azure service:** Azure DNS and Private DNS
- **What it does:** Azure DNS hosts public and private DNS zones with Azure-native management, RBAC, private resolver integration, and private endpoint name resolution patterns.
- **AWS translation note:** Comparable AWS topic: Amazon Route 53

## 2. Core concepts

- Public DNS zones for internet-facing domains
- Private DNS zones for virtual network name resolution
- Alias records for Azure public IPs, Traffic Manager, and Front Door endpoints
- Azure DNS Private Resolver for hybrid DNS forwarding

## 3. Hands-on getting started

1. Create a DNS zone.
2. Add A, AAAA, CNAME, MX, TXT, or alias records.
3. Delegate the domain from your registrar to Azure nameservers.
4. For private DNS, link the zone to virtual networks.

## 4. Common architecture patterns

- **Beginner lab:** Deploy a small resource in a dedicated resource group, tag it, monitor it, and delete it after practice.
- **Production baseline:** Use separate subscriptions or resource groups for dev, test, and production; apply Azure Policy; deploy with infrastructure as code.
- **High availability:** Prefer availability zones or zone-redundant services when the region supports them.
- **Private access:** Use private endpoints, VNets, private DNS, and managed identities when the workload should not be exposed publicly.
- **Cost control:** Use budgets, alerts, reservations or savings plans where appropriate, and right-size resources continuously.

## 5. Security and operations best practices

- Use private DNS zones for private endpoints.
- Keep TTLs low during migrations and increase after stability.
- Automate DNS records with IaC.
- Protect DNS administration with least privilege RBAC.

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

Azure DNS hosts DNS zones and records, but domain registration usually remains with a registrar. For public DNS, create a zone, add records, and delegate the domain to Azure nameservers. For private DNS, link zones to VNets so resources can resolve internal names and private endpoint records.

Important record types include A, AAAA, CNAME, MX, TXT, NS, SRV, and alias records. Use Azure DNS Private Resolver when on-premises networks need to resolve Azure private zones or Azure workloads need conditional forwarding to on-premises DNS.

## 8. Helpful links

- [Microsoft Azure documentation](https://learn.microsoft.com/azure/)
- [Azure architecture center](https://learn.microsoft.com/azure/architecture/)
- [Azure well-architected framework](https://learn.microsoft.com/azure/well-architected/)
- [Azure CLI documentation](https://learn.microsoft.com/cli/azure/)
