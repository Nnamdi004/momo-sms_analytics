# dsa/efficiency_test.py

import time
from sample_data import transactions
from linear_search import linear_search
from dict_lookup import build_transaction_dict, dict_lookup

target_id = "tx20"

# Linear search timing
start = time.time()
linear_result = linear_search(transactions, target_id)
linear_time = time.time() - start

# Dictionary lookup timing
transactions_dict = build_transaction_dict(transactions)
start = time.time()
dict_result = dict_lookup(transactions_dict, target_id)
dict_time = time.time() - start

print("Linear Search Result:", linear_result)
print("Linear Search Time:", linear_time)

print("Dictionary Lookup Result:", dict_result)
print("Dictionary Lookup Time:", dict_time)