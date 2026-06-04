# 📊 Azure Monitor, Log Analytics, and Application Insights

This guide mirrors the AWS Notes style, but explains the same cloud concept with **Microsoft Azure** services. It maps **Amazon CloudWatch** to **Azure Monitor, Log Analytics, Application Insights, alerts** and adds Azure-specific design guidance.

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

- **AWS topic:** Amazon CloudWatch
- **Azure equivalent:** Azure Monitor, Log Analytics, Application Insights, alerts
- **Main idea:** Azure Monitor collects metrics, logs, traces, and alerts from Azure resources, applications, VMs, containers, and hybrid systems.

## 2. Core concepts

- Platform metrics and activity logs for Azure resources
- Log Analytics workspaces and Kusto Query Language (KQL)
- Application Insights for application telemetry, dependency tracking, and live metrics
- Alerts, action groups, dashboards, workbooks, and Container Insights

## 3. Hands-on getting started

1. Create or choose a Log Analytics workspace.
2. Enable diagnostic settings for resources.
3. Install Azure Monitor Agent on VMs or enable platform integrations.
4. Create alerts and dashboards for critical signals.

## 4. Common architecture patterns

- **Beginner lab:** Deploy a small resource in a dedicated resource group, tag it, monitor it, and delete it after practice.
- **Production baseline:** Use separate subscriptions or resource groups for dev, test, and production; apply Azure Policy; deploy with infrastructure as code.
- **High availability:** Prefer availability zones or zone-redundant services when the region supports them.
- **Private access:** Use private endpoints, VNets, private DNS, and managed identities when the workload should not be exposed publicly.
- **Cost control:** Use budgets, alerts, reservations or savings plans where appropriate, and right-size resources continuously.

## 5. Security and operations best practices

- Define actionable alerts and avoid alert noise.
- Send security-relevant logs to Microsoft Sentinel when needed.
- Use KQL workbooks for troubleshooting playbooks.
- Set retention and archive policies based on compliance and cost.

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
