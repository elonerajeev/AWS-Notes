# 🌌 Azure Cosmos DB

This guide mirrors the AWS Notes style, but explains the same cloud concept with **Microsoft Azure** services. It maps **Amazon DynamoDB** to **Azure Cosmos DB for NoSQL and compatible APIs** and adds Azure-specific design guidance.

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

- **AWS topic:** Amazon DynamoDB
- **Azure equivalent:** Azure Cosmos DB for NoSQL and compatible APIs
- **Main idea:** Azure Cosmos DB is a globally distributed NoSQL database with multiple APIs, low-latency reads/writes, automatic indexing, and tunable consistency.

## 2. Core concepts

- APIs for NoSQL, MongoDB, Cassandra, Gremlin, Table, and PostgreSQL scenarios
- Global distribution with multi-region writes and failover
- Provisioned throughput, autoscale throughput, and serverless capacity modes
- Consistency levels from strong to eventual depending on application needs

## 3. Hands-on getting started

1. Choose API, partition key, and capacity mode.
2. Create account, database, and container.
3. Load sample documents and query them.
4. Configure indexing, TTL, backups, and multi-region replication.

## 4. Common architecture patterns

- **Beginner lab:** Deploy a small resource in a dedicated resource group, tag it, monitor it, and delete it after practice.
- **Production baseline:** Use separate subscriptions or resource groups for dev, test, and production; apply Azure Policy; deploy with infrastructure as code.
- **High availability:** Prefer availability zones or zone-redundant services when the region supports them.
- **Private access:** Use private endpoints, VNets, private DNS, and managed identities when the workload should not be exposed publicly.
- **Cost control:** Use budgets, alerts, reservations or savings plans where appropriate, and right-size resources continuously.

## 5. Security and operations best practices

- Design partition keys carefully to avoid hot partitions.
- Use autoscale or serverless for variable workloads.
- Model items around query patterns.
- Monitor RU consumption, throttling, and request latency.

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
