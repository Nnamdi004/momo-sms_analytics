def build_transaction_dict(transactions):
    return {tx["id"]: tx for tx in transactions}

def dict_lookup(transactions_dict, target_id):
    return transactions_dict.get(target_id)
