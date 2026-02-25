# 🚪 **AWS API Gateway: Comprehensive Guide**

## 🔥 **Introduction to AWS API Gateway**
**AWS API Gateway** is a fully managed service that helps you create, publish, secure, monitor, and scale APIs at any scale.

It supports:
- **REST APIs** for advanced API features and request transformations.
- **HTTP APIs** for low-latency and cost-effective API workloads.
- **WebSocket APIs** for real-time, two-way communication.

API Gateway integrates with services like **AWS Lambda, EC2, ECS, EKS, DynamoDB, SQS, SNS, and Step Functions**.

---

## 🎯 **Key Features of AWS API Gateway**
✅ **Serverless API Management** – No infrastructure to manage.  
✅ **Multiple API Types** – REST, HTTP, and WebSocket APIs.  
✅ **Authentication & Authorization** – IAM, Cognito, Lambda authorizers, JWT.  
✅ **Traffic Management** – Throttling, quotas, usage plans, API keys.  
✅ **Security** – WAF integration, TLS, request validation, private APIs.  
✅ **Monitoring** – Native metrics/logs via CloudWatch and X-Ray tracing.  
✅ **Versioning & Stages** – Deploy APIs in `dev`, `test`, `prod` stages.  

---

## 🧠 **Core Concepts**

### 1) **API Types**
- **REST API**: Feature-rich, best when you need advanced transformations and legacy compatibility.
- **HTTP API**: Lightweight and lower cost, best for modern serverless/microservice backends.
- **WebSocket API**: Best for chat apps, live dashboards, and streaming events.

### 2) **Resources and Methods (REST API)**
- **Resource**: URL path like `/users` or `/orders/{id}`.
- **Method**: HTTP verb such as `GET`, `POST`, `PUT`, `DELETE`.

### 3) **Integration**
API Gateway can route requests to:
- **Lambda Function**
- **HTTP endpoint**
- **AWS service integration** (DynamoDB, SQS, etc.)
- **Mock integration** for testing

### 4) **Stages**
Stages represent deployment environments such as:
- `dev`
- `staging`
- `prod`

Each stage can have its own variables and throttling settings.

### 5) **Authorizers**
- **IAM Authorization**
- **Cognito User Pools**
- **Lambda Authorizer**
- **JWT Authorizer (HTTP API)**

---

## 🛠️ **Step-by-Step: Build a Serverless API (API Gateway + Lambda)**

## **Step 1: Create a Lambda Function**
1️⃣ Go to **AWS Lambda** → **Create function**.  
2️⃣ Use function name: `hello-api`.  
3️⃣ Runtime: Python 3.x (or your preferred language).  
4️⃣ Use basic Lambda execution role.

Example code:

```python
def lambda_handler(event, context):
    return {
        "statusCode": 200,
        "headers": {"Content-Type": "application/json"},
        "body": "{\"message\": \"Hello from API Gateway + Lambda!\"}"
    }
```

---

## **Step 2: Create an HTTP API in API Gateway**
1️⃣ Go to **API Gateway** → **Create API**.  
2️⃣ Select **HTTP API**.  
3️⃣ Add integration: select your Lambda function `hello-api`.  
4️⃣ Define route: `GET /hello`.  
5️⃣ Create and deploy to stage (e.g., `dev`).

You will get an invoke URL like:

```text
https://abc123.execute-api.us-east-1.amazonaws.com/dev/hello
```

---

## **Step 3: Test Your API**
Use curl:

```bash
curl -X GET "https://abc123.execute-api.us-east-1.amazonaws.com/dev/hello"
```

Expected response:

```json
{"message": "Hello from API Gateway + Lambda!"}
```

---

## **Step 4: Enable CORS (if frontend is calling API)**
1️⃣ In API Gateway, select your route.  
2️⃣ Enable **CORS** and set allowed origins (avoid `*` in production).  
3️⃣ Redeploy the API.

---

## **Step 5: Add Authentication**
Choose one of the following:
- **JWT Authorizer** for OAuth/OpenID based apps.
- **Cognito Authorizer** for AWS-native user authentication.
- **IAM** for AWS service-to-service secure access.

---

## 🔐 **Security Best Practices**
1. **Enable authentication for sensitive endpoints**.
2. **Use least privilege IAM roles** for integrations.
3. **Enable AWS WAF** to protect from common web attacks.
4. **Use request validation** to block malformed payloads.
5. **Prefer private APIs** for internal services in VPC.
6. **Rotate secrets/tokens** and avoid hardcoding credentials.

---

## 📊 **Monitoring and Troubleshooting**

### ✅ CloudWatch Metrics to Watch
- **Count** (request volume)
- **4XXError** (client issues)
- **5XXError** (server/integration issues)
- **Latency** and **IntegrationLatency**

### ✅ Logs
- Enable **access logs** at stage level.
- Enable **execution logs** for deeper troubleshooting.

### ✅ Tracing
- Enable **AWS X-Ray** for end-to-end request tracing.

---

## ⚡ **API Gateway CLI Commands**

### List APIs
```bash
aws apigatewayv2 get-apis
```

### Create an HTTP API
```bash
aws apigatewayv2 create-api \
  --name MyHttpApi \
  --protocol-type HTTP
```

### Create a Stage
```bash
aws apigatewayv2 create-stage \
  --api-id <api-id> \
  --stage-name dev \
  --auto-deploy
```

---

## 🚀 **Common Use Cases**
- Building **serverless REST APIs** for web/mobile apps.
- Creating **microservice API front doors**.
- Exposing **Lambda functions** safely via HTTPS.
- Building **real-time apps** with WebSocket APIs.
- Creating **internal APIs** with VPC/private integrations.

---

## 📌 **Conclusion**
AWS API Gateway is a powerful managed service to publish secure and scalable APIs with minimal operational overhead.

✅ Use **HTTP API** for most modern, cost-sensitive workloads.  
✅ Use **REST API** when advanced API management features are required.  
✅ Pair with **Lambda, Cognito, CloudWatch, and WAF** for production-ready APIs.

---

📚 **Learn More**
- [AWS API Gateway Documentation](https://docs.aws.amazon.com/apigateway/)
- [API Gateway Pricing](https://aws.amazon.com/api-gateway/pricing/)
