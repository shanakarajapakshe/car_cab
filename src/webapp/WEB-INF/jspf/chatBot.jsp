<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chatbot - Mega City Cab</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f4f4f4;
        }
        .chat-container {
            width: 400px;
            margin: 50px auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .chat-box {
            height: 300px;
            overflow-y: auto;
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        .user-input {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            margin-top: 10px;
            padding: 10px;
            background: blue;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="chat-container">
    <h2>Chatbot - Mega City Cab</h2>
    <div class="chat-box" id="chat-box">
        <p><strong>Bot:</strong> Hi! How can I assist you?</p>
    </div>
    <input type="text" id="user-input" class="user-input" placeholder="Ask a question...">
    <button onclick="sendMessage()">Send</button>
</div>

<script>
    class Chatbot {
        constructor() {
            this.responses = {
                "login": "To log in, enter your username and password, then click 'Login'. If you forget your password, click 'Forgot Password?'.",
                "booking": "To book a cab, go to 'New Booking', enter your details, and click 'Submit'.",
                "view booking": "To view a booking, go to 'View Bookings', enter the booking number, and click 'Search'.",
                "billing": "To calculate a bill, go to 'Billing', enter the booking number, and click 'Calculate Bill'.",
                "car management": "To manage cars, go to 'Car Management' and add, update, or remove details.",
                "driver management": "To manage drivers, go to 'Driver Management' and update details as needed.",
                "logout": "Click 'Logout' to securely exit the system.",
                "help": "You can ask about login, booking, billing, car management, driver management, and more!"
            };
        }

        getResponse(input) {
            input = input.toLowerCase();
            for (let key in this.responses) {
                if (input.includes(key)) {
                    return this.responses[key];
                }
            }
            return "I'm sorry, I didn't understand that. Try asking about login, booking, billing, or management.";
        }
    }

    const chatbot = new Chatbot();
    function sendMessage() {
        let userInput = document.getElementById("user-input").value;
        let chatBox = document.getElementById("chat-box");

        if (userInput.trim() === "") return;

        chatBox.innerHTML += `<p><strong>You:</strong> ${userInput}</p>`;
        let botResponse = chatbot.getResponse(userInput);
        chatBox.innerHTML += `<p><strong>Bot:</strong> ${botResponse}</p>`;

        document.getElementById("user-input").value = "";
        chatBox.scrollTop = chatBox.scrollHeight;
    }
</script>
</body>
</html>