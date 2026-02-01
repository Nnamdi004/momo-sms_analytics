def linear_search(transactions, target_id):
    for transaction in transactions:
        if transaction["id"] == target_id:
            return transaction
    return None
