# Hello_World.py
from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello():
    # A simple greeting.
    return "Hello World!\n"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
  
