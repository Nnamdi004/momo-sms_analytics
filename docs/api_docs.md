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

```
## GET /transactions/{id}

### Description
Retrieve a single transaction by its ID.

### Request Example
```http
GET /transactions/1
Authorization: Basic <base64(username:password)>

Response Example (200 OK)
{
  "id": 1,
  "type": "received",
  "amount": "5000",
  "sender": "John",
  "receiver": "Mary",
  "timestamp": "2023-01-01"
}

Error Codes
401 Unauthorized – Invalid credentials

404 Not Found – Transaction does not exist

```

## POST /transactions

### Description
Create a new transaction record.

### Request Example
```http
POST /transactions
Content-Type: application/json
Authorization: Basic <base64(username:password)>

{
  "type": "sent",
  "amount": "2000",
  "sender": "Alice",
  "receiver": "Bob",
  "timestamp": "2023-02-01"
}

Response Example (201 Created)

{
  "id": 21,
  "type": "sent",
  "amount": "2000",
  "sender": "Alice",
  "receiver": "Bob",
  "timestamp": "2023-02-01"
}

Error Codes
400 Bad Request – Invalid JSON payload

401 Unauthorized – Invalid credentials

```
## PUT /transactions/{id}

### Description
Update an existing transaction.

### Request Example
```http
PUT /transactions/1
Content-Type: application/json
Authorization: Basic <base64(username:password)>
{
  "type": "received",
  "amount": "7000",
  "sender": "John",
  "receiver": "Mary",
  "timestamp": "2023-01-01"
}

Response Example (200 OK)
{
  "id": 1,
  "type": "received",
  "amount": "7000",
  "sender": "John",
  "receiver": "Mary",
  "timestamp": "2023-01-01"
}

Error Codes
401 Unauthorized – Invalid credentials

404 Not Found – Transaction does not exist

```
## DELETE /transactions/{id}

### Description
Delete a transaction by ID.

### Request Example
```http
DELETE /transactions/1
Authorization: Basic <base64(username:password)>

Response Example (200 OK)
{
  "message": "Deleted"
}

Error Codes
401 Unauthorized – Invalid credentials

404 Not Found – Transaction does not exist

```
