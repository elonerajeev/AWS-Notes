# ⚖️ Azure Load Balancer, Application Gateway, and Autoscale

This Azure guide explains **⚖️ Azure Load Balancer, Application Gateway, and Autoscale** as a practical Azure service topic: core concepts, how it works, deployment steps, security choices, operations, and best practices. Azure provides layer 4 load balancing, layer 7 application delivery, global routing, WAF, and autoscale capabilities for resilient applications.

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

- **Azure service:** Azure Load Balancer, Application Gateway, Front Door, VM Scale Sets autoscale
- **What it does:** Azure provides layer 4 load balancing, layer 7 application delivery, global routing, WAF, and autoscale capabilities for resilient applications.
- **AWS translation note:** Comparable AWS topic: Elastic Load Balancer and Auto Scaling Groups

## 2. Core concepts

- Azure Load Balancer for TCP/UDP traffic and private/public load balancing
- Application Gateway for HTTP routing, TLS termination, path-based routing, and WAF
- Azure Front Door for global HTTP acceleration, WAF, and failover
- Autoscale rules for VM Scale Sets, App Service, AKS node pools, and more

## 3. Hands-on getting started

1. Choose layer 4, layer 7, or global entry point based on protocol and architecture.
2. Create health probes and backend pools.
3. Configure autoscale metrics such as CPU, queue length, or custom metrics.
4. Test failover, zone redundancy, and scaling events.

## 4. Common architecture patterns

- **Beginner lab:** Deploy a small resource in a dedicated resource group, tag it, monitor it, and delete it after practice.
- **Production baseline:** Use separate subscriptions or resource groups for dev, test, and production; apply Azure Policy; deploy with infrastructure as code.
- **High availability:** Prefer availability zones or zone-redundant services when the region supports them.
- **Private access:** Use private endpoints, VNets, private DNS, and managed identities when the workload should not be exposed publicly.
- **Cost control:** Use budgets, alerts, reservations or savings plans where appropriate, and right-size resources continuously.

## 5. Security and operations best practices

- Use health probes that validate real application health.
- Keep NSG and route table rules aligned with load balancer traffic.
- Enable WAF on internet-facing web workloads.
- Define minimum, default, and maximum capacity with cost boundaries.

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

Azure has multiple traffic-entry services. Use Load Balancer for layer 4 TCP/UDP, Application Gateway for regional HTTP/S with WAF and path routing, and Front Door for global HTTP/S acceleration and failover. Autoscale can scale VM Scale Sets, App Service, AKS node pools, and other services based on metrics or schedules.

Always configure meaningful health probes, backend pools, TLS strategy, WAF policy for public web apps, and capacity limits to control cost.

## 8. Helpful links

- [Microsoft Azure documentation](https://learn.microsoft.com/azure/)
- [Azure architecture center](https://learn.microsoft.com/azure/architecture/)
- [Azure well-architected framework](https://learn.microsoft.com/azure/well-architected/)
- [Azure CLI documentation](https://learn.microsoft.com/cli/azure/)
