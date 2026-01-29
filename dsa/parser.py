#!/usr/bin/python3
import xml.etree.ElementTree as ET

def parse_xml(file_path):
    tree = ET.parse(file_path)
    root = tree.getroot()

    transactions = []

    for idx, sms in enumerate(root.findall("sms")):
        transaction = {
            "id": idx + 1,
            "type": sms.get("type"),
            "amount": sms.get("amount"),
            "sender": sms.get("sender"),
            "receiver": sms.get("receiver"),
            "timestamp": sms.get("timestamp")
        }
        transactions.append(transaction)

    return transactions


if __name__ == "__main__":
    data = parse_xml("../data/modified_sms_v2.xml")
    print(data[:3])
