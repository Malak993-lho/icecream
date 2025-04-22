import 'package:flutter/material.dart';
import 'package:senior_project/core/widgets/task.dart';
import 'package:senior_project/core/widgets/comment_tile.dart';

class TaskDetailsScreen extends StatefulWidget {
  final Task task;

  const TaskDetailsScreen({super.key, required this.task});

  @override
  _TaskDetailsScreenState createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  TextEditingController commentController = TextEditingController();

  // Function to add a comment to the task
  void _addComment() {
    if (commentController.text.isNotEmpty) {
      setState(() {
        widget.task.comments.add(Comment(
          user: 'User', // Replace with dynamic username
          content: commentController.text,
          replies: [],
        ));
        commentController.clear();
      });
    }
  }

  // Callback to add a reply to a specific comment
  void _addReply(Comment comment, String reply) {
    setState(() {
      comment.replies.add(reply);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.task.imagePath.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.task.imagePath,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.broken_image, size: 100),
                ),
              ),
            const SizedBox(height: 16),

            // Task Info Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.task.title,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(widget.task.description, style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text("Start: ${widget.task.startDate.toLocal().toString().split(' ')[0]}"),
                    Text("End: ${widget.task.endDate.toLocal().toString().split(' ')[0]}"),
                    const SizedBox(height: 8),
                    Text("Purchase Range: \$${widget.task.purchaseRange.toStringAsFixed(2)}", style: const TextStyle(fontSize: 16)),
                    const Divider(height: 30),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Comments Section
            const Text("Comments", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...widget.task.comments.map((comment) {
              return CommentTile(
                comment: comment,
                onReplyAdded: _addReply, // Pass the callback
              );
            }).toList(),

            const SizedBox(height: 20),

            // Add Comment Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: commentController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Write a comment...",
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _addComment, // Call to add comment
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
