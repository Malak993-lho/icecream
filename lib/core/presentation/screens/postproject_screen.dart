import 'package:flutter/material.dart';
import 'package:senior_project/core/widgets/title_input.dart'; // Import title input widget
import 'package:senior_project/core/widgets/description_input.dart'; // Import description input widget
import 'package:senior_project/core/widgets/post_button.dart'; // Import post button widget

class PostProjectScreen extends StatefulWidget {
  const PostProjectScreen({super.key});

  @override
  _PostProjectScreenState createState() => _PostProjectScreenState();
}

class _PostProjectScreenState extends State<PostProjectScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Project"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project header
            Text(
              "Post your Project",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 16),

            // Title Input widget
            TitleInput(titleController: titleController),

            const SizedBox(height: 16),

            // Description Input widget
            DescriptionInput(descriptionController: descriptionController),

            const SizedBox(height: 16),

            // Post Button widget
            PostButton(
              titleController: titleController,
              descriptionController: descriptionController,
            ),
          ],
        ),
      ),
    );
  }
}
