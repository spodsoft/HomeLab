# joke.py
import random
import socket
from flask import Flask

app = Flask(__name__)

# A simple list of completely neutral jokes.
JOKES = [
    "What has an eye, but cannot see? A needle.",
    "What kind of tree fits in your hand? A palm tree.",
    "What gets wet while drying? A towel.",
    "Why can't a bicycle stand on its own? It's two tired.",
]

@app.route("/")
def tell_a_joke():
    joke = random.choice(JOKES)
    hostname = socket.gethostname()
    return f"{joke}\n(Served by: {hostname})\n"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)
