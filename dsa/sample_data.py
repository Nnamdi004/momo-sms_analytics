# dsa/sample_data.py

transactions = [
    {"id": f"tx{i}", "type": "transfer", "amount": i * 1000, "sender": "Alice", "receiver": "Bob"}
    for i in range(1, 21)
]