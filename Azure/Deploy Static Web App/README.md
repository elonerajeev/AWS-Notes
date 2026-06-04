# 🌐 Deploy a Static Website on Azure

This guide mirrors the AWS static website lab using Azure services. You can host static content with **Azure Static Web Apps**, **Azure Storage static website hosting**, or **Azure App Service**.

## Recommended beginner path: Azure Static Web Apps

1. Push your HTML, CSS, and JavaScript to GitHub.
2. In the Azure portal, create a **Static Web App**.
3. Choose the repository, branch, framework preset, app location, and output location.
4. Azure creates a GitHub Actions workflow.
5. Commit changes and let the workflow publish the site.
6. Add a custom domain and managed TLS certificate when ready.

## Storage account alternative

```bash
az group create --name rg-static-site --location eastus
az storage account create --name <unique-storage-name> --resource-group rg-static-site --location eastus --sku Standard_LRS
az storage blob service-properties update --account-name <unique-storage-name> --static-website --index-document index.html
az storage blob upload-batch --account-name <unique-storage-name> --destination '$web' --source ./site
```

## Best practices

- Use Azure Front Door for global delivery, WAF, and custom routing.
- Enable versioning and soft delete when using Storage.
- Keep secrets out of frontend code.
- Use GitHub Actions or Azure Pipelines for repeatable deployment.
