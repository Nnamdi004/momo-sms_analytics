MoMo SMS Transactions API Documentation
Base URL
http://localhost:8000
1. GET /transactions
Description:
Returns all transaction records.

Request Example
GET /transactions
Authorization: Basic <credentials>
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

2. GET /transactions/{id}
Description:
Returns a single transaction by ID.

Request Example
GET /transactions/1
Authorization: Basic <credentials>
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

3. POST /transactions
Description:
Creates a new transaction.

Request Example
POST /transactions
Content-Type: application/json
Authorization: Basic <credentials>
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
400 Bad Request – Invalid JSON

401 Unauthorized – Invalid credentials

4. PUT /transactions/{id}
Description:
Updates an existing transaction.

Request Example
PUT /transactions/1
Content-Type: application/json
Authorization: Basic <credentials>
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
401 Unauthorized

404 Not Found

5. DELETE /transactions/{id}
Description:
Deletes a transaction.

Request Example
DELETE /transactions/1
Authorization: Basic <credentials>
Response Example (200 OK)
{
  "message": "Deleted"
}
Error Codes
401 Unauthorized

404 Not Found
