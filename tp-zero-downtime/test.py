import time
import requests

URL = "http://127.0.0.1:9435"

print("Test du service... (Ctrl+C pour arrêter)\n")

while True:
    try:
        response = requests.get(URL, timeout=1)
        print(f"[OK] HTTP {response.status_code}")
    except Exception as e:
        print(f"[ERREUR] {e}")

    time.sleep(0.5)