# 📦 Azure Container Apps and Azure Container Instances

This guide mirrors the AWS Notes style, but explains the same cloud concept with **Microsoft Azure** services. It maps **Amazon ECS** to **Azure Container Apps, Azure Container Instances, Azure Container Registry** and adds Azure-specific design guidance.

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

- **AWS topic:** Amazon ECS
- **Azure equivalent:** Azure Container Apps, Azure Container Instances, Azure Container Registry
- **Main idea:** Azure container services run containerized workloads without managing full VM clusters, supporting microservices, jobs, event-driven scaling, and quick container execution.

## 2. Core concepts

- Azure Container Apps for serverless containers, revisions, ingress, Dapr, and KEDA scaling
- Azure Container Instances for simple one-off containers and burst jobs
- Azure Container Registry for private image storage, scanning integrations, and geo-replication
- Managed identity support for pulling images and accessing Azure services

## 3. Hands-on getting started

1. Build and push an image to Azure Container Registry.
2. Create a Container Apps environment or ACI container group.
3. Configure CPU, memory, environment variables, secrets, and ingress.
4. Set scale rules based on HTTP, queues, events, or custom metrics.

## 4. Common architecture patterns

- **Beginner lab:** Deploy a small resource in a dedicated resource group, tag it, monitor it, and delete it after practice.
- **Production baseline:** Use separate subscriptions or resource groups for dev, test, and production; apply Azure Policy; deploy with infrastructure as code.
- **High availability:** Prefer availability zones or zone-redundant services when the region supports them.
- **Private access:** Use private endpoints, VNets, private DNS, and managed identities when the workload should not be exposed publicly.
- **Cost control:** Use budgets, alerts, reservations or savings plans where appropriate, and right-size resources continuously.

## 5. Security and operations best practices

- Use managed identities for ACR pulls and resource access.
- Run containers as non-root where possible.
- Store secrets securely and rotate them.
- Set resource limits, health probes, and revision traffic rules.

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
