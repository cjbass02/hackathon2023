from flask import Flask, render_template, request, jsonify
from llama import get_response

app = Flask(__name__)
api_key = "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"

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/test')
def test():
    return render_template('test.html')

@app.route('/send_text', methods=['POST'])
def receive_text():
    received_text = request.json.get('text')
    # Process the received text on the server side (e.g., print it)
    print("Received text from JavaScript:", received_text)
    response = get_response(received_text);
    return jsonify(
        {
            'message': 'Text received successfully',
            'text': response,
        })

if __name__ == '__main__':
    app.run(debug=True)