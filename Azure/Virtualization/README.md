# 🧱 Virtualization and Azure

Virtualization is the foundation for cloud compute. Azure abstracts physical hardware into virtual machines, disks, networks, containers, serverless platforms, and managed services.

## Azure virtualization layers

- **Virtual machines:** Full OS control for Windows and Linux.
- **VM Scale Sets:** Repeatable VM fleets with autoscale.
- **Containers:** Azure Container Apps, AKS, and Azure Container Instances.
- **Serverless:** Azure Functions and Logic Apps.
- **Hybrid:** Azure Arc and Azure Stack HCI bring Azure management to non-Azure infrastructure.

## Why it matters

- Faster provisioning than physical servers.
- Better utilization through elastic scaling.
- Stronger isolation through subscriptions, VNets, NSGs, and identities.
- Automation through templates, pipelines, and policy.

## Best practices

- Choose the highest-level service that satisfies requirements.
- Use managed services when operations overhead is not a business differentiator.
- Design for zones, backups, monitoring, and disaster recovery from the start.
