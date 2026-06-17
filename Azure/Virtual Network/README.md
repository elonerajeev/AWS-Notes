# 🌉 Azure Virtual Network

This Azure guide explains **🌉 Azure Virtual Network** as a practical Azure service topic: core concepts, how it works, deployment steps, security choices, operations, and best practices. Azure Virtual Network provides private networking for Azure resources, including subnets, routing, filtering, hybrid connectivity, private endpoints, and service isolation.

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

- **Azure service:** Azure Virtual Network, subnets, NSG, UDR, NAT Gateway, Private Link
- **What it does:** Azure Virtual Network provides private networking for Azure resources, including subnets, routing, filtering, hybrid connectivity, private endpoints, and service isolation.
- **AWS translation note:** Comparable AWS topic: AWS VPC

## 2. Core concepts

- VNets, subnets, network security groups, application security groups, and route tables
- Private Link and private endpoints for private PaaS access
- VNet peering, VPN Gateway, ExpressRoute, NAT Gateway, and Azure Firewall
- Network Watcher, flow logs, packet capture, and topology tools

## 3. Hands-on getting started

1. Plan address spaces and subnets.
2. Create VNets, subnets, NSGs, and route tables.
3. Connect networks with peering, VPN, or ExpressRoute.
4. Add private endpoints and DNS for PaaS services.

## 4. Common architecture patterns

- **Beginner lab:** Deploy a small resource in a dedicated resource group, tag it, monitor it, and delete it after practice.
- **Production baseline:** Use separate subscriptions or resource groups for dev, test, and production; apply Azure Policy; deploy with infrastructure as code.
- **High availability:** Prefer availability zones or zone-redundant services when the region supports them.
- **Private access:** Use private endpoints, VNets, private DNS, and managed identities when the workload should not be exposed publicly.
- **Cost control:** Use budgets, alerts, reservations or savings plans where appropriate, and right-size resources continuously.

## 5. Security and operations best practices

- Avoid overlapping CIDR ranges.
- Use NSGs and ASGs for segmented access control.
- Centralize egress through Azure Firewall or NAT Gateway when required.
- Enable Network Watcher and flow logs for troubleshooting.

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

Azure Virtual Network is the private network boundary for Azure workloads. A useful design includes address spaces, subnets by workload tier, NSGs, route tables, DNS, private endpoints, NAT, firewall, and hybrid connectivity. Unlike a simple flat network, production VNets usually use hub-and-spoke topology with shared firewall, DNS, VPN/ExpressRoute, and monitoring in the hub.

Plan CIDR ranges carefully because overlapping address space blocks peering and hybrid routing. Use Private Link for PaaS access and private DNS zones for name resolution.

## 8. Helpful links

- [Microsoft Azure documentation](https://learn.microsoft.com/azure/)
- [Azure architecture center](https://learn.microsoft.com/azure/architecture/)
- [Azure well-architected framework](https://learn.microsoft.com/azure/well-architected/)
- [Azure CLI documentation](https://learn.microsoft.com/cli/azure/)
