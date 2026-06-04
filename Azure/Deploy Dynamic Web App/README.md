# 🧱 Deploy a Dynamic Web App on Azure

A dynamic Azure web application typically combines **App Service**, **Azure SQL Database** or **PostgreSQL**, **Key Vault**, **Application Insights**, and optionally **Front Door**.

## Reference architecture

- Frontend/API: Azure App Service, Azure Container Apps, or AKS.
- Database: Azure SQL Database, PostgreSQL Flexible Server, MySQL Flexible Server, or Cosmos DB.
- Secrets: Azure Key Vault with managed identity.
- Monitoring: Application Insights and Log Analytics.
- Edge: Azure Front Door with WAF for public applications.

## Deployment steps

1. Create a resource group and app hosting plan.
2. Deploy the web app from GitHub Actions, Azure DevOps, ZIP deploy, or container image.
3. Create the database and restrict network access.
4. Enable managed identity for the web app.
5. Grant the identity access to Key Vault and any data resources.
6. Store connection strings or secrets as Key Vault references.
7. Enable Application Insights and create alerts.

## Best practices

- Use deployment slots for zero-downtime releases.
- Keep database access private with private endpoints when possible.
- Turn on backups and test restore.
- Use autoscale rules and budgets to avoid surprise cost.
