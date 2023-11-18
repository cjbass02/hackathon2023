function sendMessage() {
    const userMessage = document.getElementById('user-input').value;
    if (userMessage) {
        addUserMessage(userMessage);
        getBotResponse(userMessage);
    }
}

function addUserMessage(message) {
    const chatBox = document.getElementById('chat-box');
    const userMessageDiv = document.createElement('div');
    userMessageDiv.classList.add('user-message');
    userMessageDiv.innerHTML = `<strong>You:</strong> ${message}`;
    chatBox.appendChild(userMessageDiv);
}

function addBotMessage(message) {
    const chatBox = document.getElementById('chat-box');
    const botMessageDiv = document.createElement('div');
    botMessageDiv.classList.add('bot-message');
    botMessageDiv.innerHTML = `<strong>Bot:</strong> ${message}`;
    chatBox.appendChild(botMessageDiv);
}

function getBotResponse(userMessage) {
    // Replace this with your own logic to generate bot responses
    const botResponse = "Hello";
    addBotMessage(botResponse);
}

function sendTextToPython() {
        const inputText = "test";
        
        fetch('/send_text', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ text: inputText }),
        })
        .then(response => response.json())
        .then(data => {
            console.log('Server response:', data.message);
            addBotMessage(data.text);
        })
        .catch(error => {
            console.error('Error:', error);
        });
}