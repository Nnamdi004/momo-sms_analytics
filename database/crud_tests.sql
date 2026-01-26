-- ============================
-- TEST DATA FOR CRUD DELETE OPERATION
-- ============================

-- CRUD Tests
USE momo_sms_db;

-- Insert test users (if not already present)
INSERT INTO users (full_name, phone_number, user_type)
VALUES
('Test Sender', '0800000001', 'Sender'),
('Test Receiver', '0800000002', 'Receiver');

-- Insert test transaction category
INSERT INTO transaction_categories (category_name, description)
VALUES ('Test Transfer', 'Test category for delete operation');

-- Insert test transaction (this WILL be deleted)
INSERT INTO transactions (
    amount,
    transaction_date,
    status,
    sender_id,
    receiver_id,
    category_id
)
VALUES (
    9999.99,
    '2026-01-22 14:30:00',
    'TEST_DELETE',
    1,
    2,
    1
);

