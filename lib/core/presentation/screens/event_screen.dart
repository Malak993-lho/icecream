import 'package:flutter/material.dart';

class EventConfirmationScreen extends StatefulWidget {
  final DateTime date;
  final String time;

  EventConfirmationScreen({required this.date, required this.time});

  @override
  _EventConfirmationScreenState createState() => _EventConfirmationScreenState();
}

class _EventConfirmationScreenState extends State<EventConfirmationScreen> {
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Confirmation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date: ${widget.date.toLocal()}'),
            Text('Time: ${widget.time}'),
            const SizedBox(height: 20),

            // Title input field
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Event Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Reminder functionality
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Reminder set for the event")),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                  ),
                  child: const Text("Remind Me", style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Store event title and navigate back to Calendar
                    String eventTitle = titleController.text;
                    if (eventTitle.isNotEmpty) {
                      Navigator.pop(context, eventTitle); // Pass the title back to Calendar
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text("Confirm", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Delete Event button
            ElevatedButton(
              onPressed: () {
                // Perform event deletion logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Event deleted")),
                );
                Navigator.pop(context); // Go back to the previous screen and delete
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text("Delete Event", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
