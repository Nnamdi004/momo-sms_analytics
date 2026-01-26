# MoMo SMS Analytics Dashboard

## Team Name

**InnovateX**

---

## Project Overview

The **MoMo SMS Analytics Dashboard** is a data processing and analytics system designed to extract, structure, store, and analyze Mobile Money (MoMo) SMS transaction data provided in XML format.

The system converts unstructured SMS records into a normalized relational database and exposes meaningful insights through analytical SQL queries and a web-based dashboard. The project follows **enterprise software engineering principles**, including modular design, data normalization, scalability, and clear separation of concerns.

---

## Problem Statement

Mobile Money platforms generate high volumes of SMS notifications that contain valuable transactional information. However, this data is:

* Unstructured
* Difficult to query directly
* Not optimized for analytics or API consumption

This project addresses the problem by transforming raw XML SMS data into a structured database that supports efficient querying, analytics, and future API integration.

---

## Team Members

* **Chibueze Onugha**
* **Ayomikun Atigbi**
* **Michelle Anyika**

---

## High-Level System Architecture

**Architecture Diagram:**
[https://drive.google.com/file/d/1kflix6YqBLiINOkoiiksbbcwN1hAxaxd/view?usp=sharing](https://drive.google.com/file/d/1kflix6YqBLiINOkoiiksbbcwN1hAxaxd/view?usp=sharing)

### Architecture Overview

1. XML SMS data is ingested into the system
2. An ETL pipeline parses and cleans SMS records
3. Transaction details (amount, sender, receiver, category, status) are extracted
4. Cleaned data is normalized and stored in a MySQL database
5. Aggregated analytics are generated using SQL queries
6. Processed data is exported as JSON for dashboard and API consumption
7. A frontend dashboard visualizes insights using charts and tables

This layered architecture ensures scalability, maintainability, and clear data flow.

---

## Database Design & Documentation

### Database Name

```text
momo_sms_db
```

The database is designed to efficiently store Mobile Money transaction data while maintaining data integrity and supporting analytical queries.

---

### Entity Relationship Overview

The database consists of five core tables:

| Table Name               | Description                                                  |
| ------------------------ | ------------------------------------------------------------ |
| `users`                  | Stores MoMo users involved in transactions                   |
| `transaction_categories` | Defines transaction types (Transfer, Payment, Airtime, etc.) |
| `transactions`           | Stores core transaction records                              |
| `user_transactions`      | Junction table linking users and transactions                |
| `system_logs`            | Stores system and transaction-related logs                   |

---

### Table Descriptions

#### 1. Users Table (`users`)

Stores sender and receiver information extracted from SMS data.

**Key Fields:**

* `user_id` (PK)
* `full_name`
* `phone_number` (unique)
* `user_type` (Sender / Receiver)
* `created_at`

This design avoids data duplication and allows users to participate in multiple transactions.

---

#### 2. Transaction Categories Table (`transaction_categories`)

Defines the classification of transactions.

**Examples:**

* Transfer
* Payment
* Withdrawal
* Airtime
* Bill Payment

Using a separate category table ensures normalization and easy extensibility.

---

#### 3. Transactions Table (`transactions`)

This is the central fact table storing transactional data.

**Key Fields:**

* `transaction_id` (PK)
* `amount`
* `transaction_date`
* `status` (Success, Failed, Pending)
* `sender_id` (FK → users)
* `receiver_id` (FK → users)
* `category_id` (FK → transaction_categories)

---

#### 4. User Transactions Table (`user_transactions`)

Handles the many-to-many relationship between users and transactions while preserving user roles.

**Purpose:**

* A transaction can involve multiple users
* A user can participate in many transactions

---

#### 5. System Logs Table (`system_logs`)

Stores logs related to transaction processing.

**Use Cases:**

* Auditing
* Debugging
* Monitoring transaction lifecycle events

---

## XML to Database Mapping

The original XML dataset contains `<sms>` elements with attributes such as transaction type, amount, timestamp, sender, and receiver.

| XML Attribute     | Database Field                         |
| ----------------- | -------------------------------------- |
| `type`            | `transaction_categories.category_name` |
| `amount`          | `transactions.amount`                  |
| `time`            | `transactions.transaction_date`        |
| `status`          | `transactions.status`                  |
| `sender/receiver` | `users.phone_number`                   |

The XML serves as the raw input layer, while the database stores cleaned and structured data derived from parsing SMS messages.

---

## Sample Analytical SQL Queries

### Total Successful Transaction Value

```sql
SELECT SUM(amount) AS total_transaction_value
FROM transactions
WHERE status = 'Success';
```

### Transactions per Category

```sql
SELECT c.category_name, COUNT(*) AS total_transactions
FROM transactions t
JOIN transaction_categories c ON t.category_id = c.category_id
GROUP BY c.category_name;
```

### Top Senders by Amount

```sql
SELECT u.full_name, SUM(t.amount) AS total_sent
FROM transactions t
JOIN users u ON t.sender_id = u.user_id
WHERE t.status = 'Success'
GROUP BY u.full_name
ORDER BY total_sent DESC;
```

### Failed Transactions

```sql
SELECT transaction_id, amount, transaction_date
FROM transactions
WHERE status = 'Failed';
```

---

## API Readiness & Future Work

The database schema is designed to support a RESTful API layer.

### Planned API Endpoints

* `GET /transactions`
* `GET /transactions/{id}`
* `GET /users/{id}/transactions`
* `GET /analytics/top-senders`
* `GET /analytics/failed-transactions`

API responses will be serialized as JSON for frontend and third-party integration.

---

## Scrum Board

**Project Management Board:**
[https://trello.com/b/G8mZY8KH/momo-sms-analytics-sprint-1](https://trello.com/b/G8mZY8KH/momo-sms-analytics-sprint-1)

### Sprint 1 Focus

* Repository setup
* Architecture design
* Database schema design
* Task breakdown and role assignment

---

## Tech Stack

* **Backend:** Python, ElementTree / lxml
* **Database:** MySQL
* **Frontend:** HTML, CSS, JavaScript
* **API (Planned):** RESTful API
* **Version Control:** Git & GitHub
* **Project Management:** Scrum (Trello)

---

## How to Run the Project

### Database Setup

```bash
mysql -u root < database_setup.sql
```

### Verify Setup

```sql
USE momo_sms_db;
SHOW TABLES;
```

ETL pipeline and dashboard execution steps will be added in subsequent project phases.

---

## Conclusion

This project establishes a robust foundation for analyzing Mobile Money SMS data. By transforming raw XML messages into a structured relational database, the system enables efficient analytics, visualization, and future API-driven access.
