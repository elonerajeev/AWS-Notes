# ☁️ Complete Microsoft Azure Guide: Services, Deployment & Best Practices

This folder adds an Azure-focused companion to the AWS Notes repository. It keeps the same learning style and major cloud topics, but maps them to Microsoft Azure services and includes extra Azure guidance for identity, governance, networking, monitoring, infrastructure as code, and deployment patterns.

## Overview

Microsoft Azure provides on-demand compute, storage, networking, data, AI, security, and DevOps services. The notes in this section are designed for beginners and DevOps engineers who want an AWS-to-Azure translation path plus practical Azure-first best practices.

## How to use these Azure notes

Each guide now explains the Azure service as its own topic first: what the service is, how it works, what resources are created, how to deploy or configure it, and what operational/security choices matter. The AWS mapping is included only as a translation helper for readers coming from the original AWS notes.

## Azure learning path

1. [☁️ Introduction to Microsoft Azure](./PRE/README.md) — Azure equivalent of AWS overview / cloud computing
2. [🔐 Microsoft Entra ID Identity and Access Management](./Microsoft%20Entra%20ID/README.md) — Azure equivalent of AWS IAM
3. [🖥️ Azure Virtual Machines](./Virtual%20Machines/README.md) — Azure equivalent of Amazon EC2
4. [💽 Azure Managed Disks](./Managed%20Disks/README.md) — Azure equivalent of Amazon EBS
5. [🧩 Azure Compute Gallery Images](./Compute%20Gallery/README.md) — Azure equivalent of Amazon Machine Images (AMI)
6. [⚖️ Azure Load Balancer, Application Gateway, and Autoscale](./Load%20Balancer%20and%20Autoscale/README.md) — Azure equivalent of Elastic Load Balancer and Auto Scaling Groups
7. [🗄️ Azure Storage Accounts and Blob Storage](./Storage%20Accounts/README.md) — Azure equivalent of Amazon S3
8. [🛢️ Azure SQL Database and Managed Databases](./Azure%20SQL%20Database/README.md) — Azure equivalent of Amazon RDS
9. [🌌 Azure Cosmos DB](./Cosmos%20DB/README.md) — Azure equivalent of Amazon DynamoDB
10. [⚡ Azure Functions Serverless Computing](./Azure%20Functions/README.md) — Azure equivalent of AWS Lambda
11. [🌐 Azure DNS](./Azure%20DNS/README.md) — Azure equivalent of Amazon Route 53
12. [🚀 Azure Front Door and Azure CDN](./Azure%20Front%20Door%20and%20CDN/README.md) — Azure equivalent of Amazon CloudFront
13. [🧑‍💻 Azure Static Web Apps and App Service](./Azure%20Static%20Web%20Apps/README.md) — Azure equivalent of AWS Amplify
14. [📦 Azure Container Apps and Azure Container Instances](./Azure%20Container%20Apps%20and%20ACI/README.md) — Azure equivalent of Amazon ECS
15. [☸️ Azure Kubernetes Service](./AKS/README.md) — Azure equivalent of Amazon EKS
16. [📊 Azure Monitor, Log Analytics, and Application Insights](./Azure%20Monitor/README.md) — Azure equivalent of Amazon CloudWatch
17. [🌉 Azure Virtual Network](./Virtual%20Network/README.md) — Azure equivalent of AWS VPC
18. [🔁 Azure DevOps CI/CD Services](./Azure%20DevOps/README.md) — Azure equivalent of AWS CodePipeline family
19. [🏗️ Azure Infrastructure as Code with Bicep, ARM, and Terraform](./Bicep%20and%20ARM/README.md) — Azure equivalent of AWS CloudFormation and Terraform
20. [📨 Azure Messaging and Email Services](./Messaging%20Services/README.md) — Azure equivalent of Amazon SNS and Amazon SES

## Extra Azure deployment guides

- [Deploy a Static Website on Azure](./Deploy%20Static%20Web%20App/README.md)
- [Deploy a Dynamic Web App on Azure](./Deploy%20Dynamic%20Web%20App/README.md)
- [Deploy WordPress on Azure](./Deploy%20WordPress%20on%20Azure/README.md)
- [AWS to Azure Service Mapping](./AWS_TO_AZURE_SERVICE_MAPPING.md)

## Additional Azure topics from the AWS repository

- [Azure API Management](./API%20Management/README.md) — Azure equivalent of API Gateway.
- [Azure Synapse Analytics](./Azure%20Synapse%20Analytics/README.md) — Azure equivalent of Amazon Redshift analytics patterns.
- [Virtualization and Azure](./Virtualization/README.md) — Azure virtualization concepts.
- [Setting up Kubernetes Master and Worker Nodes on Azure VMs](./Setting%20up%20Kubernetes%20Master%20and%20Worker%20Node/README.md) — self-managed Kubernetes learning lab.
- [Install ELK Stack on an Azure VM](./INSTALL-TOOLS/ELK-Stack.md) — Azure VM version of the ELK lab.
- [Install Nagios on an Azure VM](./INSTALL-TOOLS/nagios.md) — Azure VM version of the Nagios lab.
- [Azure Key Vault](./Key%20Vault/README.md) — Azure-specific secrets, keys, and certificates guidance.

## Azure governance checklist

- Create a tenant and subscriptions that match your organization, billing, and environment boundaries.
- Use management groups for policy inheritance across subscriptions.
- Apply Azure Policy for allowed regions, required tags, security baselines, and SKU restrictions.
- Use Microsoft Entra ID groups, Azure RBAC, managed identities, and Privileged Identity Management.
- Centralize logs in Log Analytics and connect security data to Microsoft Sentinel when required.
- Use Microsoft Cost Management budgets, alerts, reservations, and savings plans.

## Beginner hands-on project order

1. Create a resource group and storage account.
2. Deploy a VM into a virtual network.
3. Host a static site with Azure Static Web Apps or Storage static website hosting.
4. Deploy a dynamic app with App Service and Azure SQL Database.
5. Add Azure Monitor alerts and dashboards.
6. Convert the deployment to Bicep or Terraform.
7. Build a CI/CD workflow using Azure Pipelines or GitHub Actions.

Happy Azure learning! 🚀
