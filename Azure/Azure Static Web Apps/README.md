# 🧑‍💻 Azure Static Web Apps and App Service

This guide explains **Azure Static Web Apps** and **Azure App Service** as Azure web-hosting platforms. It focuses on how these services work, when to use each one, and how to deploy real applications.

---

## Table of Contents

1. [What Azure Static Web Apps is](#1-what-azure-static-web-apps-is)
2. [What Azure App Service is](#2-what-azure-app-service-is)
3. [Static Web Apps vs App Service](#3-static-web-apps-vs-app-service)
4. [How Azure Static Web Apps works](#4-how-azure-static-web-apps-works)
5. [How Azure App Service works](#5-how-azure-app-service-works)
6. [Deploy a frontend app to Static Web Apps](#6-deploy-a-frontend-app-to-static-web-apps)
7. [Deploy a backend or full-stack app to App Service](#7-deploy-a-backend-or-full-stack-app-to-app-service)
8. [Configuration, domains, auth, scaling, and monitoring](#8-configuration-domains-auth-scaling-and-monitoring)
9. [Best practices](#9-best-practices)

---

## 1. What Azure Static Web Apps is

**Azure Static Web Apps** is a managed hosting service for static frontends and lightweight full-stack apps. It is best for React, Angular, Vue, Svelte, Next.js static export, Hugo, Jekyll, plain HTML/CSS/JavaScript, and frontend apps that call APIs.

Key capabilities:

- Globally distributed static content hosting.
- Built-in CI/CD from GitHub or Azure DevOps.
- Automatic preview environments for pull requests.
- Optional serverless APIs through Azure Functions.
- Built-in authentication and route-based authorization.
- Free managed TLS certificates for custom domains.

## 2. What Azure App Service is

**Azure App Service** is a managed platform for running web apps, APIs, and background web workloads without managing servers. It supports application runtimes such as .NET, Java, Node.js, Python, PHP, Ruby, and custom containers.

Key capabilities:

- Managed web hosting on Linux or Windows.
- Runtime stacks or custom Docker containers.
- Deployment slots for safe blue/green or staging releases.
- Autoscale based on metrics and schedule.
- Built-in custom domains, TLS, backups, logs, and diagnostics.
- Managed identity for secure access to Key Vault, Storage, SQL, and other Azure services.

## 3. Static Web Apps vs App Service

| Requirement | Choose Static Web Apps | Choose App Service |
|---|---|---|
| Static frontend | ✅ Best fit | Works, but heavier |
| SPA with API calls | ✅ Great fit | ✅ Good fit |
| Server-rendered app | Limited; depends on framework support | ✅ Best fit |
| Long-running backend | ❌ Not intended | ✅ Best fit |
| Web API only | Possible with Functions | ✅ Best fit |
| Deployment slots | Pull request preview environments | ✅ Full deployment slots |
| Custom container | Not the main model | ✅ Supported |
| VNet integration | Limited by plan/features | ✅ Strong support |

## 4. How Azure Static Web Apps works

1. You connect a repository or deploy static files.
2. Azure creates or uses a CI/CD workflow.
3. The build step produces static assets such as `dist/`, `build/`, `public/`, or `_site/`.
4. Azure publishes those assets to globally distributed hosting.
5. Optional Functions APIs are deployed from an `api/` folder.
6. Routing, redirects, auth, and response headers are controlled through `staticwebapp.config.json`.

Example `staticwebapp.config.json`:

```json
{
  "routes": [
    { "route": "/admin/*", "allowedRoles": ["authenticated"] },
    { "route": "/api/*", "allowedRoles": ["authenticated"] }
  ],
  "navigationFallback": {
    "rewrite": "/index.html",
    "exclude": ["/images/*.{png,jpg,gif}", "/css/*"]
  },
  "responseOverrides": {
    "404": { "rewrite": "/404.html" }
  },
  "globalHeaders": {
    "X-Content-Type-Options": "nosniff",
    "X-Frame-Options": "DENY"
  }
}
```

## 5. How Azure App Service works

1. You create an **App Service plan**, which defines compute size, region, and pricing tier.
2. You create a **Web App** inside the plan.
3. You deploy code using GitHub Actions, Azure DevOps, ZIP deploy, container image, FTP, or local Git.
4. App Service starts the runtime or container and exposes HTTP/HTTPS endpoints.
5. App settings become environment variables for your app.
6. Deployment slots let you deploy to staging, warm up, test, and swap into production.

Common App Service building blocks:

- **App Service plan:** Compute resources and scale boundary.
- **Web App:** The running application resource.
- **Deployment slot:** Separate live app instance for staging or blue/green deployment.
- **App settings:** Environment variables and configuration values.
- **Connection strings:** Database connection configuration.
- **Managed identity:** Azure AD identity for the app.
- **VNet integration:** Private outbound access to resources in a VNet.

## 6. Deploy a frontend app to Static Web Apps

### Portal/GitHub flow

1. Push your app to GitHub.
2. In Azure, create **Static Web App**.
3. Select repository, branch, framework, app location, API location, and output location.
4. Azure adds a GitHub Actions workflow.
5. Push a commit and wait for the workflow to deploy.
6. Open the generated URL and validate the site.

### Azure CLI flow

```bash
az group create --name rg-swa-demo --location eastus

az staticwebapp create \
  --name swa-demo-app \
  --resource-group rg-swa-demo \
  --source https://github.com/<org>/<repo> \
  --location eastus2 \
  --branch main \
  --app-location "/" \
  --api-location "api" \
  --output-location "dist"
```

For a React/Vite project, the output location is usually `dist`. For Create React App, it is usually `build`. For Angular, it is usually `dist/<project-name>`.

## 7. Deploy a backend or full-stack app to App Service

### Create a Node.js web app

```bash
az group create --name rg-appservice-demo --location eastus

az appservice plan create \
  --name asp-demo-linux \
  --resource-group rg-appservice-demo \
  --is-linux \
  --sku B1

az webapp create \
  --name app-demo-unique-name \
  --resource-group rg-appservice-demo \
  --plan asp-demo-linux \
  --runtime "NODE:20-lts"

az webapp config appsettings set \
  --name app-demo-unique-name \
  --resource-group rg-appservice-demo \
  --settings NODE_ENV=production
```

### Deploy with ZIP deploy

```bash
zip -r app.zip . -x "node_modules/*" ".git/*"
az webapp deploy \
  --name app-demo-unique-name \
  --resource-group rg-appservice-demo \
  --src-path app.zip \
  --type zip
```

### Use a deployment slot

```bash
az webapp deployment slot create \
  --name app-demo-unique-name \
  --resource-group rg-appservice-demo \
  --slot staging

az webapp deployment slot swap \
  --name app-demo-unique-name \
  --resource-group rg-appservice-demo \
  --slot staging \
  --target-slot production
```

## 8. Configuration, domains, auth, scaling, and monitoring

- **Configuration:** Use app settings for non-secret configuration and Key Vault references for secrets.
- **Custom domains:** Add a DNS CNAME or TXT validation record, then bind a managed certificate.
- **Authentication:** Use built-in auth for simple Microsoft, GitHub, Google, or custom OpenID Connect sign-in; use app code for complex authorization.
- **Scaling:** Static Web Apps scales platform hosting automatically; App Service scales up by plan size and scales out by instance count or autoscale rules.
- **Monitoring:** Enable Application Insights, review live metrics, failures, dependencies, availability tests, and logs.

## 9. Best practices

- Use Static Web Apps for static frontends and App Service for full backend web applications.
- Keep build output paths correct; most failed SWA deployments are wrong `app_location` or `output_location` values.
- Store secrets in Key Vault or app settings, never in frontend source code.
- Use deployment slots for App Service production releases.
- Enable HTTPS-only, managed identity, Application Insights, and alerts.
- Use Azure Front Door with WAF for internet-facing production apps that need global routing and protection.
