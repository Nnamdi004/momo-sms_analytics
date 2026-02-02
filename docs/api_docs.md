# MoMo SMS Transactions API Documentation

## Base URL
http://localhost:8000

## Authentication
All endpoints are protected using **HTTP Basic Authentication**.

Clients must include the `Authorization` header in every request.

---

## GET /transactions

### Description
Retrieve all SMS transaction records.

### Request Example
```http
GET /transactions
Authorization: Basic <base64(username:password)>

Response Example (200 OK)
[
  {
    "id": 1,
    "type": "received",
    "amount": "5000",
    "sender": "John",
    "receiver": "Mary",
    "timestamp": "2023-01-01"
  }
]

Error Codes
401 Unauthorized – Invalid or missing credentials


