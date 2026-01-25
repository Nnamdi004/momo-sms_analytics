-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS momo_sms_db;

-- USERS TABLE
CREATE TABLE IF NOT EXISTS users (
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) NOT NULL UNIQUE,
    user_type VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TRANSACTION CATEGORIES
CREATE TABLE IF NOT EXISTS transaction_categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
    description VARCHAR(255)
);

-- TRANSACTIONS TABLE
CREATE TABLE IF NOT EXISTS transactions (
    transaction_id SERIAL PRIMARY KEY,
    amount DECIMAL(10,2) NOT NULL,
    transaction_date TIMESTAMP NOT NULL,
    status VARCHAR(30),
    sender_id INT,
    receiver_id INT,
    category_id INT,

    CONSTRAINT fk_sender FOREIGN KEY (sender_id) REFERENCES users(user_id),
    CONSTRAINT fk_receiver FOREIGN KEY (receiver_id) REFERENCES users(user_id),
    CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES transaction_categories(category_id),

    CONSTRAINT chk_amount CHECK (amount > 0)
);

-- Indexes
CREATE INDEX IF NOT EXISTS idx_sender ON transactions(sender_id);
CREATE INDEX IF NOT EXISTS idx_receiver ON transactions(receiver_id);
CREATE INDEX IF NOT EXISTS idx_category ON transactions(category_id);

-- USER_TRANSACTIONS (JUNCTION TABLE)
CREATE TABLE IF NOT EXISTS user_transactions (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    transaction_id INT NOT NULL,
    role VARCHAR(20),

    CONSTRAINT fk_ut_user FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_ut_transaction FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id)
);

-- SYSTEM LOGS
CREATE TABLE IF NOT EXISTS system_logs (
    log_id SERIAL PRIMARY KEY,
    transaction_id INT,
    log_message VARCHAR(255),
    log_status VARCHAR(30),
    logged_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_log_transaction FOREIGN KEY (transaction_id)
        REFERENCES transactions(transaction_id)
);

-- SAMPLE DATA

-- Users
INSERT INTO users (full_name, phone_number, user_type) VALUES
('Alice Mukamana', '0788000001', 'Sender'),
('Jean Paul', '0788000002', 'Receiver'),
('Grace Uwimana', '0788000003', 'Sender'),
('Eric Niyonsenga', '0788000004', 'Receiver'),
('David Habimana', '0788000005', 'Sender');

-- Categories
INSERT INTO transaction_categories (category_name, description) VALUES
('Transfer', 'Money transfer between users'),
('Payment', 'Payment for services'),
('Withdrawal', 'Cash withdrawal'),
('Airtime', 'Buy airtime'),
('Bill Payment', 'Utility bill payment');

-- Transactions
INSERT INTO transactions (amount, transaction_date, status, sender_id, receiver_id, category_id) VALUES
(5000, CURRENT_TIMESTAMP, 'Success', 1, 2, 1),
(12000, CURRENT_TIMESTAMP, 'Success', 3, 4, 2),
(3000, CURRENT_TIMESTAMP, 'Pending', 5, 2, 4),
(15000, CURRENT_TIMESTAMP, 'Failed', 1, 4, 3),
(8000, CURRENT_TIMESTAMP, 'Success', 3, 2, 5);

-- User Transactions
INSERT INTO user_transactions (user_id, transaction_id, role) VALUES
(1, 1, 'Sender'),
(2, 1, 'Receiver'),
(3, 2, 'Sender'),
(4, 2, 'Receiver'),
(5, 3, 'Sender');

-- System Logs
INSERT INTO system_logs (transaction_id, log_message, log_status) VALUES
(1, 'Transaction processed successfully', 'OK'),
(2, 'Payment completed', 'OK'),
(3, 'Waiting for confirmation', 'PENDING'),
(4, 'Insufficient balance', 'ERROR'),
(5, 'Bill payment successful', 'OK');
