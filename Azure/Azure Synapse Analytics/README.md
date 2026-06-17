# 🧮 Azure Synapse Analytics

Azure Synapse Analytics is the Azure service family most commonly mapped to Amazon Redshift for enterprise data warehousing and analytics.

## Core features

- Dedicated SQL pools for provisioned data warehouse workloads.
- Serverless SQL pools for querying files in a data lake.
- Spark pools for big data engineering and machine learning preparation.
- Pipelines for data integration, orchestration, and ETL/ELT.
- Integration with Power BI, Microsoft Purview, Data Lake Storage, and Azure Machine Learning.

## Getting started

1. Create a Synapse workspace linked to an Azure Data Lake Storage account.
2. Load sample data into the lake.
3. Query files with serverless SQL or load structured data into a dedicated SQL pool.
4. Build a pipeline to ingest and transform data.
5. Monitor workspace activity and secure access with Microsoft Entra ID and RBAC.

## Best practices

- Separate raw, curated, and serving data zones in the lake.
- Use workload management and distribution strategies for dedicated SQL pools.
- Pause dedicated SQL pools when not in use to control cost.
- Use private endpoints and managed private endpoints for production data platforms.

## Azure-first deep dive

Synapse combines data warehouse, lake querying, Spark, and pipelines in one analytics workspace. A typical platform stores raw and curated files in Azure Data Lake Storage, queries ad hoc files with serverless SQL, processes big data with Spark, and serves modeled data through dedicated SQL pools or Power BI.

Design Synapse around data zones, identity, network isolation, workspace managed identity, private endpoints, cost controls, and workload separation. Dedicated SQL pools should be paused when unused; serverless SQL costs should be controlled with partitioned data and efficient file formats like Parquet.
