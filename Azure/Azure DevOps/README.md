# 🔁 Azure DevOps CI/CD Services

This Azure guide explains **🔁 Azure DevOps CI/CD Services** as a practical Azure service topic: core concepts, how it works, deployment steps, security choices, operations, and best practices. Azure DevOps provides source control, CI/CD pipelines, package feeds, work tracking, and testing tools for application and infrastructure delivery.

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

- **Azure service:** Azure Repos, Pipelines, Artifacts, Boards, Test Plans
- **What it does:** Azure DevOps provides source control, CI/CD pipelines, package feeds, work tracking, and testing tools for application and infrastructure delivery.
- **AWS translation note:** Comparable AWS topic: AWS CodePipeline family

## 2. Core concepts

- Azure Repos Git repositories and branch policies
- Azure Pipelines YAML or classic builds and releases
- Azure Artifacts feeds for NuGet, npm, Maven, Python, and Universal Packages
- Integrations with GitHub, Azure, Kubernetes, Terraform, Bicep, and approvals

## 3. Hands-on getting started

1. Create a project and repository.
2. Add azure-pipelines.yml with build and deployment stages.
3. Connect service connections using federated credentials where possible.
4. Publish artifacts and deploy to Azure resources.

## 4. Common architecture patterns

- **Beginner lab:** Deploy a small resource in a dedicated resource group, tag it, monitor it, and delete it after practice.
- **Production baseline:** Use separate subscriptions or resource groups for dev, test, and production; apply Azure Policy; deploy with infrastructure as code.
- **High availability:** Prefer availability zones or zone-redundant services when the region supports them.
- **Private access:** Use private endpoints, VNets, private DNS, and managed identities when the workload should not be exposed publicly.
- **Cost control:** Use budgets, alerts, reservations or savings plans where appropriate, and right-size resources continuously.

## 5. Security and operations best practices

- Use branch policies and required reviews.
- Store secrets in variable groups linked to Key Vault.
- Use environments, approvals, and checks for production.
- Prefer workload identity federation over static service principal secrets.

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

Azure DevOps is more than a pipeline runner: Repos stores code, Pipelines builds and deploys, Artifacts hosts packages, Boards tracks work, and Environments add deployment approvals/checks. YAML pipelines should build once, publish artifacts, and deploy the same artifact through dev, test, and production.

Use service connections with workload identity federation when possible, protect production environments with approvals, store secrets in Key Vault-backed variable groups, and require branch policies.

## 8. Helpful links

- [Microsoft Azure documentation](https://learn.microsoft.com/azure/)
- [Azure architecture center](https://learn.microsoft.com/azure/architecture/)
- [Azure well-architected framework](https://learn.microsoft.com/azure/well-architected/)
- [Azure CLI documentation](https://learn.microsoft.com/cli/azure/)
