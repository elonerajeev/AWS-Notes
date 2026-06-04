# 📝 Deploy WordPress on Azure

WordPress on Azure can run on Azure App Service, Virtual Machines, AKS, or marketplace templates. For most beginners, **WordPress on App Service** with a managed database is the fastest path.

## Architecture options

- **App Service + MySQL Flexible Server:** Managed platform, easier operations.
- **Virtual Machine:** Maximum control, more patching and maintenance.
- **AKS:** Containerized WordPress for advanced platform teams.
- **Azure Marketplace:** Guided setup for common configurations.

## Recommended steps

1. Create a WordPress App Service deployment from the Azure portal or Marketplace.
2. Choose a region, plan size, and managed MySQL option.
3. Configure a custom domain and managed certificate.
4. Enable backups for app content and database.
5. Add Azure Front Door or CDN for caching and WAF.
6. Monitor performance with Application Insights and platform metrics.

## Best practices

- Keep WordPress core, plugins, and themes patched.
- Use Key Vault or app settings for secrets.
- Restrict admin access and enable MFA for administrators.
- Use a staging slot before plugin or theme updates.
