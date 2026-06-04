# 🧑‍💻 Azure Static Web Apps and App Service

This guide mirrors the AWS Notes style, but explains the same cloud concept with **Microsoft Azure** services. It maps **AWS Amplify** to **Azure Static Web Apps, Azure App Service, deployment slots** and adds Azure-specific design guidance.

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

- **AWS topic:** AWS Amplify
- **Azure equivalent:** Azure Static Web Apps, Azure App Service, deployment slots
- **Main idea:** Azure Static Web Apps and App Service help deploy frontend and full-stack web applications with GitHub integration, custom domains, TLS, authentication, and serverless APIs.

## 2. Core concepts

- GitHub Actions and Azure DevOps CI/CD integration
- Built-in global hosting for static assets and optional Functions APIs
- Authentication providers and authorization rules
- App Service deployment slots, autoscale, custom domains, and managed certificates

## 3. Hands-on getting started

1. Connect a GitHub repository or upload app artifacts.
2. Configure build output path and API location.
3. Add environment variables and custom domain.
4. Review staging environments and production deployment.

## 4. Common architecture patterns

- **Beginner lab:** Deploy a small resource in a dedicated resource group, tag it, monitor it, and delete it after practice.
- **Production baseline:** Use separate subscriptions or resource groups for dev, test, and production; apply Azure Policy; deploy with infrastructure as code.
- **High availability:** Prefer availability zones or zone-redundant services when the region supports them.
- **Private access:** Use private endpoints, VNets, private DNS, and managed identities when the workload should not be exposed publicly.
- **Cost control:** Use budgets, alerts, reservations or savings plans where appropriate, and right-size resources continuously.

## 5. Security and operations best practices

- Use deployment slots or preview environments.
- Keep secrets in Key Vault or platform app settings.
- Enable application logging and availability tests.
- Use managed identities for backend resource access.

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
