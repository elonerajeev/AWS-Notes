# 📨 Azure Messaging and Email Services

This guide mirrors the AWS Notes style, but explains the same cloud concept with **Microsoft Azure** services. It maps **Amazon SNS and Amazon SES** to **Azure Service Bus, Event Grid, Event Hubs, Communication Services Email** and adds Azure-specific design guidance.

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

- **AWS topic:** Amazon SNS and Amazon SES
- **Azure equivalent:** Azure Service Bus, Event Grid, Event Hubs, Communication Services Email
- **Main idea:** Azure offers messaging, eventing, streaming, and communication services for decoupled architectures and notification workflows.

## 2. Core concepts

- Azure Service Bus queues and topics for enterprise messaging
- Event Grid for event routing and reactive applications
- Event Hubs for high-throughput event streaming and telemetry
- Azure Communication Services Email for transactional email scenarios

## 3. Hands-on getting started

1. Choose queue, topic, event, stream, or email based on communication pattern.
2. Create namespace or communication resource.
3. Configure publishers, subscribers, access control, and dead-letter handling.
4. Monitor delivery, retries, failures, and throughput.

## 4. Common architecture patterns

- **Beginner lab:** Deploy a small resource in a dedicated resource group, tag it, monitor it, and delete it after practice.
- **Production baseline:** Use separate subscriptions or resource groups for dev, test, and production; apply Azure Policy; deploy with infrastructure as code.
- **High availability:** Prefer availability zones or zone-redundant services when the region supports them.
- **Private access:** Use private endpoints, VNets, private DNS, and managed identities when the workload should not be exposed publicly.
- **Cost control:** Use budgets, alerts, reservations or savings plans where appropriate, and right-size resources continuously.

## 5. Security and operations best practices

- Use dead-letter queues and retry policies.
- Prefer managed identities and RBAC where supported.
- Design idempotent consumers.
- Separate operational alerts from user-facing notifications.

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
