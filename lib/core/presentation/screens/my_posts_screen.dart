import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/core/provider/task_provider.dart'; // Import TaskProvider
import 'package:senior_project/core/presentation/screens/task_details_screen.dart'; // <-- You need to create this
import 'dart:io' show File;
import 'package:flutter/foundation.dart' show kIsWeb;


class MyPostsScreen extends StatelessWidget {
  const MyPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>(); // Watch for tasks

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Posts"),
      ),
      body: taskProvider.tasks.isEmpty
          ? const Center(child: Text("No tasks yet!"))
          : ListView.builder(
              itemCount: taskProvider.tasks.length,
              itemBuilder: (context, index) {
                final task = taskProvider.tasks[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: GestureDetector(
                    onTap: () {
                      // ✅ Navigate to details screen when card tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TaskDetailsScreen(task: task),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            // Conditionally show the image if imagePath is not empty
                            if (task.imagePath.isNotEmpty)
  ClipRRect(
    borderRadius: BorderRadius.circular(8),
    child: kIsWeb
        ? Image.network(
            task.imagePath,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                const Icon(Icons.broken_image, size: 80),
          )
        : Image.file(
            File(task.imagePath),
            width: 80,
            height: 80,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                const Icon(Icons.broken_image, size: 80),
          ),
  )
else
  const SizedBox(width: 80),


                            const SizedBox(width: 15),

                            // Task details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    task.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    task.description,
                                    style: const TextStyle(color: Colors.grey),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Start: ${task.startDate.toString().substring(0, 10)}",
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "End: ${task.endDate.toString().substring(0, 10)}",
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
