# ⚡ Azure Functions Serverless Computing

This Azure guide explains **⚡ Azure Functions Serverless Computing** as a practical Azure service topic: core concepts, how it works, deployment steps, security choices, operations, and best practices. Azure Functions runs event-driven code without managing servers and integrates with HTTP, timers, queues, Event Grid, Service Bus, Cosmos DB, and storage events.

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

- **Azure service:** Azure Functions, Durable Functions, Event Grid triggers
- **What it does:** Azure Functions runs event-driven code without managing servers and integrates with HTTP, timers, queues, Event Grid, Service Bus, Cosmos DB, and storage events.
- **AWS translation note:** Comparable AWS topic: AWS Lambda

## 2. Core concepts

- Consumption, Flex Consumption, Premium, Dedicated, and Container Apps hosting options
- Triggers and bindings for common Azure and HTTP events
- Durable Functions for orchestrations, fan-out/fan-in, and stateful workflows
- Managed identity support and Application Insights observability

## 3. Hands-on getting started

1. Create a function app and choose runtime stack.
2. Add an HTTP, timer, queue, blob, Event Grid, or Service Bus trigger.
3. Deploy code from GitHub Actions, Azure DevOps, ZIP, container, or CLI.
4. Configure app settings, identity, networking, and monitoring.

## 4. Common architecture patterns

- **Beginner lab:** Deploy a small resource in a dedicated resource group, tag it, monitor it, and delete it after practice.
- **Production baseline:** Use separate subscriptions or resource groups for dev, test, and production; apply Azure Policy; deploy with infrastructure as code.
- **High availability:** Prefer availability zones or zone-redundant services when the region supports them.
- **Private access:** Use private endpoints, VNets, private DNS, and managed identities when the workload should not be exposed publicly.
- **Cost control:** Use budgets, alerts, reservations or savings plans where appropriate, and right-size resources continuously.

## 5. Security and operations best practices

- Keep functions small, stateless, and idempotent.
- Use Durable Functions for workflows instead of custom polling loops.
- Store secrets in Key Vault references.
- Monitor cold starts, failures, retries, and dependency latency.

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

Azure Functions apps are made of triggers, bindings, hosting plans, storage, app settings, and optional managed identity. A trigger starts execution, while bindings simplify input/output to services like Storage, Cosmos DB, Service Bus, Event Grid, and HTTP. Hosting plan choice matters: Consumption is simple and event-driven, Premium reduces cold starts and supports VNet features, and Dedicated runs on an App Service plan.

Design functions to be idempotent, short-running, observable, and retry-safe. Use Durable Functions for orchestration instead of building workflow state manually.

## 8. Helpful links

- [Microsoft Azure documentation](https://learn.microsoft.com/azure/)
- [Azure architecture center](https://learn.microsoft.com/azure/architecture/)
- [Azure well-architected framework](https://learn.microsoft.com/azure/well-architected/)
- [Azure CLI documentation](https://learn.microsoft.com/cli/azure/)
