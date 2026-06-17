# 🧩 Azure Service Architecture Diagrams and Practical Labs

This supplemental guide avoids touching the Azure service README files that already exist on `main`, while still adding the missing diagrams, workflows, and hands-on practice requested for the Azure section.

## AKS application delivery

```mermaid
flowchart LR
  Dev[Developer] --> ACR[Azure Container Registry]
  ACR --> AKS[AKS Cluster]
  AKS --> NP[Node Pools]
  AKS --> ING[Ingress Controller]
  ING --> SVC[Services and Pods]
  SVC --> MON[Container Insights]
```

Practical lab: build an image, push it to ACR, attach ACR to AKS, deploy a Kubernetes manifest, expose it through ingress, and review pod logs in Container Insights.

## Static Web Apps and App Service delivery

```mermaid
flowchart LR
  DEV[Developer] --> GH[GitHub / Azure DevOps]
  GH --> BUILD[Build Workflow]
  BUILD --> SWA[Static Web Apps]
  BUILD --> APP[App Service]
  SWA --> FUNC[Optional Functions API]
  APP --> SLOT[Deployment Slot]
  SLOT --> PROD[Production Swap]
```

Practical lab: deploy a Vite or React app to Static Web Apps, deploy a Node/Python/.NET backend to App Service, configure app settings, add a custom domain, and test a staging-slot swap.

## Azure Functions event processing

```mermaid
flowchart LR
  EVT[HTTP / Timer / Queue / Event Grid] --> FN[Azure Function]
  FN --> MI[Managed Identity]
  MI --> KV[Key Vault]
  FN --> OUT[Storage / Service Bus / Cosmos DB]
  FN --> AI[Application Insights]
```

Practical lab: create an HTTP-triggered function, add a queue trigger, store a secret in Key Vault, enable managed identity, and inspect traces in Application Insights.

## Virtual Network hub-and-spoke

```mermaid
flowchart TD
  HUB[Hub VNet] --> FW[Azure Firewall]
  HUB --> DNS[Private DNS Resolver]
  HUB <--> APP[App Spoke VNet]
  HUB <--> DATA[Data Spoke VNet]
  APP --> PE[Private Endpoint]
  DATA --> DB[(Database Private Endpoint)]
```

Practical lab: create hub and spoke VNets, configure peering, add private DNS zones, create a private endpoint, and verify private name resolution from a test VM.

## Storage account secure access

```mermaid
flowchart LR
  APP[Application] --> ID[Managed Identity]
  ID --> RBAC[Storage RBAC Role]
  RBAC --> SA[Storage Account]
  SA --> BLOB[Blob Containers]
  SA --> FILE[Azure Files]
  SA --> LIFE[Lifecycle Rules]
```

Practical lab: upload a file to Blob Storage, enable soft delete and versioning, add a lifecycle rule, disable public access, and validate managed-identity access.

## Azure SQL private application pattern

```mermaid
flowchart LR
  APP[Application] --> PE[Private Endpoint]
  PE --> SQL[(Azure SQL Database)]
  SQL --> BAK[Automatic Backups]
  SQL --> MON[Query Performance Insight / Azure Monitor]
  APP --> KV[Key Vault for connection settings]
```

Practical lab: create a database, configure private endpoint or firewall access, create a least-privilege user, enable auditing, and test point-in-time restore.

## Cosmos DB partition and throughput workflow

```mermaid
flowchart LR
  APP[Application] --> SDK[Cosmos DB SDK]
  SDK --> C[(Container with Partition Key)]
  C --> RU[Request Units]
  C --> IDX[Indexing Policy]
  C --> REP[Regional Replication]
```

Practical lab: create a NoSQL account, choose a partition key, insert sample documents, query by partition key, review RU charge, and add autoscale throughput.

## Azure Monitor observability pipeline

```mermaid
flowchart LR
  RES[Azure Resources] --> DS[Diagnostic Settings]
  DS --> LAW[Log Analytics Workspace]
  APP[Applications] --> AI[Application Insights]
  LAW --> ALERT[Alerts and Workbooks]
  AI --> ALERT
```

Practical lab: enable diagnostic settings, send logs to Log Analytics, run a KQL query, create an alert rule, and build a workbook chart.

## Azure DevOps CI/CD workflow

```mermaid
sequenceDiagram
  participant Dev as Developer
  participant Repo as Azure Repos
  participant Pipe as Azure Pipelines
  participant Env as Environment Approval
  participant App as Azure App
  Dev->>Repo: Pull request
  Repo->>Pipe: Build and test
  Pipe->>Env: Request approval
  Env->>Pipe: Approved
  Pipe->>App: Deploy artifact
```

Practical lab: create a YAML pipeline, build an artifact, publish it, deploy to dev, add approval, and promote the same artifact to production.

## API Management gateway pattern

```mermaid
flowchart LR
  CLIENT[Clients] --> APIM[API Management]
  APIM --> POL[Policies: Auth / Rate Limit / Transform]
  POL --> BACK[Functions / App Service / AKS]
  APIM --> MON[Azure Monitor]
```

Practical lab: import an OpenAPI spec, add JWT validation, set a rate-limit policy, publish the API in a product, and review request metrics.

## Load balancing and autoscale

```mermaid
flowchart LR
  USER[Users] --> LB[Load Balancer / App Gateway]
  LB --> POOL[Backend Pool]
  POOL --> VMSS[VM Scale Set]
  VMSS --> AS[Autoscale Rules]
  LB --> HP[Health Probe]
```

Practical lab: create a VM Scale Set, place it behind a load balancer, configure health probes, add CPU autoscale, and test scale-out.

## Messaging patterns

```mermaid
flowchart LR
  PUB[Publisher] --> SB[Service Bus Queue/Topic]
  SB --> CON[Consumers]
  EVT[Azure Resource Event] --> EG[Event Grid]
  EG --> FUNC[Function / Logic App]
  STREAM[Telemetry] --> EH[Event Hubs]
```

Practical lab: create a Service Bus queue, send messages, process them with a Function, test dead-letter behavior, and compare the same event flow with Event Grid.
