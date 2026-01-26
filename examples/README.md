## JSON Data Modeling

Main Entities Modeled:
 Users
 Transactions
 Transaction Categories
 System Logs

These JSON files represent how data stored in the relational database
would be serialized and returned by a REST API.

Mapping:
 user.json → users table
 category.json → transaction_categories table
 transaction.json → transactions table
 system_log.json → system_logs table
 full_transaction.json → JOIN of users + transactions + categories

All JSON files are aligned with the relational schema and use
consistent IDs to maintain referential integrity.