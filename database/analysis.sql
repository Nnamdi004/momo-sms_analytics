-- DATABASE CHECK

-- 2. Check users table
SELECT * FROM users;

-- 3. Check categories
SELECT * FROM transaction_categories;

-- 4. Check transactions
SELECT * FROM transactions;

-- 5. Check user_transactions
SELECT * FROM user_transactions;

-- 6. Check system_logs
SELECT * FROM system_logs;

-- RELATIONSHIP TEST (JOINS)

-- 7. Show full transaction info with sender & receiver names
SELECT 
    t.transaction_id,
    u1.full_name AS sender_name,
    u2.full_name AS receiver_name,
    t.amount,
    t.status,
    c.category_name,
    t.transaction_date
FROM transactions t
JOIN users u1 ON t.sender_id = u1.user_id
JOIN users u2 ON t.receiver_id = u2.user_id
JOIN transaction_categories c ON t.category_id = c.category_id;

-- AGGREGATION TESTS

-- 8. Total number of users
SELECT COUNT(*) AS total_users FROM users;

-- 9. Total number of transactions
SELECT COUNT(*) AS total_transactions FROM transactions;

-- 10. Total money sent
SELECT SUM(amount) AS total_amount_sent FROM transactions;

-- 11. Transactions per category
SELECT 
    c.category_name,
    COUNT(t.transaction_id) AS transaction_count
FROM transaction_categories c
LEFT JOIN transactions t ON c.category_id = t.category_id
GROUP BY c.category_name;

-- STATUS CHECK

-- 12. Transactions by status
SELECT status, COUNT(*) 
FROM transactions
GROUP BY status;

-- LOG CHECK

-- 13. Logs with transaction info
SELECT 
    l.log_id,
    t.transaction_id,
    l.log_message,
    l.log_status,
    l.logged_at
FROM system_logs l
JOIN transactions t ON l.transaction_id = t.transaction_id;
