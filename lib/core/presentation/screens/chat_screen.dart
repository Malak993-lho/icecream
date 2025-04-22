import 'package:flutter/material.dart';
import 'package:senior_project/core/widgets/message_input.dart'; // Import MessageInput widget
import 'package:senior_project/core/widgets/message_list.dart'; // Import MessageList widget

class ChatScreen extends StatefulWidget {
  final String userName;

  const ChatScreen({super.key, required this.userName});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _messageController = TextEditingController();
  List<Map<String, String>> messages = [
    {
      "sender": "Wassim Ibrahim",
      "message": "Hello, Wassim! I heard you're an experienced metalworker. I need some help with a custom metal gate for my house.",
      "time": "Sent 5m ago",
      "senderType": "sender"
    },
    {
      "sender": "Sara Abu Khurj",
      "message": "Hi there! Yes, I specialize in custom metalwork. Can you tell me more about what you're looking for?",
      "time": "Sent 4m ago",
      "senderType": "receiver"
    },
    {
      "sender": "Wassim Ibrahim",
      "message": "Sure! I’m thinking of a modern design, about 2.5 meters wide and 2 meters tall, with some decorative patterns. It also needs to be sturdy for security purposes.",
      "time": "Sent 3m ago",
      "senderType": "sender"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              child: Text(widget.userName[0].toUpperCase()), // Display first letter of name
            ),
            SizedBox(width: 10),
            Text(widget.userName),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {
              // Add functionality for the actions if needed
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: MessageList(messages: messages),
            ),
            MessageInput(
              onSend: (message) {
                setState(() {
                  messages.add({
                    "sender": "You",
                    "message": message,
                    "time": "Sent now",
                    "senderType": "sender",
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
