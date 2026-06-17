# 🧭 Azure Architecture and Workflow Playbook

This playbook adds visual architecture and practical workflow examples for the Azure notes. Use it as a quick reference when deciding how Azure services fit together.

## 1. Standard Azure landing zone workflow

```mermaid
flowchart TD
  A[Management Groups] --> B[Subscriptions]
  B --> C[Resource Groups]
  C --> D[Networking]
  C --> E[Identity and RBAC]
  C --> F[Policy and Tags]
  D --> G[Workloads]
  G --> H[Monitoring and Security]
  H --> I[Cost Management]
```

Practical steps:

1. Create management groups for platform, connectivity, identity, and workloads.
2. Create separate subscriptions for production and non-production.
3. Apply Azure Policy for allowed locations, required tags, and security baselines.
4. Build hub-and-spoke networking before production workloads.
5. Route logs to Log Analytics and security events to Sentinel if required.

## 2. Secure web application architecture

```mermaid
flowchart LR
  U[Users] --> FD[Azure Front Door + WAF]
  FD --> APP[App Service / Static Web Apps / Container Apps]
  APP --> KV[Key Vault]
  APP --> DB[(Azure SQL / PostgreSQL / Cosmos DB)]
  APP --> ST[(Storage Account)]
  APP --> MON[Application Insights]
  DB --> MON
  ST --> MON
```

Practical steps:

1. Put Azure Front Door in front of public web apps for TLS, global routing, caching, and WAF.
2. Use managed identity from the app to Key Vault and data services.
3. Use private endpoints for databases and storage where production security requires private access.
4. Enable Application Insights and create alerts for failures, latency, and availability.

## 3. Hub-and-spoke network architecture

```mermaid
flowchart TD
  ONP[On-premises / Branch] --> ER[VPN Gateway or ExpressRoute]
  ER --> HUB[Hub VNet]
  HUB --> FW[Azure Firewall]
  HUB --> DNS[Private DNS Resolver]
  HUB <--> S1[Spoke VNet: Apps]
  HUB <--> S2[Spoke VNet: Data]
  S1 --> PE1[Private Endpoints]
  S2 --> PE2[Private Endpoints]
```

Practical steps:

1. Keep shared connectivity, firewall, and DNS in the hub.
2. Put applications and data platforms in separate spokes.
3. Use VNet peering for hub-to-spoke communication.
4. Use Private DNS zones for Private Link resolution.
5. Use route tables to force egress through Azure Firewall when required.

## 4. CI/CD workflow for Azure apps

```mermaid
sequenceDiagram
  participant Dev as Developer
  participant Git as GitHub/Azure Repos
  participant CI as Pipeline
  participant Reg as ACR/Artifact Store
  participant Azure as Azure Runtime
  participant Mon as Azure Monitor
  Dev->>Git: Push code / open PR
  Git->>CI: Trigger build and tests
  CI->>Reg: Publish artifact or image
  CI->>Azure: Deploy to staging slot/revision
  Azure->>Mon: Emit logs and metrics
  CI->>Azure: Swap slot or shift traffic after approval
```

Practical steps:

1. Build once and promote the same artifact through environments.
2. Use workload identity federation for pipeline authentication.
3. Use deployment slots, Container Apps revisions, or AKS rollout strategies.
4. Add approvals and environment checks for production.
5. Roll back by swapping slots, reverting revisions, or redeploying the previous artifact.

## 5. Data and analytics workflow

```mermaid
flowchart LR
  SRC[Apps / Logs / Databases] --> EH[Event Hubs / Data Factory]
  EH --> DL[(Data Lake Storage)]
  DL --> SYN[Synapse / Databricks / Fabric]
  SYN --> BI[Power BI]
  SYN --> ML[Machine Learning]
  DL --> PUR[Purview / Governance]
```

Practical steps:

1. Ingest batch data with Data Factory and streaming data with Event Hubs.
2. Store raw, curated, and serving layers in Data Lake Storage.
3. Use Synapse serverless SQL or Spark for exploration and transformation.
4. Publish modeled data to Power BI or downstream apps.
5. Govern access, lineage, and classification with Purview when required.
