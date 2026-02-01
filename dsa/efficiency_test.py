import time
from sample_data import transactions
from linear_search import linear_search
from dict_lookup import build_transaction_dict, dict_lookup

target_id = 20

# Linear search timing
start = time.perf_counter()
linear_result = linear_search(transactions, target_id)
linear_time = time.perf_counter() - start

# Dictionary lookup timing
transactions_dict = build_transaction_dict(transactions)
start = time.perf_counter()
dict_result = dict_lookup(transactions_dict, target_id)
dict_time = time.perf_counter() - start

print("Linear Search Result:", linear_result)
print("Linear Search Time:", linear_time)

print("Dictionary Lookup Result:", dict_result)
print("Dictionary Lookup Time:", dict_time)
