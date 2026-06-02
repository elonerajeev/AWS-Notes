# 🛎️ Install Nagios on an Azure VM

Nagios can monitor servers and services running on Azure VMs, on-premises systems, and other endpoints. Azure-native monitoring is usually Azure Monitor, but Nagios is useful for classic infrastructure checks.

## Lab flow

1. Create an Ubuntu VM in a dedicated resource group.
2. Restrict SSH and HTTP access with NSG rules.
3. Install Apache, PHP, build tools, Nagios Core, and Nagios plugins.
4. Configure monitored hosts and services.
5. Add alerts through email, webhook, or integration tooling.
6. Use Azure Monitor VM metrics alongside Nagios service checks.

## Best practices

- Do not expose the Nagios admin UI publicly without strong authentication and IP restrictions.
- Back up Nagios configuration files.
- Use managed identities and Azure automation for Azure-specific checks where possible.
- Compare Nagios coverage with Azure Monitor alerts to avoid duplicate noise.
