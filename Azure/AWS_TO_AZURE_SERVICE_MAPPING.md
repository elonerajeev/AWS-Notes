# 🔁 AWS to Azure Service Mapping

Use this mapping to translate the original AWS notes into Azure terminology and services.

| AWS service or concept | Azure equivalent |
|---|---|
| AWS account | Microsoft Entra tenant + Azure subscription |
| IAM | Microsoft Entra ID + Azure RBAC |
| EC2 | Azure Virtual Machines |
| EBS | Azure Managed Disks |
| AMI | Azure Compute Gallery |
| ELB | Azure Load Balancer / Application Gateway / Front Door |
| Auto Scaling Group | VM Scale Sets autoscale |
| S3 | Azure Blob Storage / Storage Accounts |
| RDS | Azure SQL Database / PostgreSQL / MySQL |
| DynamoDB | Azure Cosmos DB |
| API Gateway | Azure API Management |
| Lambda | Azure Functions |
| Route 53 | Azure DNS / Traffic Manager |
| CloudFront | Azure Front Door / Azure CDN |
| Amplify | Azure Static Web Apps / App Service |
| ECS | Azure Container Apps / Azure Container Instances |
| EKS | Azure Kubernetes Service |
| CloudWatch | Azure Monitor / Log Analytics / Application Insights |
| VPC | Azure Virtual Network |
| VPC Endpoint | Azure Private Endpoint / Private Link |
| VPC Flow Logs | Azure network flow logs |
| CloudFormation | Bicep / ARM templates |
| CodePipeline | Azure Pipelines |
| CodeCommit | Azure Repos |
| CodeBuild | Azure Pipelines build jobs |
| CodeDeploy | Azure Pipelines releases / deployment jobs |
| CodeArtifact | Azure Artifacts |
| SNS | Azure Service Bus topics / Event Grid |
| SES | Azure Communication Services Email |
| Redshift | Azure Synapse Analytics |
| ECR | Azure Container Registry |
| Step Functions | Azure Logic Apps / Durable Functions |
| AWS Backup | Azure Backup |
| AWS Config / Organizations SCPs | Azure Policy |
| GuardDuty / Security Hub | Microsoft Defender for Cloud / Microsoft Sentinel |
| ElastiCache | Azure Cache for Redis |
| Glue | Azure Data Factory / Synapse pipelines |
| AppConfig | Azure App Configuration |

## Migration mindset

- Do not translate names only; also translate identity, networking, security, operational, and billing models.
- Azure organizes resources through tenants, management groups, subscriptions, resource groups, and tags.
- Azure RBAC controls management-plane access, while data-plane permissions may need service-specific roles.
- Azure Policy and Defender for Cloud provide governance and security posture management across subscriptions.
- Use Azure Well-Architected Framework pillars: reliability, security, cost optimization, operational excellence, and performance efficiency.
