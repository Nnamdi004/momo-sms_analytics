#!/usr/bin/python3
from http.server import BaseHTTPRequestHandler, HTTPServer
import json
import base64
from dsa.parser import parse_xml

USERNAME = "admin"
PASSWORD = "admin123"

transactions = parse_xml("data/modified_sms_v2.xml")
transactions_dict = {t["id"]: t for t in transactions}


def is_authenticated(headers):
    auth = headers.get("Authorization")
    if not auth:
        return False

    encoded = auth.split(" ")[1]
    decoded = base64.b64decode(encoded).decode()
    user, pwd = decoded.split(":")

    return user == USERNAME and pwd == PASSWORD


class MoMoAPI(BaseHTTPRequestHandler):

    def send_json(self, data, code=200):
        self.send_response(code)
        self.send_header("Content-Type", "application/json")
        self.end_headers()
        self.wfile.write(json.dumps(data).encode())

    def do_GET(self):
        if not is_authenticated(self.headers):
            self.send_json({"error": "Unauthorized"}, 401)
            return

        if self.path == "/transactions":
            self.send_json(list(transactions_dict.values()))
        elif self.path.startswith("/transactions/"):
            tid = int(self.path.split("/")[-1])
            tx = transactions_dict.get(tid)
            if tx:
                self.send_json(tx)
            else:
                self.send_json({"error": "Not found"}, 404)

    def do_POST(self):
        if not is_authenticated(self.headers):
            self.send_json({"error": "Unauthorized"}, 401)
            return

        length = int(self.headers["Content-Length"])
        data = json.loads(self.rfile.read(length))

        new_id = max(transactions_dict.keys()) + 1
        data["id"] = new_id
        transactions_dict[new_id] = data

        self.send_json(data, 201)

    def do_PUT(self):
        if not is_authenticated(self.headers):
            self.send_json({"error": "Unauthorized"}, 401)
            return

        tid = int(self.path.split("/")[-1])
        if tid not in transactions_dict:
            self.send_json({"error": "Not found"}, 404)
            return

        length = int(self.headers["Content-Length"])
        data = json.loads(self.rfile.read(length))
        data["id"] = tid
        transactions_dict[tid] = data

        self.send_json(data)

    def do_DELETE(self):
        if not is_authenticated(self.headers):
            self.send_json({"error": "Unauthorized"}, 401)
            return

        tid = int(self.path.split("/")[-1])
        if tid in transactions_dict:
            del transactions_dict[tid]
            self.send_json({"message": "Deleted"})
        else:
            self.send_json({"error": "Not found"}, 404)


if __name__ == "__main__":
    server = HTTPServer(("localhost", 8000), MoMoAPI)
    print("Server running on http://localhost:8000")
    server.serve_forever()
