from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

if __name__ == '__main__':
    # Use the PORT environment variable to listen on the correct port
    port = int(os.environ.get('PORT', 8080))
    app.run(host='0.0.0.0', port=port)
