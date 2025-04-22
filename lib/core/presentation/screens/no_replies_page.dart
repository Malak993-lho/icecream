import 'package:flutter/material.dart';

class NoRepliesPage extends StatelessWidget {
  const NoRepliesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('No Replies'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.sentiment_dissatisfied,
                size: 50,
                color: Colors.grey,
              ),
              SizedBox(height: 20),
              Text(
                'There are no replies yet.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
