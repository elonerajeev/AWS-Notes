# 📚 Install ELK Stack on an Azure VM

This guide mirrors the AWS EC2 ELK lab using Azure Virtual Machines. Azure-native alternatives include Azure Monitor Logs, Application Insights, and Microsoft Sentinel, but ELK remains useful for learning and custom logging pipelines.

## Lab flow

1. Create an Ubuntu VM in Azure.
2. Restrict SSH and web access with an NSG.
3. Install Java where required by the selected Elasticsearch version.
4. Install Elasticsearch, Logstash, and Kibana from Elastic packages.
5. Bind services carefully; avoid exposing Elasticsearch directly to the internet.
6. Create Logstash pipelines and dashboards.
7. Monitor VM CPU, memory, disk, and network through Azure Monitor.

## Best practices

- Use private networking or VPN/Bastion for administration.
- Enable disk encryption and backups for important data.
- Size disks and memory for indexing workload.
- Consider Azure Monitor or Elastic Cloud for production managed operations.
