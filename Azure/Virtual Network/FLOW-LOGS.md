# 📜 Azure Network Flow Logs

Azure network flow logs capture IP traffic metadata for network security groups or virtual networks, similar to AWS VPC Flow Logs.

## Why use flow logs?

- Troubleshoot blocked or unexpected traffic.
- Support incident response and audit investigations.
- Understand application dependencies before migrations.
- Feed network telemetry into analytics or SIEM platforms.

## Typical setup

1. Enable Network Watcher in the region.
2. Configure flow logs for NSGs or virtual networks.
3. Store logs in a storage account and send analytics to Log Analytics or Traffic Analytics when needed.
4. Query logs with KQL and build workbooks for common investigations.

## Best practices

- Set retention based on compliance and cost.
- Use tags to identify log ownership.
- Combine flow logs with NSG rules, effective routes, DNS logs, and application logs.
- Alert on unusual traffic patterns for critical workloads.
